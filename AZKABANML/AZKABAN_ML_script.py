# -*- coding: utf-8 -*-
"""
Created on Tue May 31 12:52:32 2022
@author: Chelsey McGowan-Yallop, SAMS-UHI (sa06cm@sams.ac.uk)
Modified 12.01.2023 Muriel Dunn

This script uses model-predicted TS(f) spectra to train a machine learning
classifier, performs nested cross-validation, applies the classifier to
measured TS(f) spectra and outputs results files.

To use a different classifier, see the list of supported classifiers at:
https://github.com/hyperopt/hyperopt-sklearn and set as clf.

Sometimes the initial hyperparameter configuration selected by HyperOpt in each
split in the outer loop will be unsuccessful and all trials will fail. The
retry decorator forces it to try again until retry_limit is reached.

OUTPUT FILES:
    _NestedCV.pkl contains results of nested cross-validation procedure
    _Predictions.pkl contains measured TS(f) spectra with predicted labels
    _BestParams.pkl contains the optimal hyperparameters for the model
"""

import time
import os.path
import numpy as np
import pandas as pd
import pickle
import scipy
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import f1_score, confusion_matrix
#from sklearn.neighbors import KNeighborsClassifier
import hyperopt
from hyperopt import tpe
from hpsklearn import HyperoptEstimator, k_neighbors_classifier, svc, lightgbm_classification
import lightgbm
from datetime import timedelta
from tenacity import retry, stop_after_attempt

import sys, errno  


# -- USER-DETERMINED PARAMETERS -----------------------------------------------
path = 'F:/Nya-AZKABAN/AZKABAN-fish2022/'

# CLASSIFIER
unique_id = '2023-01-06_kNN_AZKABAN' # Unique ID for output file paths
clf = k_neighbors_classifier(unique_id)   # Classifier

# NESTED CROSS-VALIDATION
preprocessing = [] # List of sklearn pre-processing modules
ex_preprocessing = [] # As above, see help(HyperoptEstimator) for info
n_splits = 10 # Value of k for k-fold cross-validation in outer loop
n_folds = 10 # Value of k for k-fold cross-validation in inner loop
max_evals = 50 # No. of HyperOpt trials
timeout = 300 # HyperOpt trial timeout (seconds)
n_jobs = -1 # No. of jobs to run in parallel; -1 uses all processors
retry_limit = 10 # No. of times to retry before failing


# -- PUT THE FUN IN FUNCTIONS -------------------------------------------------
@retry(stop=stop_after_attempt(retry_limit))
def nested_cv(X, y, model, n_splits, n_folds, unique_id):
    
    """
    This function performs nested cross-validation with Bayesian hyperparameter
    optimisation. It uses stratified k-fold cross-validation in both the inner
    and outer loops. After each outer loop, it outputs the results to a .pkl
    file. As there is an element of randomness to the optimisation procedure,
    sometimes all trials will fail. If you re-run the script, it will import
    the incomplete .pkl file and try again.
    
    Note that this is a modified version that uses F1 score as the evaluation
    metric. It also calculates class-specific F1 scores and confusion matrices,
    which are added to the output dataframe.
    
    PARAMETERS:
        X: data minus labels
        y: labels
        model: HyperoptEstimator object
        n_splits: # of splits to use in outer K-fold cross-validation
        n_folds: # of folds to use in inner K-fold cross-validation
        unique_id: Unique name string for file output path
    """
    
    cv = StratifiedKFold(n_splits=n_splits,
                         shuffle=True,
                         random_state=42) # Outer CV
    
    i_start = 0
    i_list = []
    results_df = None
    cv_path = unique_id + '_NestedCV.pkl'
        
    if os.path.isfile(cv_path) == True: # If CV is incomplete, resume
        results_df = pd.read_pickle(cv_path)
        i_start = results_df.Outer_fold.max() + 1
        print('Resuming cross-validation from fold ' + str(i_start + 1))
        
    # Generate indices to split data by StratifiedKFold
    # Append indices for each fold to list    
    for tr_i, te_i in cv.split(X,y):
        i_list.append([tr_i, te_i])
    
    # For each fold...
    for i in range(i_start, len(i_list)):
        results_list = []
        print('Beginning fold ' + str(i+1) + ' of ' + str(len(i_list)))
        
        # Split data into training and test tests
        X_train = X.loc[X.index.intersection(i_list[i][0])]
        y_train = y.loc[y.index.intersection(i_list[i][0])]
        X_test = X.loc[X.index.intersection(i_list[i][1])]
        y_test = y.loc[y.index.intersection(i_list[i][1])]

        start = time.time()
        
        # Fit the HyperoptEstimator to training data (optimise model)
        model.fit(X_train,
                  y_train,
                  n_folds=n_folds, # Inner stratified k-fold CV
                  cv_shuffle=True)
        
        end = time.time()
        duration = end - start

        # Use optimised model to predict labels for test data
        y_pred = model.predict(X_test)
        score = f1_score(y_test, y_pred, average='weighted') # Evaluate
        
        # Everything below: formats and/or calculates results for output file
        sorted_labels = np.sort(y_test.unique())
        unweighted_score = f1_score(y_test, y_pred,
                                    average=None,
                                    labels=sorted_labels)
        c_matrix = confusion_matrix(y_test, y_pred,
                                    labels=sorted_labels)

        for trial in range(len(model.trials.trials)):
                if model.trials.trials[trial].get('result').get('status') == 'ok':
                    trial_loss = model.trials.trials[trial].get('result').get('loss')
                    trial_duration = model.trials.trials[trial].get('result').get('duration')
                else:
                    trial_loss = np.nan
                    trial_duration = np.nan
            
                results_list.append([i,
                                     score,
                                     unweighted_score,
                                     le.inverse_transform(sorted_labels),
                                     c_matrix,
                                     duration,
                                     trial,
                                     trial_loss,
                                     trial_duration])
        
        append_df = pd.DataFrame(results_list,
                                 columns=['Outer_fold',
                                          'Outer_score',
                                          'Outer_unweighted_scores',
                                          'Outer_unweighted_score_labels',
                                          'Outer_confusion_matrix',
                                          'Outer_training_duration',
                                          'Trial',
                                          'Trial_loss',
                                          'Trial_duration'])
        if i == i_start:
            if results_df is not None:
                final_df = pd.concat([results_df,
                                      append_df],
                                      ignore_index=True)
            else:
                final_df = append_df
            final_df.to_pickle(cv_path)
        
        else:
            results_df = pd.read_pickle(cv_path)
            final_df = pd.concat([results_df,
                                  append_df],
                                  ignore_index=True)
            final_df.to_pickle(cv_path)
     
    
