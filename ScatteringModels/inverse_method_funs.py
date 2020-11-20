
""" Module containing functions to read files from model simulations, asses measured values and more."""

import numpy as np
import pandas as pd
import array as arr



def read_widebandfrequencyresponse(fname,header = 9, extracols = 1):
    """"Opens a file created by the wideband frequency response graph 
    export file. Returns a matrix containing the frequency array and 
    the volume backscattering coefficient.
    
    Parameters:
    fname: filename with path of EV export from wideband frequency response plot - graph- export
    header: the number of lines in the header information (the default is 9.)
    extracols: The columns without backscatter information. Typically information on fileset. (The default is 1.)
    
    Returns:
    freqs: array of frequencies
    sv: array of volume backscatter coefficient values
    """
    
    freq_response_csv = pd.read_csv(fname,header=header)
    freq_response = freq_response_csv.to_numpy()
    # Remove fileset column
    freq_resp = freq_response[:,:-2]
    
    #Calculate volume backscatter coefficient.
    freqs = freq_resp[:,0]
    sv = 10**(freq_resp[:,1:]/10)
    
    freqs = arr.array('d', freqs)
    
    return freqs, sv
    
    
def read_scatteringmodelsimulations(fname,nsim):
    """"Opens a file created by R for ZooScatR containing all the information of the model runs. 
    Extract the frequencies, species and cross-sectional backscatter data.
    
    Parameters:
    fname: filename with path of EV export from wideband frequency response plot - graph- export
    nsim: number of simulations

    
    Returns:
    spec: array of name of species
    freqs: array of frequencies
    sigma_bs: array of cross-sectional backscatter simulation values shape is [frequencies, simulations, species]
    """
    simulations = pd.read_feather(fname)
    # Add a row for sigma_bs calculated from TS
    simulations['sigbs'] = 10**(simulations.TS/10)
    
    # Set dimensions and their values
    freqs = simulations['freq'].unique()
    specs = simulations['spec'].unique()
    
    # Allocate space
    sigma_bs_all = np.zeros([len(freqs), nsim, len(specs)])
    sigma_bs_mean = np.zeros([len(freqs), len(specs)])
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
        
        for ind_freq in range(0, len(freqs)):
            sigma_bs_all[ind_freq,:,ind_spec] = sim_spec[ind_freq]
    
    return specs, freqs, sigma_bs_all, sigma_bs_mean
