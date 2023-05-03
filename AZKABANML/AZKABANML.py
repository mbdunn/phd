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
from hpsklearn import HyperoptEstimator, k_neighbors_classifier, svc, lightgbm_classification, gaussian_nb
import lightgbm
from datetime import timedelta, date
from tenacity import retry, stop_after_attempt

import sys, errno  


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
    Written by Chelsey McGowan-Yallop
    """
    
    cv = StratifiedKFold(n_splits=n_splits,
                         shuffle=True,
                         random_state=42) # Outer CV
    
    i_start = 0
    i_list = []
    results_df = None
    cv_path = classifypath + unique_id + '_NestedCV.pkl'
        
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
        X_train = X[i_list[i][0]]
        y_train = y[i_list[i][0]]
        X_test = X[i_list[i][1]]
        y_test = y[i_list[i][1]]

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
        sorted_labels = np.sort(np.unique(y_test))
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
    return
        
            
def f1_loss(y_true, y_pred):
    """
    Custom loss function for HyperOpt.
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    return 1.0 - f1_score(y_true, y_pred, average='weighted')

def main_classify(X, y, clf, unique_id, preprocessing, path=classifypath):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """

    # -- NESTED CROSS-VALIDATION ----------------------------------------------

    model = HyperoptEstimator(classifier = clf,
                              preprocessing = preprocessing,
                              ex_preprocs = ex_preprocessing,
                              algo = tpe.suggest,
                              trial_timeout = timeout,
                              #loss_fn = f1_loss,
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
                              #loss_fn = f1_loss,
                              max_evals = max_evals,
                              n_jobs = n_jobs)

    model.fit(X, y, n_folds=n_folds, cv_shuffle=True)

    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return
