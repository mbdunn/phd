import time
import os.path
import numpy as np
import pandas as pd
import pickle
import scipy
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import StratifiedKFold, GroupKFold
from sklearn.metrics import f1_score, confusion_matrix
#from sklearn.neighbors import KNeighborsClassifier
import hyperopt
from hyperopt import tpe
from hpsklearn import HyperoptEstimator, k_neighbors_classifier, svc, lightgbm_classification, gaussian_nb, any_preprocessing
import lightgbm
from datetime import timedelta, date
from tenacity import retry, stop_after_attempt

import sys, errno

def tsf_targets_import(file_path):

    """
    This function imports wideband frequency response .csv files exported from
    Echoview and performs some basic housekeeping.
    PARAMETERS:
        file_path: Path to wideband frequency response .csv file from Echoview.

    RETURNS:
        df: Pandas dataframe.
    """
    def get_datetime(df, avg_flag):
        """
        Convert Echoview timestamps in imported .csv to datetime.
        """
        if avg_flag:
            df['Ping_microseconds_start'] = df.Ping_millisecond_start * 1000
            df['Ping_microseconds_start'] = [timedelta(microseconds = i) for i in df['Ping_microseconds_start']]
            df['Datetime'] = df['Ping_date_start_Ping_time_start'] + df['Ping_microseconds_start']
            df.drop(columns=['Ping_date_start_Ping_time_start',
                             'Ping_millisecond_start',
                             'Ping_microseconds_start'],
                    inplace=True)
        else:
            df['Ping_microseconds'] = df.Ping_milliseconds * 1000
            df['Ping_microseconds'] = [timedelta(microseconds = i) for i in df['Ping_microseconds']]
            df['Datetime'] = df['Ping_date_Ping_time'] + df['Ping_microseconds']
            df.drop(columns=['Ping_date_Ping_time',
                             'Ping_milliseconds',
                             'Ping_microseconds'],
                    inplace=True)
        return df
    if "trackavg.csv" in file_path:
        parse_cols = ['Ping_date_start', 'Ping_time_start']
        ind_col = None
        avg_flag = True
        transpose = True
    elif "target" in file_path:
        parse_cols = ['Ping_date', 'Ping_time']
        ind_col = None
        avg_flag = False
        transpose = False
    else:
        parse_cols = ['Ping_date', 'Ping_time']
        ind_col = 'Target_index'
        avg_flag = False
        transpose = True
    if transpose:
        transposed_path = file_path[:-4] + '_transposed.csv'
        if os.path.isfile(transposed_path) == True:
            df = pd.read_csv(transposed_path,
                             index_col=ind_col,
                             skiprows=1,
                             skipfooter=2,
                             engine='python',
                             parse_dates=[parse_cols])
        else:
            df = pd.read_csv(file_path, low_memory=False).T
            file_path = transposed_path
            df.to_csv(path_or_buf=file_path)
            print('A transposed TS(f) file was created at: \n' + str(file_path))
            df = pd.read_csv(file_path,
                             index_col=ind_col,
                             skiprows=1,
                             skipfooter=2,
                             engine='python',
                             parse_dates=[parse_cols])
    else:
        df = pd.read_csv(file_path,
                 index_col=ind_col,
                 skiprows=0,
                 skipfooter=2,
                 engine='python',
                 parse_dates=[parse_cols])
    df = get_datetime(df, avg_flag)
    return df


@retry(stop=stop_after_attempt(10))
def nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path, kfold="Stratified", group=None):
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
        kfold = type of kFold, default is Stratified, other option is GroupSplit to reduce the bias from training and testing with targets from the same track
    Written by Chelsey McGowan-Yallop, Modified by Muriel Dunn
    """
    if kfold == "Stratified":
        cv = StratifiedKFold(n_splits=n_splits,
                            shuffle=True,
                            random_state=42) # Outer CV
    elif kfold == "GroupSplit":
                cv = GroupKFold(n_splits=n_splits) # Outer CV

    i_start = 0
    i_list = []
    results_df = None
    cv_path = path + unique_id + '_NestedCV.pkl'

    if os.path.isfile(cv_path) == True: # If CV is incomplete, resume
        results_df = pd.read_pickle(cv_path)
        i_start = results_df.Outer_fold.max() + 1
        print('Resuming cross-validation from fold ' + str(i_start + 1))

    # Generate indices to split data by StratifiedKFold
    # Append indices for each fold to list
    if kfold == "Stratified":
        for tr_i, te_i in cv.split(X,y):
            i_list.append([tr_i, te_i])
    elif kfold == "GroupSplit":
        for tr_i, te_i in cv.split(X,y, group):
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

def main_classify(df, clf, unique_id,path, preprocessing=[],  ex_preprocessing=[], timeout=300, n_jobs=-1, max_evals=50, n_splits = 10,
n_folds = 10):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """

    # -- WRANGLE DATA ---------------------------------------------------------
    df_train = df.loc[:,:].copy()

    le = LabelEncoder() # Maps labels -> int (e.g. Atlantic cod -> 0, Polar cod -> 1)
    df_train['Species_le'] = le.fit_transform(df_train.Species)
    X = df_train.iloc[:,:-2].to_numpy() # Features, TS(f) only
    y = df_train.loc[:,'Species_le'].to_numpy() # Labels

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

    nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path)

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

    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return