def f1_loss(y_true, y_pred):
    """
    Custom loss function for HyperOpt.
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    return 1.0 - f1_score(y_true, y_pred, average='weighted')
    
def main():    

    ""
    #path: srt. path to dataframes
    #detections: str. Type of detections, SED, trackSED or trackavg.
    
    detections = 'SED'
    path = './'

    # -- IMPORT FILES ---------------------------------------------------------
    if detections == 'SED':
        labelled_df = pd.read_pickle(path+'single_SED_df.pkl')
        mix_df = pd.read_pickle(path+'fm_SED_df.pkl')

    elif detections == 'trackSED':
        labelled_df = pd.read_pickle(path+'single_trackSED_df.pkl')
        mix_df = pd.read_pickle(path+'fm_trackSED_df.pkl')

    else:
        labelled_df = pd.read_pickle(path+'single_trackavg_df.pkl')
        mix_df = pd.read_pickle(path+'fm_trackavg_df.pkl')

    # -- RESTRUCTURE MODEL DATA -----------------------------------------------

    measured_frequency = [float(i) for i in mix_df.columns.values]
    n_model_f_bins = len(measured_frequency) # No. freq bins in model data
    n_species = len(labelled_df.Species.unique()) # No. species in model data

    # -- WRANGLE DATA ---------------------------------------------------------

    le = LabelEncoder() # Maps labels -> int (e.g. Copepods -> 0, Krill -> 1)
    labelled_df['Species_le'] = le.fit_transform(labelled_df.Species)
    X = labelled_df.iloc[:,14+1:-15-2] # Features, TS(f) only
    y = labelled_df.Species_le # Labels


    measured_X = mix_df # Features, TS(f) only

    # -- NESTED CROSS-VALIDATION ----------------------------------------------

    model = HyperoptEstimator(classifier = clf,
                              preprocessing = preprocessing,
                              ex_preprocs = ex_preprocessing,
                              algo = tpe.suggest,
                              trial_timeout = timeout,
                              loss_fn = f1_loss,
                              max_evals = max_evals,
                              n_jobs = n_jobs)
    model

    nested_cv(X, y, model, n_splits, n_folds, unique_id)

    # -- RETRAIN MODEL --------------------------------------------------------

    print('Retraining model on full dataset')

    model = HyperoptEstimator(classifier = clf,
                              preprocessing = preprocessing,
                              ex_preprocs = ex_preprocessing,
                              algo = tpe.suggest,
                              trial_timeout = timeout,
                              loss_fn = f1_loss,
                              max_evals = max_evals,
                              n_jobs = n_jobs)

    model.fit(X, y, n_folds=n_folds, cv_shuffle=True)

    # -- PREDICT CLASSES FOR NEW DATA -----------------------------------------

    print('Classifying new data')

    y_pred = model.predict(measured_X) # Predict classes for measured TS(f)
    y_pred = le.inverse_transform(y_pred) # Transform labels back to species

    # -- OUTPUT RESULTS -------------------------------------------------------

    mix_df['Prediction'] = y_pred
    mix_df.to_pickle(unique_id + '_Predictions.pkl')

    with open(unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)

        
main()
