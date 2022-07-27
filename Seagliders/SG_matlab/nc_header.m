% 
% Source:
%            /Users/nbronikowski/Desktop/p6440015.nc
% Format:
%            classic
% Global Attributes:
%            quality_control_version        = 1.12
%            base_station_micro_version     = 4475
%            time_coverage_resolution       = 'PT1S'
%            geospatial_vertical_max        = 219.79
%            mission                        = 8
%            geospatial_lat_units           = 'degrees'
%            geospatial_lon_units           = 'degrees'
%            references                     = 'http://data.nodc.noaa.gov/accession/0092291'
%            seaglider_software_version     = 66.12
%            Metadata_Conventions           = 'Unidata Dataset Discovery v1.0'
%            keywords                       = 'Water Temperature, Conductivity, Salinity, Density, Potential Density, Potential Temperature'
%            summary                        = 'SG644 SG644_POLAR_FRONT_20210516'
%            id                             = 'p6440015_20210517'
%            naming_authority               = 'edu.washington.apl'
%            project                        = 'SG644_POLAR_FRONT_20210516'
%            geospatial_lat_max             = 76.6382
%            uuid                           = 'd51adffc-b707-11eb-9d8e-c81f660ad1ec'
%            source                         = 'Seaglider SG644'
%            standard_name_vocabulary       = 'CF-1.6'
%            file_version                   = 2.71
%            glider                         = 644
%            platform                       = 'glider'
%            instrument                     = 'magnetometer sbe41 contopt wlseaowl '
%            processing_level               = '1.120000'
%            nodc_template_version          = 'NODC_NetCDF_Trajectory_Template_v0.9'
%            featureType                    = 'trajectory'
%            base_station_version           = 2.9
%            keywords_vocabulary            = 'NASA/GCMD Earth Science Keywords Version 6.0.0.0'
%            start_time                     = 1621247159
%            geospatial_lat_min             = 76.6336
%            geospatial_lat_resolution      = 'seconds'
%            time_coverage_start            = '2021-05-17T10:05:25Z'
%            geospatial_vertical_positive   = 'no'
%            date_created                   = '2021-05-17T12:05:03Z'
%            institution                    = 'Applied Physics Lab
%                                             University of Washington
%                                             Seattle, WA'
%            geospatial_lon_max             = 29.934
%            geospatial_lon_min             = 29.9202
%            geospatial_lon_resolution      = 'seconds'
%            geospatial_vertical_resolution = 'centimeter'
%            license                        = 'These data may be redistributed and used without restriction.'
%            date_modified                  = '2021-05-17T12:05:03Z'
%            time_coverage_end              = '2021-05-17T11:05:52Z'
%            Conventions                    = 'CF-1.6'
%            platform_id                    = 'SG644'
%            cdm_data_type                  = 'Trajectory'
%            geospatial_vertical_min        = 0.32868
%            title                          = 'Physical, chemical, and biological data collected from Seaglider SG644 during SG644_POLAR_FRONT_20210516 deployed on 2021-05-17'
%            geospatial_vertical_units      = 'meter'
%            dive_number                    = 15
%            history                        = 'Processing start:
%                                             INFO: MakeDiveProfiles.py(2392): Using auxCompass compass data
%                                             INFO: MakeDiveProfiles.py(2966): Using auxCompass pressure signal
%                                             INFO: MakeDiveProfiles.py(2984): auxPress_yint = -174.621505, $PRESSURE_YINT = -175.040540
%                                             INFO: QC.py(378): Changed (7/954) 6 8 19 23 232 430 444 to QC_PROBABLY_BAD because raw temperature spikes
%                                             INFO: QC.py(383): Changed (11/954) 27 28 945:950 952:954 to QC_PROBABLY_BAD because raw temperature noise spikes
%                                             INFO: QC.py(390): Changed (1/954) 954 to QC_BAD because raw salinity below bound
%                                             INFO: QC.py(421): Changed (3/954) 8 430 952 to QC_PROBABLY_BAD because raw conductivity spikes
%                                             INFO: QC.py(426): Changed (2/954) 953 954 to QC_PROBABLY_BAD because raw conductivity noise spikes
%                                             INFO: QC.py(192): Changed (17/954) 6 8 19 23 27 28 232 430 444 945:950 952 953 to QC_PROBABLY_BAD because changed raw temp implies changed raw salinity
%                                             INFO: QC.py(378): Changed (7/954) 6 8 19 23 232 430 444 to QC_INTERPOLATED because temperature spikes
%                                             INFO: QC.py(383): Changed (11/954) 27 28 945:950 952:954 to QC_INTERPOLATED because temperature noise spikes
%                                             INFO: QC.py(390): Changed (1/954) 954 to QC_BAD because salinity below bound
%                                             INFO: QC.py(401): Changed (1/954) 954 to QC_BAD because bad salinity indicates conductivity issues
%                                             INFO: QC.py(421): Changed (3/954) 8 430 952 to QC_INTERPOLATED because conductivity spikes
%                                             INFO: QC.py(426): Changed (1/954) 953 to QC_INTERPOLATED because conductivity noise spikes
%                                             WARNING: MakeDiveProfiles.py(3582): Mass of vehicle in sg_calib_constants (57282.0) does not match $MASS in log file (57248.0); using sg_calib_constants
%                                             INFO: MakeDiveProfiles.py(3640): Changed (95/954) 404:498 to QC_BAD because slow apogee CT flow
%                                             INFO: MakeDiveProfiles.py(3761): Changed (28/954) 1:28 to QC_BAD because prior to dive start
%                                             INFO: QC.py(510): Changed (2/954) 952 953 to QC_PROBABLY_BAD because bad interpolation anchors
%                                             INFO: QC.py(511): SUGGESTION: 15 bad_conductivity data_points in_between 950 953 % bad interpolation anchors
%                                             INFO: MakeDiveProfiles.py(3869): Changed (124/954) 1:28 404:498 954 to QC_BAD because bad corrected temperature and conductivity suggests bad salinity
%                                             INFO: QC.py(192): Changed (124/954) 1:28 404:498 954 to QC_BAD because changed corrected salin implies changed speed
%                                             INFO: TempSalinityVelocity.py(1197): TSV:  0 3 stalled points 402 403 953
%                                             INFO: TempSalinityVelocity.py(1218): TSV exiting after 2 iterations
%                                             INFO: TempSalinityVelocity.py(1220): Changed (1/954) 952 to QC_PROBABLY_BAD because TS bad extrapolation
%                                             INFO: TempSalinityVelocity.py(1222): Changed (3/954) 402 403 953 to QC_PROBABLY_BAD because stalls avoid thermal-inertia salinity correction
%                                             INFO: TempSalinityVelocity.py(1237): SUGGESTION: 15 interp_salinity data_points in_between 940 950 % suspect thermal-inertia points 943:945
%                                             INFO: QC.py(192): Changed (7/954) 232 945:950 to QC_INTERPOLATED because changed corrected temp implies changed corrected salinity
%                                             INFO: MakeDiveProfiles.py(4029): 124 (13.00%) HDM speeds are QC_BAD; 3 (0.31%) are stalled (954)
%                                             INFO: QC.py(192): Changed (9/954) 232 945:950 952 953 to QC_INTERPOLATED because changed corrected temp implies changed speed
%                                             INFO: MakeDiveProfiles.py(4055): Average estimated final speed: 22.82 cm/s
%                                             INFO: MakeDiveProfiles.py(4058): RMS observed vs. computed w: 1.23 cm/s
%                                             INFO: MakeDiveProfiles.py(4110): Starting sensor extensions data processing
%                                             WARNING: aa4330_ext.py(264): Couldn'd find all variables - nothing to process
%                                             WARNING: aa4831_ext.py(264): Couldn'd find all variables - nothing to process
%                                             INFO: QC.py(192): Changed (4/953) 402 403 951 952 to QC_PROBABLY_BAD because changed salinity implies changed Contros oxygen
%                                             INFO: QC.py(192): Changed (124/953) 1:28 404:498 953 to QC_BAD because changed salinity implies changed Contros oxygen
%                                             INFO: QC.py(192): Changed (7/953) 232 944:949 to QC_INTERPOLATED because changed salinity implies changed Contros oxygen
%                                             INFO: aroft_ext.py(173): Starting sensor_data_processing on file <DataFiles.DataFile instance at 0x7f6a406373f8>
%                                             INFO: aroft_ext.py(197): No ARO-FT data found in Results data - bailing out
%                                             INFO: MakeDiveProfiles.py(4112): Finished sensor extensions data processing
%                                             INFO: MakeDiveProfiles.py(4144): Estimated total flight and drift time: 5142.0s (SM: 376.1s)
%                                             '
% Dimensions:
%            contopt_data_point      = 953
%            trajectory              = 1
%            gc_event                = 40
%            depth_data_point        = 833
%            sg_data_point           = 834
%            magnetometer_data_point = 834
%            wlseaowl_data_point     = 954
%            sbect_data_point        = 954
%            auxCompass_data_point   = 954
%            gps_info                = 3
%            ctd_data_point          = 954
%            string_33               = 33
%            string_41               = 41
%            string_20               = 20
%            string_3                = 3
%            string_36               = 36
%            string_26               = 26
%            string_44               = 44
%            string_42               = 42
%            string_11               = 11
%            string_294              = 294
%            string_9                = 9
%            string_29               = 29
%            string_21               = 21
%            string_30               = 30
%            string_8                = 8
%            string_61               = 61
%            string_17               = 17
%            string_65               = 65
%            string_1                = 1
%            string_99               = 99
%            string_31               = 31
%            string_161              = 161
%            string_14               = 14
%            string_13               = 13
%            string_6                = 6
%            string_166              = 166
%            string_69               = 69
%            string_15               = 15
%            string_12               = 12
%            string_5                = 5
%            string_7                = 7
% Variables:
%     surface_curr_north                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'cm/s'
%                        comment       = 'Northward component of surface current'
%                        standard_name = 'surface_northward_sea_water_velocity'
%     surface_curr_error                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Expected error of surface drift current from GPS'
%     surface_curr_east                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'cm/s'
%                        comment       = 'Eastward component of surface current'
%                        standard_name = 'surface_eastward_sea_water_velocity'
%     start_of_climb_time                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds after dive start when second (positive) apogee pump starts'
%     sg_cal_volmax                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm^3'
%                        comment = 'Maximum displaced volume of the glider'
%     sg_cal_t_j                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_i                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_h                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_g                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_rho0                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'kg/m^3'
%                        comment = 'Typical expected density of seawater for this deployment'
%     sg_cal_mass                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'kg'
%                        comment = 'Mass of the glider'
%     sg_cal_hd_c                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic induced drag factor for given hull shape (1/radians^2 of attack angle)'
%     sg_cal_hd_b                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic drag factor for given hull shape (Pa^(-1/4))'
%     sg_cal_hd_a                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic lift factor for given hull shape (1/degrees of attack angle)'
%     sg_cal_contopt_C_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_6                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_5                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_4                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_3                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_2                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_1                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_0                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_3                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_2                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_1                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_5                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_4                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_3                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_2                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_1                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_j                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_i                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_h                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_g                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_wavelength  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_scaleFactor 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_maxOutput   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_darkCounts  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_wavelength        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_scaleFactor       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_resolution        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_maxOutput         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_darkCounts        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_wavelength 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_scaleFactor
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_resolution 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_maxOutput  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_darkCounts 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     reviewed                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%            Attributes:
%                        comment = 'Whether a scientist has reviewed and approved this profile'
%     magnetic_variation                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'The magnetic variance from true north (degrees)'
%     log__XMS_TOUTs                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__XMS_NAKs                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__SM_DEPTHo                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__SM_ANGLEo                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__CALLS                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_VALID                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_PINGS                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_INHIBIT                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_DEVICE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_W_ADJ_DBAND                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_TIMEOUT                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_PUMP_AD_RATE_SURFACE                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_PUMP_AD_RATE_APOGEE                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_MIN                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_MAXERRORS                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_MAX                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_DBAND                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_CNV                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_BLEED_AD_RATE                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_USE_ICE                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_USE_BATHY                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_UPLOAD_DIVES_MAX                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_UNCOM_BLEED                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_T_WATCHDOG                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_TURN_SAMPINT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_TURN                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_RSLEEP                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_NO_W                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_MISSION                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_LOITER                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_GPS                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_EPIRB                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_DIVE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_BOOST                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_ABORT                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_RADIUS                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_DEFAULT_LON                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_DEFAULT_LAT                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_AUTO_DEFAULT                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_TCM_TEMP                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TCM_ROLL_OFFSET                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TCM_PITCH_OFFSET                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SURFACE_URGENCY_TRY                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SURFACE_URGENCY_FORCE                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SURFACE_URGENCY                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_STROBE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SPEED_FACTOR                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SM_CC                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SIM_W                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SIM_PITCH                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_J                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_I                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_H                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_G                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_J                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_I                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_H                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_G                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SC_XMITPROFILE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which profile to transmit back to the basestation - 0 none, 1 dive, 2 climb, 3 both'
%     log_SC_RECORDABOVE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'meters'
%                        comment = 'Depth above above which data is recorded'
%     log_SC_PROFILE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which part of the dive to record data for - 0 none, 1 dive, 2 climb, 3 both'
%     log_SC_FREEKB                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Free diskspace on Scicon, in kBytes'
%     log_R_STBD_OVSHOOT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_R_PORT_OVSHOOT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_TIMEOUT                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_MIN                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_MAXERRORS                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_MAX                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_DEG                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_CNV                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_AD_RATE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_ADJ_GAIN                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_ADJ_DBAND                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RHO                                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'gram/cc'
%                        comment = 'Expected density at deepest point over the deployment'
%     log_RELAUNCH                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_RAFOS_PEAK_OFFSET                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_HIT_WINDOW                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_DEVICE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_CORR_THRESH                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_P_OVSHOOT_WITHG                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_P_OVSHOOT                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PROTOCOL                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PRESSURE_YINT                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PRESSURE_SLOPE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_W_GAIN                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_W_DBAND                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_VBD_SHIFT                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_TIMEOUT                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_MIN                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PITCH_MAXERRORS                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PITCH_MAX                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_GAIN                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_DBAND                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_CNV                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_AD_RATE                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_ADJ_GAIN                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_ADJ_DBAND                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PHONE_SUPPLY                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PHONE_DEVICE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PA_XMITPROFILE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which profile to transmit snippet file back to the basestation - 0 none, 1 dive, 2 climb, 3 both'
%     log_PA_UPLOADMAX                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'bytes'
%                        comment = 'Size in bytes of snippet file to upload to the basestation'
%     log_PA_STARTS                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PA_RECORDABOVE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'meters'
%                        comment = 'Depth above above which data is recorded'
%     log_PA_PROFILE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which part of the dive to record data for - 0 none, 1 dive, 2 climb, 3 both'
%     log_N_NOSURFACE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_NOCOMM                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_GPS                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_FILEKB                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_DIVES                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_NOCOMM_ACTION                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_NAV_MODE                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MOTHERBOARD                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MISSION                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MINV_24V                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MINV_10V                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MAX_BUOY                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MASS_COMP                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MASS                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERS                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE4                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE3                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE2                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE1                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_KALMAN_USE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_INT_PRESSURE_YINT                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_INT_PRESSURE_SLOPE                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_INTERNAL_PRESSURE                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ID                                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ICE_FREEZE_MARGIN                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HUMID                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HEAPDBG                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_HEAD_ERRBAND                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HEADING                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HD_C                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic induced drag factor for given hull shape (1/degrees^2 of attack angle)'
%     log_HD_B                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic drag factor for given hull shape (Pa^(-1/4))'
%     log_HD_A                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic lift factor for given hull shape (1/degrees of attack angle)'
%     log_GPS_DEVICE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_GLIDE_SLOPE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FIX_MISSING_TIMEOUT                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FILEMGR                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_FG_AHR_24Vo                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_24V                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_10Vo                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_10V                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FERRY_MAX                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ESCAPE_HEADING_DELTA                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ESCAPE_HEADING                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_TGT                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_SURF                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_SAFE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_PITCH                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_OFFGRID                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_NO_BLEED                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_GRID                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_FLARE                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_FINISH                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_CALL                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_BOOST                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_ABORT                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DIVE                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_DEVICE6                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE5                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE4                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE3                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE2                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE1                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEEPGLIDER                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_DBDW                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_VBD                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_C_ROLL_DIVE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_ROLL_CLIMB                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_PITCH                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_COURSE_BIAS                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMPASS_USE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_COMPASS_DEVICE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMPASS2_DEVICE                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMM_SEQ                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CF8_MAXERRORS                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CAPUPLOAD                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CAPMAXSIZE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_WAIT                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_TRIES                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_NDIVES                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_APOGEE_PITCH                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_TURN_MARGIN                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_PING_RANGE                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_MIN_OBSTACLE                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_SENSITIVITY                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PULSE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PING_DEPTH                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PING_DELTA                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_FREQUENCY                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_BOTTOM_TURN_MARGIN                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_BOTTOM_PING_RANGE                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AH0_24V                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AH0_10V                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AD7714Ch0Gain                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     flight_avg_speed_north_gsm                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of flight average speed based on gsm'
%     flight_avg_speed_north                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of flight average speed based on hdm'
%     flight_avg_speed_east_gsm                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of flight average speed based on gsm'
%     flight_avg_speed_east                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of flight average speed based on hdm'
%     depth_avg_curr_north_gsm                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of depth-average current based on gsm'
%     depth_avg_curr_north                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Northward component of the dive depth-average current based on hdm'
%                        standard_name = 'northward_sea_water_velocity'
%     depth_avg_curr_error                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Expected error of depth-average current from GPS'
%     depth_avg_curr_east_gsm                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of depth-average current based on gsm'
%     depth_avg_curr_east                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Eastward component of the dive depth-average current based on hdm'
%                        standard_name = 'eastward_sea_water_velocity'
%     avg_latitude                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'degrees_north'
%                        comment = 'The average latitude of the dive'
%     wlseaowl_time                                         
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'wlseaowl time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'wlseaowl'
%     wlseaowl_FL1sig                                       
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet Chlorophyll count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl_FDOMsig                                      
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet FDOM count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl_BB1sig                                       
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet Backscatter count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl                                              
%            Size:       8x1
%            Dimensions: string_8
%            Datatype:   char
%            Attributes:
%                        long_name  = 'underway virtual fluorescence FDOM puck'
%                        make_model = 'Wetlabs virtual measurement fluorescence FDOM puck'
%     vert_speed_gsm                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle vertical speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     vert_speed                                            
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle vertical speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     trajectory                                            
%            Size:       1x1
%            Dimensions: trajectory
%            Datatype:   int32
%            Attributes:
%                        comment   = 'Dive number for observations'
%                        long_name = 'Unique identifier for each feature instance'
%                        cf_role   = 'trajectory_id'
%     time                                                  
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Time of the sample in GMT epoch format'
%                        standard_name = 'time'
%                        axis          = 'T'
%                        platform      = 'glider'
%     theta                                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_Celsius'
%                        comment       = 'Potential temperature based on corrected salinity'
%                        standard_name = 'sea_water_potential_temperature'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature_raw_qc                                    
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw temperature value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature_raw                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_Celsius'
%                        comment     = 'Uncorrected temperature (in situ)'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     temperature_qc                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected temperature value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_Celsius'
%                        comment       = 'Termperature (in situ) corrected for thermistor first-order lag'
%                        standard_name = 'sea_water_temperature'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     surface_curr_qc                                       
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the surface current values'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     speed_qc                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each hdm speed value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     speed_gsm                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     speed                                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     sound_velocity                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Sound velocity'
%                        standard_name = 'speed_of_sound_in_sea_water'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     sigma_theta                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'g/m^3'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_sigma_theta'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%     sigma_t                                               
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Sigma based on density'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_sigma_t'
%                        units         = 'g/m^3'
%     sg_cal_mission_title                                  
%            Size:       26x1
%            Dimensions: string_26
%            Datatype:   char
%            Attributes:
%                        comment = 'Description of mission'
%     sg_cal_id_str                                         
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%            Attributes:
%                        comment = 'Three digit vehicle identification string'
%     sg_cal_comm_oxy_type                                  
%            Size:       20x1
%            Dimensions: string_20
%            Datatype:   char
%     sg_cal_calibcomm_contros_optode                       
%            Size:       41x1
%            Dimensions: string_41
%            Datatype:   char
%     sg_cal_calibcomm                                      
%            Size:       33x1
%            Dimensions: string_33
%            Datatype:   char
%     sg_cal_WETLabsCalData_wlseaowl_calinfo                
%            Size:       36x1
%            Dimensions: string_36
%            Datatype:   char
%     sbect_time                                            
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbect_tempFreq                                        
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbect_condFreq                                        
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbe41                                                 
%            Size:       5x1
%            Dimensions: string_5
%            Datatype:   char
%            Attributes:
%                        long_name           = 'underway thermosalinograph'
%                        ancillary_variables = ' sg_cal_t_g sg_cal_t_h sg_cal_t_i sg_cal_t_jsg_cal_c_g sg_cal_c_h sg_cal_c_i sg_cal_c_j sg_cal_cpcor sg_cal_ctcor'
%                        make_model          = 'unpumped Seabird SBE41'
%                        nodc_name           = 'thermosalinograph'
%     salinity_raw_qc                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw salinity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     salinity_raw                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = '1e-3'
%                        comment     = 'Uncorrected salinity derived from temperature_raw and conductivity_raw (PSU)'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     salinity_qc                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected salinity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     salinity                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = '1e-3'
%                        comment       = 'Salinity corrected for thermal-inertia effects (PSU)'
%                        standard_name = 'sea_water_salinity'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     pressure                                              
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'dbar'
%                        comment  = 'Uncorrected sea-water pressure at pressure sensor'
%                        platform = 'glider'
%     north_displacement_gsm                                
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Northward displacement from gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     north_displacement                                    
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Northward displacement from hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     magnetometer                                          
%            Size:       12x1
%            Dimensions: string_12
%            Datatype:   char
%            Attributes:
%                        long_name  = 'magnetometer'
%                        make_model = 'magnetometer'
%     longitude_gsm                                         
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_east'
%                        _FillValue  = NaN
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        comment     = 'Longitude of the sample based on gsm DAC'
%                        platform    = 'glider'
%     longitude                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Longitude of the sample based on hdm DAC'
%                        _FillValue    = NaN
%                        platform      = 'glider'
%                        standard_name = 'longitude'
%                        units         = 'degrees_east'
%                        axis          = 'X'
%     log_gps_time                                          
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'GPS times in GMT epoch format'
%                        standard_name = 'time'
%     log_gps_lon                                           
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_east'
%                        comment       = 'GPS longitudes'
%                        standard_name = 'longitude'
%     log_gps_lat                                           
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_north'
%                        comment       = 'GPS latitudes'
%                        standard_name = 'latitude'
%     log_VBD_LP_IGNORE                                     
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_TT8_MAMPS                                         
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_TGT_NAME                                          
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%     log_TGT_LATLONG                                       
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_STOP_T                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_SPEED_LIMITS                                      
%            Size:       11x1
%            Dimensions: string_11
%            Datatype:   char
%     log_SM_GC                                             
%            Size:       99x1
%            Dimensions: string_99
%            Datatype:   char
%     log_SM_CCo                                            
%            Size:       30x1
%            Dimensions: string_30
%            Datatype:   char
%     log_SENSOR_SECS                                       
%            Size:       65x1
%            Dimensions: string_65
%            Datatype:   char
%     log_SENSOR_MAMPS                                      
%            Size:       61x1
%            Dimensions: string_61
%            Datatype:   char
%     log_SENSORS                                           
%            Size:       42x1
%            Dimensions: string_42
%            Datatype:   char
%     log_PA_RECORDAPOGEE                                   
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%     log_MHEAD_RNG_PITCHd_Wd                               
%            Size:       36x1
%            Dimensions: string_36
%            Datatype:   char
%     log_MEM                                               
%            Size:       6x1
%            Dimensions: string_6
%            Datatype:   char
%     log_MAXI_24V                                          
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_MAXI_10V                                          
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_KALMAN_Y                                          
%            Size:       44x1
%            Dimensions: string_44
%            Datatype:   char
%     log_KALMAN_X                                          
%            Size:       44x1
%            Dimensions: string_44
%            Datatype:   char
%     log_KALMAN_CONTROL                                    
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_IRIDIUM_FIX                                       
%            Size:       29x1
%            Dimensions: string_29
%            Datatype:   char
%     log_GPS2                                              
%            Size:       69x1
%            Dimensions: string_69
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS2 fix (last surface position before dive)'
%     log_GPS1                                              
%            Size:       69x1
%            Dimensions: string_69
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS1 fix (first surface position before dive)'
%     log_GPS                                               
%            Size:       65x1
%            Dimensions: string_65
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS fix (first surface position after dive)'
%     log_ERRORS                                            
%            Size:       31x1
%            Dimensions: string_31
%            Datatype:   char
%     log_DEVICE_SECS                                       
%            Size:       166x1
%            Dimensions: string_166
%            Datatype:   char
%     log_DEVICE_MAMPS                                      
%            Size:       161x1
%            Dimensions: string_161
%            Datatype:   char
%     log_DEVICES                                           
%            Size:       294x1
%            Dimensions: string_294
%            Datatype:   char
%     log_DATA_FILE_SIZE                                    
%            Size:       9x1
%            Dimensions: string_9
%            Datatype:   char
%     log_CURRENT                                           
%            Size:       14x1
%            Dimensions: string_14
%            Datatype:   char
%     log_CFSIZE                                            
%            Size:       21x1
%            Dimensions: string_21
%            Datatype:   char
%     log_CAP_FILE_SIZE                                     
%            Size:       8x1
%            Dimensions: string_8
%            Datatype:   char
%     log_24V_AH                                            
%            Size:       13x1
%            Dimensions: string_13
%            Datatype:   char
%     log_10V_AH                                            
%            Size:       11x1
%            Dimensions: string_11
%            Datatype:   char
%     latlong_qc                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the dive estimated latitude and longitude estimates'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     latitude_gsm                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_north'
%                        _FillValue  = NaN
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        comment     = 'Latitude of the sample based on gsm DAC'
%                        platform    = 'glider'
%     latitude                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Latitude of the sample based on hdm DAC'
%                        _FillValue    = NaN
%                        platform      = 'glider'
%                        standard_name = 'latitude'
%                        units         = 'degrees_north'
%                        axis          = 'Y'
%     horz_speed_gsm                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle horizontal speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     horz_speed                                            
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle horizontal speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     hdm_qc                                                
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether corrected temperatures, salinities, and velocities from the hydrodynamic model converged on a consistent solution'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     glider                                                
%            Size:       15x1
%            Dimensions: string_15
%            Datatype:   char
%            Attributes:
%                        nodc_name = 'glider'
%                        call_sign = 'SG644'
%                        long_name = 'seaglider'
%     glide_angle_gsm                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Glide angle based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     glide_angle                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Glide angle based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     gc_vbd_volts                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_vbd_secs                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this VBD change'
%     gc_vbd_retries                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_vbd_pot2_ad_start                                  
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot2_ad                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot1_ad_start                                  
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot1_ad                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_i                                              
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_vbd_errors                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_vbd_ctl                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm'
%     gc_vbd_ad                                             
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_st_secs                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds since 1970-1-1 00:00:00'
%                        comment = 'Start of GC time in GMT epoch format'
%     gc_roll_volts                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_roll_secs                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this roll change'
%     gc_roll_retries                                       
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_roll_i                                             
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_roll_errors                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_roll_ad_start                                      
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_roll_ad                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_pitch_volts                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_pitch_secs                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this pitch change'
%     gc_pitch_retries                                      
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_pitch_i                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_pitch_errors                                       
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_pitch_ctl                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm'
%     gc_pitch_ad_start                                     
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_pitch_ad                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_ob_vertv                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm/s'
%     gc_gcphase                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        flag_meanings = 'pitch vbd active_roll passive_roll roll_back passive'
%                        flag_values   = [1  2  3  4  5  6]
%     gc_end_secs                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds  since 1970-1-1 00:00:00'
%                        comment = 'End of GC time in GMT epoch format'
%     gc_depth                                              
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'meters'
%     gc_data_pts                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     eng_vbdCC                                             
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_rollCtl                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_rollAng                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle roll'
%                        platform = 'glider'
%     eng_rec                                               
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_pitchCtl                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_pitchAng                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle pitch'
%                        platform = 'glider'
%     eng_mag_z                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer z'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_mag_y                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer y'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_mag_x                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer x'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_head                                              
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle heading (magnetic)'
%                        platform = 'glider'
%     eng_elaps_t_0000                                      
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds'
%                        comment       = 'Elapsed seconds since start of mission'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     eng_elaps_t                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds'
%                        comment       = 'Elapsed seconds since start of dive'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     eng_depth                                             
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'cm'
%                        positive      = 'down'
%                        standard_name = 'depth'
%                        comment       = 'Measured vertical distance below the surface'
%                        platform      = 'glider'
%     eng_GC_phase                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        flag_meanings = 'pitch vbd active_roll passive_roll roll_back passive'
%                        platform      = 'glider'
%                        flag_values   = [1  2  3  4  5  6]
%     east_displacement_gsm                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Eastward displacement from gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     east_displacement                                     
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Eastward displacement from hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     dissolved_oxygen_sat                                  
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'micromoles/kg'
%                        comment     = 'Calculated saturation value for oxygen given measured presure and corrected temperature, and salinity'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     depth_time                                            
%            Size:       833x1
%            Dimensions: depth_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Pressure sensor time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     depth_depth                                           
%            Size:       833x1
%            Dimensions: depth_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'cm'
%                        positive      = 'down'
%                        standard_name = 'depth'
%                        comment       = 'Measured vertical distance below the surface'
%                        platform      = 'glider'
%     depth_avg_curr_qc                                     
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the dive depth-average current values and displacements'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     depth                                                 
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Depth below the surface, corrected for average latitude'
%                        positive      = 'down'
%                        platform      = 'glider'
%                        standard_name = 'depth'
%                        units         = 'meters'
%                        axis          = 'Z'
%     density_insitu                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'g/m^3'
%                        comment     = 'Sea water in-situ density based on pressure'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     density                                               
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Sea water potential density'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_density'
%                        units         = 'g/m^3'
%     ctd_time                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Time of CTD sample in GMT epoch format'
%                        standard_name = 'time'
%                        axis          = 'T'
%                        platform      = 'glider'
%     ctd_pressure                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'dbar'
%                        comment       = 'Pressure at CTD thermistor'
%                        standard_name = 'sea_water_pressure'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     ctd_depth                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'CTD thermistor depth corrected for average latitude'
%                        positive      = 'down'
%                        platform      = 'glider'
%                        standard_name = 'depth'
%                        units         = 'meters'
%                        axis          = 'Z'
%     contopt_time                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'AA4330 time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_results_time                                  
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'time for Contros Optode in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_qc                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the Contros optode results'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     contopt_pO2                                           
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'mbar'
%                        instrument = 'contopt'
%                        comment    = 'partial pressure of O2 as reported by instrument'
%                        platform   = 'glider'
%     contopt_instrument_dissolved_oxygen                   
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'micromoles/kg'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        comment    = 'Dissolved oxygen concentration reported from instrument'
%                        instrument = 'contopt'
%     contopt_dissolved_oxygen_qc                           
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each Contros optode dissolved oxygen value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_dissolved_oxygen                              
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Dissolved oxygen concentration'
%                        _FillValue    = NaN
%                        instrument    = 'contopt'
%                        platform      = 'glider'
%                        standard_name = 'mole_concentration_of_dissolved_molecular_oxygen_in_sea_water'
%                        units         = 'micromoles/kg'
%     contopt_Temp                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'degrees_Celsius'
%                        instrument = 'contopt'
%                        comment    = 'As reported by instrument'
%                        platform   = 'glider'
%     contopt_OxySat                                        
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'percent'
%                        instrument = 'contopt'
%                        comment    = 'Oxygen saturation As reported by instrument'
%                        platform   = 'glider'
%     contopt_Dphi                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'degrees'
%                        instrument = 'contopt'
%                        comment    = 'as reported by the instrument'
%                        platform   = 'glider'
%     contopt                                               
%            Size:       7x1
%            Dimensions: string_7
%            Datatype:   char
%            Attributes:
%                        long_name           = 'underway oxygen sensor'
%                        ancillary_variables = 'temperature salinity SciCon(contopt: Dphi, pO2, Temp) sg_cal_contopt_A_* sg_cal_contopt_B_* sg_cal_contopt_C_0 sg_cal_contopt_CC_*'
%                        make_model          = 'Contros HydroFlash O2'
%                        nodc_name           = 'optode'
%     conductivity_raw_qc                                   
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw conductivity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     conductivity_raw                                      
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'S/m'
%                        comment     = 'Uncorrected conductivity'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     conductivity_qc                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected conductivity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     conductivity                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'S/m'
%                        comment       = 'Conductivity corrected for anomalies'
%                        standard_name = 'sea_water_electrical_conductivity'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     buoyancy                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'g'
%                        comment     = 'Buoyancy of vehicle, corrected for compression effects'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     auxCompass_time                                       
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Pressure sensor time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     auxCompass_rol                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'roll'
%                        platform      = 'glider'
%     auxCompass_pressureCounts                             
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'counts'
%                        comment  = 'Uncorrected sea-water pressure in instruments counts'
%                        platform = 'glider'
%     auxCompass_pressure                                   
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'dbar'
%                        comment       = 'Uncorrected sea-water pressure'
%                        standard_name = 'sea_water_pressure'
%                        platform      = 'glider'
%     auxCompass_pit                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'pitch'
%                        platform      = 'glider'
%     auxCompass_hdg                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'heading'
%                        platform      = 'glider'
%     auxCompass_Mz                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_My                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Mx                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Az                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Ay                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Ax                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     GPSE_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the final GPS information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     GPS2_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the GPS2 information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     GPS1_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the GPS1 information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     CTD_qc                                                
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the corrected CTD values'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
% sg_vis
% Source:
%            /Users/nbronikowski/Desktop/p6440015.nc
% Format:
%            classic
% Global Attributes:
%            quality_control_version        = 1.12
%            base_station_micro_version     = 4475
%            time_coverage_resolution       = 'PT1S'
%            geospatial_vertical_max        = 219.79
%            mission                        = 8
%            geospatial_lat_units           = 'degrees'
%            geospatial_lon_units           = 'degrees'
%            references                     = 'http://data.nodc.noaa.gov/accession/0092291'
%            seaglider_software_version     = 66.12
%            Metadata_Conventions           = 'Unidata Dataset Discovery v1.0'
%            keywords                       = 'Water Temperature, Conductivity, Salinity, Density, Potential Density, Potential Temperature'
%            summary                        = 'SG644 SG644_POLAR_FRONT_20210516'
%            id                             = 'p6440015_20210517'
%            naming_authority               = 'edu.washington.apl'
%            project                        = 'SG644_POLAR_FRONT_20210516'
%            geospatial_lat_max             = 76.6382
%            uuid                           = 'd51adffc-b707-11eb-9d8e-c81f660ad1ec'
%            source                         = 'Seaglider SG644'
%            standard_name_vocabulary       = 'CF-1.6'
%            file_version                   = 2.71
%            glider                         = 644
%            platform                       = 'glider'
%            instrument                     = 'magnetometer sbe41 contopt wlseaowl '
%            processing_level               = '1.120000'
%            nodc_template_version          = 'NODC_NetCDF_Trajectory_Template_v0.9'
%            featureType                    = 'trajectory'
%            base_station_version           = 2.9
%            keywords_vocabulary            = 'NASA/GCMD Earth Science Keywords Version 6.0.0.0'
%            start_time                     = 1621247159
%            geospatial_lat_min             = 76.6336
%            geospatial_lat_resolution      = 'seconds'
%            time_coverage_start            = '2021-05-17T10:05:25Z'
%            geospatial_vertical_positive   = 'no'
%            date_created                   = '2021-05-17T12:05:03Z'
%            institution                    = 'Applied Physics Lab
%                                             University of Washington
%                                             Seattle, WA'
%            geospatial_lon_max             = 29.934
%            geospatial_lon_min             = 29.9202
%            geospatial_lon_resolution      = 'seconds'
%            geospatial_vertical_resolution = 'centimeter'
%            license                        = 'These data may be redistributed and used without restriction.'
%            date_modified                  = '2021-05-17T12:05:03Z'
%            time_coverage_end              = '2021-05-17T11:05:52Z'
%            Conventions                    = 'CF-1.6'
%            platform_id                    = 'SG644'
%            cdm_data_type                  = 'Trajectory'
%            geospatial_vertical_min        = 0.32868
%            title                          = 'Physical, chemical, and biological data collected from Seaglider SG644 during SG644_POLAR_FRONT_20210516 deployed on 2021-05-17'
%            geospatial_vertical_units      = 'meter'
%            dive_number                    = 15
%            history                        = 'Processing start:
%                                             INFO: MakeDiveProfiles.py(2392): Using auxCompass compass data
%                                             INFO: MakeDiveProfiles.py(2966): Using auxCompass pressure signal
%                                             INFO: MakeDiveProfiles.py(2984): auxPress_yint = -174.621505, $PRESSURE_YINT = -175.040540
%                                             INFO: QC.py(378): Changed (7/954) 6 8 19 23 232 430 444 to QC_PROBABLY_BAD because raw temperature spikes
%                                             INFO: QC.py(383): Changed (11/954) 27 28 945:950 952:954 to QC_PROBABLY_BAD because raw temperature noise spikes
%                                             INFO: QC.py(390): Changed (1/954) 954 to QC_BAD because raw salinity below bound
%                                             INFO: QC.py(421): Changed (3/954) 8 430 952 to QC_PROBABLY_BAD because raw conductivity spikes
%                                             INFO: QC.py(426): Changed (2/954) 953 954 to QC_PROBABLY_BAD because raw conductivity noise spikes
%                                             INFO: QC.py(192): Changed (17/954) 6 8 19 23 27 28 232 430 444 945:950 952 953 to QC_PROBABLY_BAD because changed raw temp implies changed raw salinity
%                                             INFO: QC.py(378): Changed (7/954) 6 8 19 23 232 430 444 to QC_INTERPOLATED because temperature spikes
%                                             INFO: QC.py(383): Changed (11/954) 27 28 945:950 952:954 to QC_INTERPOLATED because temperature noise spikes
%                                             INFO: QC.py(390): Changed (1/954) 954 to QC_BAD because salinity below bound
%                                             INFO: QC.py(401): Changed (1/954) 954 to QC_BAD because bad salinity indicates conductivity issues
%                                             INFO: QC.py(421): Changed (3/954) 8 430 952 to QC_INTERPOLATED because conductivity spikes
%                                             INFO: QC.py(426): Changed (1/954) 953 to QC_INTERPOLATED because conductivity noise spikes
%                                             WARNING: MakeDiveProfiles.py(3582): Mass of vehicle in sg_calib_constants (57282.0) does not match $MASS in log file (57248.0); using sg_calib_constants
%                                             INFO: MakeDiveProfiles.py(3640): Changed (95/954) 404:498 to QC_BAD because slow apogee CT flow
%                                             INFO: MakeDiveProfiles.py(3761): Changed (28/954) 1:28 to QC_BAD because prior to dive start
%                                             INFO: QC.py(510): Changed (2/954) 952 953 to QC_PROBABLY_BAD because bad interpolation anchors
%                                             INFO: QC.py(511): SUGGESTION: 15 bad_conductivity data_points in_between 950 953 % bad interpolation anchors
%                                             INFO: MakeDiveProfiles.py(3869): Changed (124/954) 1:28 404:498 954 to QC_BAD because bad corrected temperature and conductivity suggests bad salinity
%                                             INFO: QC.py(192): Changed (124/954) 1:28 404:498 954 to QC_BAD because changed corrected salin implies changed speed
%                                             INFO: TempSalinityVelocity.py(1197): TSV:  0 3 stalled points 402 403 953
%                                             INFO: TempSalinityVelocity.py(1218): TSV exiting after 2 iterations
%                                             INFO: TempSalinityVelocity.py(1220): Changed (1/954) 952 to QC_PROBABLY_BAD because TS bad extrapolation
%                                             INFO: TempSalinityVelocity.py(1222): Changed (3/954) 402 403 953 to QC_PROBABLY_BAD because stalls avoid thermal-inertia salinity correction
%                                             INFO: TempSalinityVelocity.py(1237): SUGGESTION: 15 interp_salinity data_points in_between 940 950 % suspect thermal-inertia points 943:945
%                                             INFO: QC.py(192): Changed (7/954) 232 945:950 to QC_INTERPOLATED because changed corrected temp implies changed corrected salinity
%                                             INFO: MakeDiveProfiles.py(4029): 124 (13.00%) HDM speeds are QC_BAD; 3 (0.31%) are stalled (954)
%                                             INFO: QC.py(192): Changed (9/954) 232 945:950 952 953 to QC_INTERPOLATED because changed corrected temp implies changed speed
%                                             INFO: MakeDiveProfiles.py(4055): Average estimated final speed: 22.82 cm/s
%                                             INFO: MakeDiveProfiles.py(4058): RMS observed vs. computed w: 1.23 cm/s
%                                             INFO: MakeDiveProfiles.py(4110): Starting sensor extensions data processing
%                                             WARNING: aa4330_ext.py(264): Couldn'd find all variables - nothing to process
%                                             WARNING: aa4831_ext.py(264): Couldn'd find all variables - nothing to process
%                                             INFO: QC.py(192): Changed (4/953) 402 403 951 952 to QC_PROBABLY_BAD because changed salinity implies changed Contros oxygen
%                                             INFO: QC.py(192): Changed (124/953) 1:28 404:498 953 to QC_BAD because changed salinity implies changed Contros oxygen
%                                             INFO: QC.py(192): Changed (7/953) 232 944:949 to QC_INTERPOLATED because changed salinity implies changed Contros oxygen
%                                             INFO: aroft_ext.py(173): Starting sensor_data_processing on file <DataFiles.DataFile instance at 0x7f6a406373f8>
%                                             INFO: aroft_ext.py(197): No ARO-FT data found in Results data - bailing out
%                                             INFO: MakeDiveProfiles.py(4112): Finished sensor extensions data processing
%                                             INFO: MakeDiveProfiles.py(4144): Estimated total flight and drift time: 5142.0s (SM: 376.1s)
%                                             '
% Dimensions:
%            contopt_data_point      = 953
%            trajectory              = 1
%            gc_event                = 40
%            depth_data_point        = 833
%            sg_data_point           = 834
%            magnetometer_data_point = 834
%            wlseaowl_data_point     = 954
%            sbect_data_point        = 954
%            auxCompass_data_point   = 954
%            gps_info                = 3
%            ctd_data_point          = 954
%            string_33               = 33
%            string_41               = 41
%            string_20               = 20
%            string_3                = 3
%            string_36               = 36
%            string_26               = 26
%            string_44               = 44
%            string_42               = 42
%            string_11               = 11
%            string_294              = 294
%            string_9                = 9
%            string_29               = 29
%            string_21               = 21
%            string_30               = 30
%            string_8                = 8
%            string_61               = 61
%            string_17               = 17
%            string_65               = 65
%            string_1                = 1
%            string_99               = 99
%            string_31               = 31
%            string_161              = 161
%            string_14               = 14
%            string_13               = 13
%            string_6                = 6
%            string_166              = 166
%            string_69               = 69
%            string_15               = 15
%            string_12               = 12
%            string_5                = 5
%            string_7                = 7
% Variables:
%     surface_curr_north                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'cm/s'
%                        comment       = 'Northward component of surface current'
%                        standard_name = 'surface_northward_sea_water_velocity'
%     surface_curr_error                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Expected error of surface drift current from GPS'
%     surface_curr_east                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'cm/s'
%                        comment       = 'Eastward component of surface current'
%                        standard_name = 'surface_eastward_sea_water_velocity'
%     start_of_climb_time                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds after dive start when second (positive) apogee pump starts'
%     sg_cal_volmax                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm^3'
%                        comment = 'Maximum displaced volume of the glider'
%     sg_cal_t_j                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_i                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_h                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_t_g                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_rho0                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'kg/m^3'
%                        comment = 'Typical expected density of seawater for this deployment'
%     sg_cal_mass                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'kg'
%                        comment = 'Mass of the glider'
%     sg_cal_hd_c                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic induced drag factor for given hull shape (1/radians^2 of attack angle)'
%     sg_cal_hd_b                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic drag factor for given hull shape (Pa^(-1/4))'
%     sg_cal_hd_a                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic lift factor for given hull shape (1/degrees of attack angle)'
%     sg_cal_contopt_C_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_6                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_5                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_4                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_3                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_2                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_1                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_CC_0                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_3                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_2                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_1                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_B_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_5                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_4                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_3                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_2                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_1                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_contopt_A_0                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_j                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_i                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_h                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_c_g                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_wavelength  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_scaleFactor 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_maxOutput   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Scatter700_darkCounts  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_wavelength        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_scaleFactor       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_resolution        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_maxOutput         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_FDOM_darkCounts        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_wavelength 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_scaleFactor
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_resolution 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_maxOutput  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     sg_cal_WETLabsCalData_wlseaowl_Chlorophyll_darkCounts 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     reviewed                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%            Attributes:
%                        comment = 'Whether a scientist has reviewed and approved this profile'
%     magnetic_variation                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'The magnetic variance from true north (degrees)'
%     log__XMS_TOUTs                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__XMS_NAKs                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__SM_DEPTHo                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__SM_ANGLEo                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log__CALLS                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_VALID                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_PINGS                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_INHIBIT                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_XPDR_DEVICE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_W_ADJ_DBAND                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_TIMEOUT                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_PUMP_AD_RATE_SURFACE                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_PUMP_AD_RATE_APOGEE                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_MIN                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_MAXERRORS                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_MAX                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_VBD_DBAND                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_CNV                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_VBD_BLEED_AD_RATE                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_USE_ICE                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_USE_BATHY                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_UPLOAD_DIVES_MAX                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_UNCOM_BLEED                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_T_WATCHDOG                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_TURN_SAMPINT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_TURN                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_RSLEEP                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_NO_W                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_MISSION                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_LOITER                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_GPS                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_EPIRB                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_DIVE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_BOOST                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_T_ABORT                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_RADIUS                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_DEFAULT_LON                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_DEFAULT_LAT                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TGT_AUTO_DEFAULT                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_TCM_TEMP                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TCM_ROLL_OFFSET                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_TCM_PITCH_OFFSET                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SURFACE_URGENCY_TRY                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SURFACE_URGENCY_FORCE                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SURFACE_URGENCY                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_STROBE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_SPEED_FACTOR                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SM_CC                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SIM_W                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SIM_PITCH                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_J                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_I                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_H                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_T_G                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_J                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_I                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_H                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SEABIRD_C_G                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_SC_XMITPROFILE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which profile to transmit back to the basestation - 0 none, 1 dive, 2 climb, 3 both'
%     log_SC_RECORDABOVE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'meters'
%                        comment = 'Depth above above which data is recorded'
%     log_SC_PROFILE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which part of the dive to record data for - 0 none, 1 dive, 2 climb, 3 both'
%     log_SC_FREEKB                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Free diskspace on Scicon, in kBytes'
%     log_R_STBD_OVSHOOT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_R_PORT_OVSHOOT                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_TIMEOUT                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_MIN                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_MAXERRORS                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_MAX                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ROLL_DEG                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_CNV                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_AD_RATE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_ADJ_GAIN                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ROLL_ADJ_DBAND                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RHO                                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'gram/cc'
%                        comment = 'Expected density at deepest point over the deployment'
%     log_RELAUNCH                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_RAFOS_PEAK_OFFSET                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_HIT_WINDOW                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_DEVICE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_RAFOS_CORR_THRESH                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_P_OVSHOOT_WITHG                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_P_OVSHOOT                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PROTOCOL                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PRESSURE_YINT                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PRESSURE_SLOPE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_W_GAIN                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_W_DBAND                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_VBD_SHIFT                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_TIMEOUT                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_MIN                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PITCH_MAXERRORS                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PITCH_MAX                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_GAIN                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_DBAND                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_CNV                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_AD_RATE                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_ADJ_GAIN                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PITCH_ADJ_DBAND                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PHONE_SUPPLY                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_PHONE_DEVICE                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PA_XMITPROFILE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which profile to transmit snippet file back to the basestation - 0 none, 1 dive, 2 climb, 3 both'
%     log_PA_UPLOADMAX                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'bytes'
%                        comment = 'Size in bytes of snippet file to upload to the basestation'
%     log_PA_STARTS                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_PA_RECORDABOVE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'meters'
%                        comment = 'Depth above above which data is recorded'
%     log_PA_PROFILE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Which part of the dive to record data for - 0 none, 1 dive, 2 climb, 3 both'
%     log_N_NOSURFACE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_NOCOMM                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_GPS                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_FILEKB                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_N_DIVES                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_NOCOMM_ACTION                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_NAV_MODE                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MOTHERBOARD                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MISSION                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_MINV_24V                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MINV_10V                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MAX_BUOY                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MASS_COMP                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_MASS                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERS                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE4                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE3                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE2                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_LOGGERDEVICE1                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_KALMAN_USE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_INT_PRESSURE_YINT                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_INT_PRESSURE_SLOPE                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_INTERNAL_PRESSURE                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ID                                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_ICE_FREEZE_MARGIN                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HUMID                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HEAPDBG                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_HEAD_ERRBAND                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HEADING                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_HD_C                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic induced drag factor for given hull shape (1/degrees^2 of attack angle)'
%     log_HD_B                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic drag factor for given hull shape (Pa^(-1/4))'
%     log_HD_A                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        comment = 'Hydrodynamic lift factor for given hull shape (1/degrees of attack angle)'
%     log_GPS_DEVICE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_GLIDE_SLOPE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FIX_MISSING_TIMEOUT                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FILEMGR                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_FG_AHR_24Vo                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_24V                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_10Vo                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FG_AHR_10V                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_FERRY_MAX                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ESCAPE_HEADING_DELTA                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ESCAPE_HEADING                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_TGT                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_SURF                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_SAFE                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_PITCH                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_OFFGRID                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_NO_BLEED                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_GRID                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_FLARE                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_FINISH                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_CALL                                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_BOOST                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_D_ABORT                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DIVE                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_DEVICE6                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE5                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE4                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE3                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE2                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEVICE1                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_DEEPGLIDER                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_DBDW                                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_VBD                                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_C_ROLL_DIVE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_ROLL_CLIMB                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_C_PITCH                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_COURSE_BIAS                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMPASS_USE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_COMPASS_DEVICE                                    
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMPASS2_DEVICE                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_COMM_SEQ                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CF8_MAXERRORS                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CAPUPLOAD                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CAPMAXSIZE                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_WAIT                                         
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_TRIES                                        
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_CALL_NDIVES                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     log_APOGEE_PITCH                                      
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_TURN_MARGIN                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_PING_RANGE                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_TOP_MIN_OBSTACLE                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_SENSITIVITY                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PULSE                                       
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PING_DEPTH                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_PING_DELTA                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_FREQUENCY                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_BOTTOM_TURN_MARGIN                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_ALTIM_BOTTOM_PING_RANGE                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AH0_24V                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AH0_10V                                           
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%     log_AD7714Ch0Gain                                     
%            Size:       1x1
%            Dimensions: 
%            Datatype:   int32
%     flight_avg_speed_north_gsm                            
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of flight average speed based on gsm'
%     flight_avg_speed_north                                
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of flight average speed based on hdm'
%     flight_avg_speed_east_gsm                             
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of flight average speed based on gsm'
%     flight_avg_speed_east                                 
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of flight average speed based on hdm'
%     depth_avg_curr_north_gsm                              
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Northward component of depth-average current based on gsm'
%     depth_avg_curr_north                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Northward component of the dive depth-average current based on hdm'
%                        standard_name = 'northward_sea_water_velocity'
%     depth_avg_curr_error                                  
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Expected error of depth-average current from GPS'
%     depth_avg_curr_east_gsm                               
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'm/s'
%                        comment = 'Eastward component of depth-average current based on gsm'
%     depth_avg_curr_east                                   
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Eastward component of the dive depth-average current based on hdm'
%                        standard_name = 'eastward_sea_water_velocity'
%     avg_latitude                                          
%            Size:       1x1
%            Dimensions: 
%            Datatype:   double
%            Attributes:
%                        units   = 'degrees_north'
%                        comment = 'The average latitude of the dive'
%     wlseaowl_time                                         
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'wlseaowl time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'wlseaowl'
%     wlseaowl_FL1sig                                       
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet Chlorophyll count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl_FDOMsig                                      
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet FDOM count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl_BB1sig                                       
%            Size:       954x1
%            Dimensions: wlseaowl_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by instrumet Backscatter count'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        instrumet  = 'wlseaowl'
%                        instrument = 'wlseaowl'
%     wlseaowl                                              
%            Size:       8x1
%            Dimensions: string_8
%            Datatype:   char
%            Attributes:
%                        long_name  = 'underway virtual fluorescence FDOM puck'
%                        make_model = 'Wetlabs virtual measurement fluorescence FDOM puck'
%     vert_speed_gsm                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle vertical speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     vert_speed                                            
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle vertical speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     trajectory                                            
%            Size:       1x1
%            Dimensions: trajectory
%            Datatype:   int32
%            Attributes:
%                        comment   = 'Dive number for observations'
%                        long_name = 'Unique identifier for each feature instance'
%                        cf_role   = 'trajectory_id'
%     time                                                  
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Time of the sample in GMT epoch format'
%                        standard_name = 'time'
%                        axis          = 'T'
%                        platform      = 'glider'
%     theta                                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_Celsius'
%                        comment       = 'Potential temperature based on corrected salinity'
%                        standard_name = 'sea_water_potential_temperature'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature_raw_qc                                    
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw temperature value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature_raw                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_Celsius'
%                        comment     = 'Uncorrected temperature (in situ)'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     temperature_qc                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected temperature value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     temperature                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_Celsius'
%                        comment       = 'Termperature (in situ) corrected for thermistor first-order lag'
%                        standard_name = 'sea_water_temperature'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     surface_curr_qc                                       
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the surface current values'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     speed_qc                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each hdm speed value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     speed_gsm                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     speed                                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     sound_velocity                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'm/s'
%                        comment       = 'Sound velocity'
%                        standard_name = 'speed_of_sound_in_sea_water'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     sigma_theta                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'g/m^3'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_sigma_theta'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%     sigma_t                                               
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Sigma based on density'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_sigma_t'
%                        units         = 'g/m^3'
%     sg_cal_mission_title                                  
%            Size:       26x1
%            Dimensions: string_26
%            Datatype:   char
%            Attributes:
%                        comment = 'Description of mission'
%     sg_cal_id_str                                         
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%            Attributes:
%                        comment = 'Three digit vehicle identification string'
%     sg_cal_comm_oxy_type                                  
%            Size:       20x1
%            Dimensions: string_20
%            Datatype:   char
%     sg_cal_calibcomm_contros_optode                       
%            Size:       41x1
%            Dimensions: string_41
%            Datatype:   char
%     sg_cal_calibcomm                                      
%            Size:       33x1
%            Dimensions: string_33
%            Datatype:   char
%     sg_cal_WETLabsCalData_wlseaowl_calinfo                
%            Size:       36x1
%            Dimensions: string_36
%            Datatype:   char
%     sbect_time                                            
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbect_tempFreq                                        
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbect_condFreq                                        
%            Size:       954x1
%            Dimensions: sbect_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'As reported by the instrument'
%                        platform   = 'glider'
%                        instrument = 'sbe41'
%     sbe41                                                 
%            Size:       5x1
%            Dimensions: string_5
%            Datatype:   char
%            Attributes:
%                        long_name           = 'underway thermosalinograph'
%                        ancillary_variables = ' sg_cal_t_g sg_cal_t_h sg_cal_t_i sg_cal_t_jsg_cal_c_g sg_cal_c_h sg_cal_c_i sg_cal_c_j sg_cal_cpcor sg_cal_ctcor'
%                        make_model          = 'unpumped Seabird SBE41'
%                        nodc_name           = 'thermosalinograph'
%     salinity_raw_qc                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw salinity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     salinity_raw                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = '1e-3'
%                        comment     = 'Uncorrected salinity derived from temperature_raw and conductivity_raw (PSU)'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     salinity_qc                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected salinity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     salinity                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = '1e-3'
%                        comment       = 'Salinity corrected for thermal-inertia effects (PSU)'
%                        standard_name = 'sea_water_salinity'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     pressure                                              
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'dbar'
%                        comment  = 'Uncorrected sea-water pressure at pressure sensor'
%                        platform = 'glider'
%     north_displacement_gsm                                
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Northward displacement from gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     north_displacement                                    
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Northward displacement from hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     magnetometer                                          
%            Size:       12x1
%            Dimensions: string_12
%            Datatype:   char
%            Attributes:
%                        long_name  = 'magnetometer'
%                        make_model = 'magnetometer'
%     longitude_gsm                                         
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_east'
%                        _FillValue  = NaN
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        comment     = 'Longitude of the sample based on gsm DAC'
%                        platform    = 'glider'
%     longitude                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Longitude of the sample based on hdm DAC'
%                        _FillValue    = NaN
%                        platform      = 'glider'
%                        standard_name = 'longitude'
%                        units         = 'degrees_east'
%                        axis          = 'X'
%     log_gps_time                                          
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'GPS times in GMT epoch format'
%                        standard_name = 'time'
%     log_gps_lon                                           
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_east'
%                        comment       = 'GPS longitudes'
%                        standard_name = 'longitude'
%     log_gps_lat                                           
%            Size:       3x1
%            Dimensions: gps_info
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees_north'
%                        comment       = 'GPS latitudes'
%                        standard_name = 'latitude'
%     log_VBD_LP_IGNORE                                     
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_TT8_MAMPS                                         
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_TGT_NAME                                          
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%     log_TGT_LATLONG                                       
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_STOP_T                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_SPEED_LIMITS                                      
%            Size:       11x1
%            Dimensions: string_11
%            Datatype:   char
%     log_SM_GC                                             
%            Size:       99x1
%            Dimensions: string_99
%            Datatype:   char
%     log_SM_CCo                                            
%            Size:       30x1
%            Dimensions: string_30
%            Datatype:   char
%     log_SENSOR_SECS                                       
%            Size:       65x1
%            Dimensions: string_65
%            Datatype:   char
%     log_SENSOR_MAMPS                                      
%            Size:       61x1
%            Dimensions: string_61
%            Datatype:   char
%     log_SENSORS                                           
%            Size:       42x1
%            Dimensions: string_42
%            Datatype:   char
%     log_PA_RECORDAPOGEE                                   
%            Size:       3x1
%            Dimensions: string_3
%            Datatype:   char
%     log_MHEAD_RNG_PITCHd_Wd                               
%            Size:       36x1
%            Dimensions: string_36
%            Datatype:   char
%     log_MEM                                               
%            Size:       6x1
%            Dimensions: string_6
%            Datatype:   char
%     log_MAXI_24V                                          
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_MAXI_10V                                          
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%     log_KALMAN_Y                                          
%            Size:       44x1
%            Dimensions: string_44
%            Datatype:   char
%     log_KALMAN_X                                          
%            Size:       44x1
%            Dimensions: string_44
%            Datatype:   char
%     log_KALMAN_CONTROL                                    
%            Size:       17x1
%            Dimensions: string_17
%            Datatype:   char
%     log_IRIDIUM_FIX                                       
%            Size:       29x1
%            Dimensions: string_29
%            Datatype:   char
%     log_GPS2                                              
%            Size:       69x1
%            Dimensions: string_69
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS2 fix (last surface position before dive)'
%     log_GPS1                                              
%            Size:       69x1
%            Dimensions: string_69
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS1 fix (first surface position before dive)'
%     log_GPS                                               
%            Size:       65x1
%            Dimensions: string_65
%            Datatype:   char
%            Attributes:
%                        comment = 'String reported in logfile for GPS fix (first surface position after dive)'
%     log_ERRORS                                            
%            Size:       31x1
%            Dimensions: string_31
%            Datatype:   char
%     log_DEVICE_SECS                                       
%            Size:       166x1
%            Dimensions: string_166
%            Datatype:   char
%     log_DEVICE_MAMPS                                      
%            Size:       161x1
%            Dimensions: string_161
%            Datatype:   char
%     log_DEVICES                                           
%            Size:       294x1
%            Dimensions: string_294
%            Datatype:   char
%     log_DATA_FILE_SIZE                                    
%            Size:       9x1
%            Dimensions: string_9
%            Datatype:   char
%     log_CURRENT                                           
%            Size:       14x1
%            Dimensions: string_14
%            Datatype:   char
%     log_CFSIZE                                            
%            Size:       21x1
%            Dimensions: string_21
%            Datatype:   char
%     log_CAP_FILE_SIZE                                     
%            Size:       8x1
%            Dimensions: string_8
%            Datatype:   char
%     log_24V_AH                                            
%            Size:       13x1
%            Dimensions: string_13
%            Datatype:   char
%     log_10V_AH                                            
%            Size:       11x1
%            Dimensions: string_11
%            Datatype:   char
%     latlong_qc                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the dive estimated latitude and longitude estimates'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     latitude_gsm                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'degrees_north'
%                        _FillValue  = NaN
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        comment     = 'Latitude of the sample based on gsm DAC'
%                        platform    = 'glider'
%     latitude                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Latitude of the sample based on hdm DAC'
%                        _FillValue    = NaN
%                        platform      = 'glider'
%                        standard_name = 'latitude'
%                        units         = 'degrees_north'
%                        axis          = 'Y'
%     horz_speed_gsm                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle horizontal speed based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     horz_speed                                            
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Vehicle horizontal speed based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     hdm_qc                                                
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether corrected temperatures, salinities, and velocities from the hydrodynamic model converged on a consistent solution'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     glider                                                
%            Size:       15x1
%            Dimensions: string_15
%            Datatype:   char
%            Attributes:
%                        nodc_name = 'glider'
%                        call_sign = 'SG644'
%                        long_name = 'seaglider'
%     glide_angle_gsm                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Glide angle based on gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     glide_angle                                           
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'cm/s'
%                        comment     = 'Glide angle based on hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     gc_vbd_volts                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_vbd_secs                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this VBD change'
%     gc_vbd_retries                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_vbd_pot2_ad_start                                  
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot2_ad                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot1_ad_start                                  
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_pot1_ad                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_vbd_i                                              
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_vbd_errors                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_vbd_ctl                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm'
%     gc_vbd_ad                                             
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_st_secs                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds since 1970-1-1 00:00:00'
%                        comment = 'Start of GC time in GMT epoch format'
%     gc_roll_volts                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_roll_secs                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this roll change'
%     gc_roll_retries                                       
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_roll_i                                             
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_roll_errors                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_roll_ad_start                                      
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_roll_ad                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_pitch_volts                                        
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'V'
%     gc_pitch_secs                                         
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds'
%                        comment = 'Elapsed seconds since start of this pitch change'
%     gc_pitch_retries                                      
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_pitch_i                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'A'
%     gc_pitch_errors                                       
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     gc_pitch_ctl                                          
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm'
%     gc_pitch_ad_start                                     
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_pitch_ad                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = '1'
%     gc_ob_vertv                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'cm/s'
%     gc_gcphase                                            
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        flag_meanings = 'pitch vbd active_roll passive_roll roll_back passive'
%                        flag_values   = [1  2  3  4  5  6]
%     gc_end_secs                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units   = 'seconds  since 1970-1-1 00:00:00'
%                        comment = 'End of GC time in GMT epoch format'
%     gc_depth                                              
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   double
%            Attributes:
%                        units = 'meters'
%     gc_data_pts                                           
%            Size:       40x1
%            Dimensions: gc_event
%            Datatype:   int32
%            Attributes:
%                        units = '1'
%     eng_vbdCC                                             
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_rollCtl                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_rollAng                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle roll'
%                        platform = 'glider'
%     eng_rec                                               
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_pitchCtl                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        platform = 'glider'
%     eng_pitchAng                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle pitch'
%                        platform = 'glider'
%     eng_mag_z                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer z'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_mag_y                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer y'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_mag_x                                             
%            Size:       834x1
%            Dimensions: magnetometer_data_point
%            Datatype:   double
%            Attributes:
%                        comment    = 'magnetometer x'
%                        platform   = 'glider'
%                        instrument = 'magnetometer'
%     eng_head                                              
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'degrees'
%                        comment  = 'Vehicle heading (magnetic)'
%                        platform = 'glider'
%     eng_elaps_t_0000                                      
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds'
%                        comment       = 'Elapsed seconds since start of mission'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     eng_elaps_t                                           
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds'
%                        comment       = 'Elapsed seconds since start of dive'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     eng_depth                                             
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'cm'
%                        positive      = 'down'
%                        standard_name = 'depth'
%                        comment       = 'Measured vertical distance below the surface'
%                        platform      = 'glider'
%     eng_GC_phase                                          
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        flag_meanings = 'pitch vbd active_roll passive_roll roll_back passive'
%                        platform      = 'glider'
%                        flag_values   = [1  2  3  4  5  6]
%     east_displacement_gsm                                 
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Eastward displacement from gsm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     east_displacement                                     
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'meters'
%                        comment     = 'Eastward displacement from hdm'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     dissolved_oxygen_sat                                  
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'micromoles/kg'
%                        comment     = 'Calculated saturation value for oxygen given measured presure and corrected temperature, and salinity'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     depth_time                                            
%            Size:       833x1
%            Dimensions: depth_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Pressure sensor time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     depth_depth                                           
%            Size:       833x1
%            Dimensions: depth_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'cm'
%                        positive      = 'down'
%                        standard_name = 'depth'
%                        comment       = 'Measured vertical distance below the surface'
%                        platform      = 'glider'
%     depth_avg_curr_qc                                     
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the dive depth-average current values and displacements'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     depth                                                 
%            Size:       834x1
%            Dimensions: sg_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Depth below the surface, corrected for average latitude'
%                        positive      = 'down'
%                        platform      = 'glider'
%                        standard_name = 'depth'
%                        units         = 'meters'
%                        axis          = 'Z'
%     density_insitu                                        
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'g/m^3'
%                        comment     = 'Sea water in-situ density based on pressure'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     density                                               
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Sea water potential density'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        ref_pressure  = '0'
%                        platform      = 'glider'
%                        standard_name = 'sea_water_density'
%                        units         = 'g/m^3'
%     ctd_time                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Time of CTD sample in GMT epoch format'
%                        standard_name = 'time'
%                        axis          = 'T'
%                        platform      = 'glider'
%     ctd_pressure                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'dbar'
%                        comment       = 'Pressure at CTD thermistor'
%                        standard_name = 'sea_water_pressure'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     ctd_depth                                             
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'CTD thermistor depth corrected for average latitude'
%                        positive      = 'down'
%                        platform      = 'glider'
%                        standard_name = 'depth'
%                        units         = 'meters'
%                        axis          = 'Z'
%     contopt_time                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'AA4330 time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_results_time                                  
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'time for Contros Optode in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_qc                                            
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the Contros optode results'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     contopt_pO2                                           
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'mbar'
%                        instrument = 'contopt'
%                        comment    = 'partial pressure of O2 as reported by instrument'
%                        platform   = 'glider'
%     contopt_instrument_dissolved_oxygen                   
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'micromoles/kg'
%                        _FillValue = NaN
%                        platform   = 'glider'
%                        comment    = 'Dissolved oxygen concentration reported from instrument'
%                        instrument = 'contopt'
%     contopt_dissolved_oxygen_qc                           
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each Contros optode dissolved oxygen value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        platform      = 'glider'
%                        instrument    = 'contopt'
%     contopt_dissolved_oxygen                              
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        comment       = 'Dissolved oxygen concentration'
%                        _FillValue    = NaN
%                        instrument    = 'contopt'
%                        platform      = 'glider'
%                        standard_name = 'mole_concentration_of_dissolved_molecular_oxygen_in_sea_water'
%                        units         = 'micromoles/kg'
%     contopt_Temp                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'degrees_Celsius'
%                        instrument = 'contopt'
%                        comment    = 'As reported by instrument'
%                        platform   = 'glider'
%     contopt_OxySat                                        
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'percent'
%                        instrument = 'contopt'
%                        comment    = 'Oxygen saturation As reported by instrument'
%                        platform   = 'glider'
%     contopt_Dphi                                          
%            Size:       953x1
%            Dimensions: contopt_data_point
%            Datatype:   double
%            Attributes:
%                        units      = 'degrees'
%                        instrument = 'contopt'
%                        comment    = 'as reported by the instrument'
%                        platform   = 'glider'
%     contopt                                               
%            Size:       7x1
%            Dimensions: string_7
%            Datatype:   char
%            Attributes:
%                        long_name           = 'underway oxygen sensor'
%                        ancillary_variables = 'temperature salinity SciCon(contopt: Dphi, pO2, Temp) sg_cal_contopt_A_* sg_cal_contopt_B_* sg_cal_contopt_C_0 sg_cal_contopt_CC_*'
%                        make_model          = 'Contros HydroFlash O2'
%                        nodc_name           = 'optode'
%     conductivity_raw_qc                                   
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each raw conductivity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     conductivity_raw                                      
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'S/m'
%                        comment     = 'Uncorrected conductivity'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     conductivity_qc                                       
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust each corrected conductivity value'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     conductivity                                          
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'S/m'
%                        comment       = 'Conductivity corrected for anomalies'
%                        standard_name = 'sea_water_electrical_conductivity'
%                        coordinates   = 'ctd_time longitude latitude ctd_depth'
%                        platform      = 'glider'
%     buoyancy                                              
%            Size:       954x1
%            Dimensions: ctd_data_point
%            Datatype:   double
%            Attributes:
%                        units       = 'g'
%                        comment     = 'Buoyancy of vehicle, corrected for compression effects'
%                        coordinates = 'ctd_time longitude latitude ctd_depth'
%                        platform    = 'glider'
%     auxCompass_time                                       
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'seconds since 1970-1-1 00:00:00'
%                        comment       = 'Pressure sensor time in GMT epoch format'
%                        standard_name = 'time'
%                        platform      = 'glider'
%     auxCompass_rol                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'roll'
%                        platform      = 'glider'
%     auxCompass_pressureCounts                             
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units    = 'counts'
%                        comment  = 'Uncorrected sea-water pressure in instruments counts'
%                        platform = 'glider'
%     auxCompass_pressure                                   
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'dbar'
%                        comment       = 'Uncorrected sea-water pressure'
%                        standard_name = 'sea_water_pressure'
%                        platform      = 'glider'
%     auxCompass_pit                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'pitch'
%                        platform      = 'glider'
%     auxCompass_hdg                                        
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = 'degrees'
%                        comment       = ' '
%                        standard_name = 'heading'
%                        platform      = 'glider'
%     auxCompass_Mz                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_My                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Mx                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Az                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Ay                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     auxCompass_Ax                                         
%            Size:       954x1
%            Dimensions: auxCompass_data_point
%            Datatype:   double
%            Attributes:
%                        units         = ' '
%                        comment       = ' '
%                        standard_name = ' '
%                        platform      = 'glider'
%     GPSE_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the final GPS information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     GPS2_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the GPS2 information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     GPS1_qc                                               
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the GPS1 information'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
%     CTD_qc                                                
%            Size:       1x1
%            Dimensions: string_1
%            Datatype:   char
%            Attributes:
%                        flag_meanings = 'QC_NO_CHANGE QC_GOOD QC_PROBABLY_GOOD QC_PROBABLY_BAD QC_BAD QC_CHANGED QC_UNSAMPLED QC_INTERPOLATED QC_MISSING'
%                        comment       = 'Whether to trust the corrected CTD values'
%                        flag_values   = '0 1 2 3 4 5 6 8 9'
