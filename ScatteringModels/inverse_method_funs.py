
""" Module containing functions to read files from model simulations, asses measured values and more."""

import numpy as np
import pandas as pd
import array as arr
from scipy.interpolate import UnivariateSpline
from sklearn.utils import resample
import json
from datetime import datetime

def read_widebandfrequencyresponse(fname, header=0, extracols = 1, source='Echoview'):
    """"Opens a file created by the wideband frequency response graph 
    export file. Returns a matrix containing the frequency array and 
    the volume backscattering coefficient.
    
    Parameters:
    fname: filename with path of EV export from wideband frequency response plot - graph- export
    header: the number of lines in the header information (the default is 9.)
    extracols: The columns without backscatter information. Typically information on fileset. (The default is 1.)
    source: File export program. LSSS or Echoview (default)
    
    Returns:
    freqs: array of frequencies
    sv: array of volume backscatter coefficient values
    """
    if source=='Echoview':
        wideband_extract = pd.read_csv(fname, header=0, index_col = 0)
        data = wideband_extract.T

        # Extract time
        times = np.array([])
        ntimes = len(data.index)-2
        for ind in range(0,ntimes):
            times = np.append(times, datetime.strptime('%s %s' %(data['Ping_date'][ind],data['Ping_time'][ind]), '%Y-%m-%d %H:%M:%S'))

        # Extract sv and frequencies
        Sv_resp = data.to_numpy()[:-2,8:]
        Sv_resp_array = np.array(Sv_resp.T, dtype=float)

        #Calculate volume backscatter coefficient.
        freqs = np.array(data.columns[8:], dtype=float)
        sv = 10**(Sv_resp_array/10)
        
        
    if source=='LSSS':
        json_file = open(fname)
        freq_response_lsss = json.load(json_file)
        ping_lsss = freq_response_lsss['regions'][0]['pings']
        
        # Set up frequency array
        min_freq = ping_lsss[0]['channels'][0]['minFrequency']
        max_freq = ping_lsss[0]['channels'][0]['maxFrequency']
        num_freqs = ping_lsss[0]['channels'][0]['numFrequencies']
        freqs = np.linspace(min_freq,max_freq,num_freqs)
        Sv = np.zeros([len(freqs), len(ping_lsss)])
        for ind in range(0,len(ping_lsss)):
            Sv[:,ind]=ping_lsss[ind]['channels'][0]['sv']
        sv = 10**(Sv/10)
        
    
    
    return freqs, sv, times
    
    
def read_scatteringmodelsimulations(fname,nsim, ve=False, percentiles = (5,95)):
    """"Opens a file created by R for ZooScatR containing all the information of the model runs. 
    Extract the frequencies, species and cross-sectional backscatter data.
    
    Parameters:
    fname: filename with path of EV export from wideband frequency response plot - graph- export
    nsim: number of simulations
    ve: whether to use model solutions available from viscous elastic model, if species exist in 
        fname, the sigbsmean is replaced with viscous elastic mean results, else a column is added. Default False. 

    
    Returns:
    spec: array of name of species
    freqs: array of frequencies
    sigma_bs_mean: array of mean cross-sectional backscatter simulation values 
    ci_boot: array of bootstraped confidence intervals - 2 values for each frequency of each species
    """
    simulations = pd.read_feather(fname)
    # Add a row for sigma_bs calculated from TS
    simulations['sigbs'] = 10**(simulations.TS/10)
    
    # Set dimensions and their values
    freqs = simulations['freq'].unique()
    specs = simulations['spec'].unique()
    
    # Allocate space
    sigma_bs_mean = np.zeros([len(freqs), len(specs)])
    ci_boot = np.zeros([2, len(freqs), len(specs)])
    #Sort values in sibgs column by species and frequencies
    simulations_group = simulations.groupby(["spec","freq"]).agg({'sigbs':lambda x: arr.array('d', x)})
    
    #for mean output
    simulations_mean = simulations.groupby(["spec","freq"]).agg({'sigbs':'mean'})
    mean_bs = simulations_mean.reset_index('freq')

    #Manually organize into an array
    for ind_spec in range(0, len(specs)):
        spec_name = specs[ind_spec]
        sim_spec = np.asarray(simulations_group.sigbs[spec_name])   
        sigma_bs_mean[:,ind_spec] = mean_bs.loc[spec_name].to_numpy()[:,1]
        
        sigma_bs_mean[:,ind_spec], ci_boot[:,:,ind_spec] = bootstrap_interval(simulations, spec=spec_name, percentiles=percentiles)
        
        
    if ve==True:
        cod_scat = pd.read_csv('../ViscousElasticModel/ve_results/ve_simulations_cod.txt', header=None, delimiter=' ', names=['frequency', 'TS'], skiprows=1)
        cod_scat['sigbs'] = 10**(cod_scat['TS']/10)
        cod_sigbs_ve = cod_scat.groupby(["frequency"]).agg({'sigbs':'mean'})
        mean, cod_ci_ve = bootstrap_interval(cod_scat, spec=False, percentiles=percentiles)
        freqs_cod = cod_scat['frequency'].unique()/1000
        
        #resample frequency and append or replace
        f = UnivariateSpline(freqs_cod,cod_sigbs_ve, k=5)
        f_ci1 = UnivariateSpline(freqs_cod,cod_ci_ve[0,:], k=5)
        f_ci2 = UnivariateSpline(freqs_cod,cod_ci_ve[1,:], k=5)
        # Check if this species is already accounted for in lengths and shape of preallocated result matrices.
        # If yes, put the data where it belongs. If not append
        if (specs=='FishLarvae').any():
            cod_index=np.where(specs=='FishLarvae')
            sigma_bs_mean[:,cod_index[0][0]] = f(freqs)
            ci_boot[0,:,cod_index[0][0]] = f_ci1(freqs)
            ci_boot[1,:,cod_index[0][0]] = f_ci2(freqs)
        else:
            sigma_bs_mean = np.vstack((sigma_bs_mean.T,[f(freqs)]))
            ci1_boot = ci_boot[0,:,:]
            ci2_boot = ci_boot[1,:,:]
            ci1_boot = np.vstack((ci1_boot.T,[f_ci1(freqs)]))
            ci2_boot = np.vstack((ci2_boot.T,[f_ci2(freqs)]))
            sigma_bs_mean = sigma_bs_mean.T
            ci_boot = np.array([ci1_boot.T, ci2_boot.T])
            specs = np.append(specs,'Fish larvae')
        
        
        
        lima_scat = pd.read_csv('../ViscousElasticModel/ve_results/ve_simulations_limacina.txt', header=None, delimiter=' ', names=['frequency', 'TS'], skiprows=1)
        lima_scat['sigbs'] = 10**(lima_scat['TS']/10)
        lima_sigbs_ve = lima_scat.groupby(["frequency"]).agg({'sigbs':'mean'})
        mean, lima_ci_ve = bootstrap_interval(lima_scat, spec=False, percentiles=percentiles)
        freqs_lima = lima_scat['frequency'].unique()/1000
        #resample frequency and append or replace   
        f = UnivariateSpline(freqs_lima,lima_sigbs_ve, k=5)  
        f_ci1 = UnivariateSpline(freqs_lima,lima_ci_ve[0,:], k=5)
        f_ci2 = UnivariateSpline(freqs_lima,lima_ci_ve[1,:], k=5)

        # Check if this species is already accounted for in lengths and shape of preallocated result matrices.
        # If yes, put the data where it belongs. If not append!
        if (specs=='Pteropod').any():
            lima_index = np.where(specs=='Pteropod')
            sigma_bs_mean[:,lima_index[0][0]] = f(freqs)
            ci_boot[0,:,lima_index[0][0]] = f_ci1(freqs)
            ci_boot[1,:,lima_index[0][0]] = f_ci2(freqs)
        else:                    
            sigma_bs_mean = np.vstack((sigma_bs_mean.T,[f(freqs)]))
            ci1_boot = ci_boot[0,:,:]
            ci2_boot = ci_boot[1,:,:]
            ci1_boot = np.vstack((ci1_boot.T,[f_ci1(freqs)]))
            ci2_boot = np.vstack((ci2_boot.T,[f_ci2(freqs)]))
            sigma_bs_mean = sigma_bs_mean.T
            ci_boot = np.array([ci1_boot.T, ci2_boot.T])
            specs = np.append(specs,'Pteropod')                                         
    
    
    return specs, freqs, sigma_bs_mean,ci_boot