def print_F1_mean(classifier):
    cv_df = classifier['cv_df']

    print('Mean class-weighted F1 score for : '
          + str(round(cv_df.Outer_score.mean(), 2))
          + ' ± '
          + str(round(cv_df.Outer_score.std(), 2)))

    mean_class_scores = np.mean(np.vstack(cv_df.Outer_unweighted_scores.values), axis=0)
    std_class_scores = np.std(np.vstack(cv_df.Outer_unweighted_scores.values), axis=0)

    for i, species in enumerate(cv_df.Outer_unweighted_score_labels.values[0]):
        print('Mean F1 score for ' + species + ': '
             + str(round(mean_class_scores[i], 2))
             + ' ± '
             + str(round(std_class_scores[i], 2)))

def read_results(unique_id ,classifypath):
    ' read the classifier results and predictions from the selected classifier'

    main_path = f'{classifypath}/{unique_id}'
    cv_path = '_NestedCV.pkl'
    best_params = '_BestParams.pkl'
    #pred_path = '_Predictions.pkl'

    # Load dataframes
    cv_df = pd.read_pickle(main_path + cv_path) # Nested CV results
    best_params = pd.read_pickle(main_path + best_params)
    #pred_df = pd.read_pickle(main_path+pred_path)

    return {'name':unique_id, 'cv_df':cv_df, 'best_params':best_params}#,  'pred_df':pred_df,}


def main_classify_test(df, df_new, clf, unique_id,path, preprocessing=[],  ex_preprocessing=[], timeout=300, n_jobs=-1, max_evals=50, n_splits = 10, n_folds = 10):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    # -- WRANGLE DATA ---------------------------------------------------------
    df_train = df.loc[:,:].copy()

    le = LabelEncoder() # Maps labels -> int (e.g. Atlantic cod -> 0, Polar cod -> 1)
    df_train['Species_le'] = le.fit_transform(df_train.Species)
    X = df_train.iloc[:,:-2].to_numpy() # Features, TS(f) only
    y = df_train.loc[:,'Species_le'].to_numpy() # Labels

# -- WRANGLE TEST DATA ---------------------------------------------------------
    measured_X = df_new


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

    nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path)

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

    measured_X['Prediction'] = y_pred
    measured_X.to_pickle(path + unique_id + '_Predictions.pkl')


    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return

def main_classify_test_old(df, df_new, clf, unique_id,path, preprocessing=[],  ex_preprocessing=[], timeout=300, n_jobs=-1, max_evals=50, n_splits = 10, n_folds = 10):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    # -- WRANGLE DATA ---------------------------------------------------------
    df_train = df.loc[:,:].copy()

    le = LabelEncoder() # Maps labels -> int (e.g. Atlantic cod -> 0, Polar cod -> 1)
    df_train['Species_le'] = le.fit_transform(df_train.Species)
    X = df_train.iloc[:,:-2].to_numpy() # Features, TS(f) only
    y = df_train.loc[:,'Species_le'].to_numpy() # Labels

# -- WRANGLE TEST DATA ---------------------------------------------------------
    measured_X = df_new.copy()


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

    nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path)

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

    measured_X['Prediction'] = y_pred
    measured_X.to_pickle(path + unique_id + '_Predictions.pkl')


    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return


def main_classify_all(df, df_SED, df_track, df_trackavg, clf, unique_id,path, preprocessing=[],  ex_preprocessing=[], timeout=300, n_jobs=-1, max_evals=50, n_splits = 10, n_folds = 10):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    # -- WRANGLE DATA ---------------------------------------------------------
    df_train = df.loc[:,:].copy()

    le = LabelEncoder() # Maps labels -> int (e.g. Atlantic cod -> 0, Polar cod -> 1)
    df_train['Species_le'] = le.fit_transform(df_train.Species)
    X = df_train.iloc[:,:-2].to_numpy() # Features, TS(f) only
    y = df_train.loc[:,'Species_le'].to_numpy() # Labels