def bootstrap_interval(simulations, spec=False, percentiles=(5, 95), n_boots=100):
    """Extract mean and bootstrap a confidence interval for the mean of columns data with freq and sigmabs.
    simulations: dataframe containing all the model runs from scattering models
    spec: string describing the functional group.
    Output is the mean and the bootstrap confidence intervals of the mean.
    """

    
    if spec:
        # Resample , calculate mean repeat n_boot times, then calculate the SPREAD of the MEANS.
        # First, calculate mean for each frequency of the whole sample
        mean = simulations[simulations.spec==spec].groupby(['freq']).mean()['sigbs']
        sigbs = simulations.sigbs[simulations.spec==spec]
        freq = simulations.freq[simulations.spec==spec]
    
    else:
        # First, calculate mean for each frequency of the whole sample
        mean = simulations.groupby(['frequency']).mean()['sigbs']
        sigbs = simulations.sigbs
        freq = simulations.frequency
    
    freqs = np.unique(freq)
    
    # Create our empty array to fill the results
    ci_boot = np.zeros([2, len(freqs)])

    # Resample over each frequency
    for i in range(len(freqs)):
        sigbs_selectfreq = sigbs[freq==freqs[i]]

        # Create our empty array to fill the results              
        bootstrap_means = np.zeros([n_boots])

        # Resample within the values of the selected frequency and calculate the mean
        for ii in range(n_boots):
        # Generate random indices for our data *with* replacement, then take the sample mean
            random_sample = resample(sigbs_selectfreq)
            bootstrap_means[ii] = random_sample.mean(axis=0)

        # Save the percentiles of the bootstraped means for the selected frequency
        ci_boot[:,i] = np.percentile(bootstrap_means, percentiles, axis=0)
    return mean, ci_boot

def sv_smooth_ci(sv, N=1, percentiles=(5,95)):
    """Extract smoothed median and bootstrap a confidence interval for the mean of columns data with freq and sigmabs.
    sv: an array with one column for each curve from one continuum of targets
    N: running mean window. Default N=1.
    Output is the smoothed median sv and the 95% percentiles fo the sv curves.
    """
    # First, calculate mean for each frequency of the whole sample
    mean = np.mean(sv, axis=1) # Benoit Bird and Waluk 2020
    
    # Running mean, first pad with N values then run
    mean_padded = np.pad(mean, (N//2, N-1-N//2), mode='edge')
    mean_smooth = np.convolve(mean_padded, np.ones(N)/N, mode='valid')
    
    # Calculate 95% CI but what is the "best" method for this data?
    ci = np.percentile(sv, percentiles, axis=1)
    #ci = np.std(sv,axis=1) * 1.95 / np.sqrt(np.shape(sv_EV)[1])
    #ci = sns.utils.ci(sv_EV, axis=1)

    return mean_smooth, ci