# -- WRANGLE TEST DATA ---------------------------------------------------------
    measured_XSED = df_SED.copy()
    measured_Xtrack = df_track.copy()
    measured_Xtrackavg = df_trackavg.copy()


    # -- NESTED CROSS-VALIDATION ----------------------------------------------

    model = HyperoptEstimator(classifier = clf,
                              preprocessing = preprocessing,
                              ex_preprocs = ex_preprocessing,
                              algo = tpe.suggest,
                              trial_timeout = timeout,
                              loss_fn = f1_loss,
                              max_evals = max_evals,
                              n_jobs = n_jobs)

    nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path)

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

    y_predSED = model.predict(measured_XSED) # Predict classes for measured TS(f)
    y_predSED = le.inverse_transform(y_predSED) # Transform labels back to species

    y_predtrack = model.predict(measured_Xtrack) # Predict classes for measured TS(f)
    y_predtrack = le.inverse_transform(y_predtrack) # Transform labels back to species

    y_predtrackavg = model.predict(measured_Xtrackavg) # Predict classes for measured TS(f)
    y_predtrackavg = le.inverse_transform(y_predtrackavg) # Transform labels back to species

    # -- OUTPUT RESULTS -------------------------------------------------------

    measured_XSED['Prediction'] = y_predSED
    measured_Xtrack['Prediction'] = y_predtrack
    measured_Xtrackavg['Prediction'] = y_predtrackavg
    measured_XSED.to_pickle(path + unique_id + '_Predictions_SED.pkl')
    measured_Xtrack.to_pickle(path + unique_id + '_Predictions_track.pkl')
    measured_Xtrackavg.to_pickle(path + unique_id + '_Predictions_trackavg.pkl')


    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return

def read_results_all(unique_id ,classifypath):
    ' read the classifier results and predictions from the selected classifier'

    main_path = f'{classifypath}/{unique_id}'
    cv_path = '_NestedCV.pkl'
    best_params = '_BestParams.pkl'
    predSED_path = '_Predictions_SED.pkl'
    predtrack_path = '_Predictions_track.pkl'
    predtrackavg_path = '_Predictions_trackavg.pkl'

    # Load dataframes
    cv_df = pd.read_pickle(main_path + cv_path) # Nested CV results
    best_params = pd.read_pickle(main_path + best_params)
    predSED_df = pd.read_pickle(main_path+predSED_path)
    predtrack_df = pd.read_pickle(main_path+predtrack_path)
    predtrackavg_df = pd.read_pickle(main_path+predtrackavg_path)

    return {'name':unique_id, 'cv_df':cv_df, 'best_params':best_params,  'predSED_df':predSED_df, 'predtrack_df':predtrack_df, 'predtrackavg_df':predtrackavg_df,}

def main_classify_group(df, clf, unique_id,path, group, preprocessing=[],  ex_preprocessing=[], timeout=300, n_jobs=-1, max_evals=50, n_splits = 10, n_folds = 10, ):
    """
    Function to run nested cross validation then apply fit to whole dataset
    Uses F1 score instead of accuracy score, as the latter is inappropriate
    for multi-class classification.
    """
    # -- WRANGLE DATA ---------------------------------------------------------
    df_train = df.loc[:,:].copy()

    le = LabelEncoder() # Maps labels -> int (e.g. Atlantic cod -> 0, Polar cod -> 1)
    df_train['Species_le'] = le.fit_transform(df_train.Species)
    X = df_train.iloc[:,:-2].to_numpy() # Features, TS(f) only
    y = df_train.loc[:,'Species_le'].to_numpy() # Labels

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

    nested_cv(X, y, model, n_splits, n_folds, unique_id, le, path, kfold="GroupSplit", group=group)

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

    with open(path + unique_id + '_BestParams.pkl', 'wb') as handle:
        pickle.dump(model.best_model(), handle)
    return

def print_F1_mean(classifier):
    cv_df = classifier['cv_df']

    print('Mean class-weighted F1 score for : '
          + str(round(cv_df.Outer_score.mean(), 2))
          + ' ± '
          + str(round(cv_df.Outer_score.std(), 2)))

    mean_class_scores = np.mean(np.vstack(cv_df.Outer_unweighted_scores.values), axis=0)
    std_class_scores = np.std(np.vstack(cv_df.Outer_unweighted_scores.values), axis=0)

    for i, species in enumerate(cv_df.Outer_unweighted_score_labels.values[0]):
        print('Mean F1 score for ' + species + ': '
             + str(round(mean_class_scores[i], 2))
             + ' ± '
             + str(round(std_class_scores[i], 2)))
