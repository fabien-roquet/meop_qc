CDF       
      	DATE_TIME         	STRING256         STRING64   @   STRING32       STRING16      STRING8       STRING4       STRING2       N_PROF        N_PARAM       N_LEVELS      N_CALIB          .   comment              pi_name       IMOS   	data_type         Marine mammals time-series data    format_version        1.1    date_update       2020-05-27T16:01:00Z   version_database      SMRU-NRT   PI        IMOS   reference_file_name       ct150-976-VERT-18_prof.nc      is_the_data_public        nyes: data can be used freely providing that data owner is properly cited (see meop.net for citing information)     nation        	AUSTRALIA      deployment_code       ct150      source        Marine mammal observation      	data_mode         D      
references        http://www.meop.net    reference_doi                Conventions       CF-1.6 Sea-mammals-1.1     Netcdf_version        3.6    naming_authority      BMEOP consortium (Marine Mammals Exploring the Oceans Pole to Pole)     cdm_data_type         Station    geospatial_vertical_min                  geospatial_vertical_max       @�@        data_assembly_center      MEOP/Fabien Roquet (MISU)      distribution_statement       Follow MEOP data policy standards, cf. http://www.meop.net/the-dataset/data-access.html. Data available free of charge. User assumes all risk for use of data. User must display citation in any publication or product using data. User must contact PI prior to any commercial use of data   citation      �The marine mammal data were collected and made freely available by the International MEOP Consortium and the national programs that contribute to it (http://www.meop.net).    thermal_lag_adjustment        no     platform_code         82458      wmo_platform_code         Q9901192   smru_platform_code        ct150-976-VERT-18      species       Weddell seal   time_coverage_start       2019-02-20T00:00:00Z   time_coverage_end         2019-12-01T00:00:00Z   location      Ross Sea   loc_algorithm         K      firmware_version      208    firmware_parameters       CTD_GEN_18C    instr_id      14976      ptt       67170      number_of_ts_profiles         @         number_of_t_profiles      @          number_chla_profiles                 number_doxy_profiles                 number_light_profiles                    geospatial_lat_min        �Sw�/2��   geospatial_lat_max        �Sm�Rn�!   geospatial_lon_min        @d�Y��|M   geospatial_lon_max        @d���"      .   	DATA_TYPE                  comment       	Data type      
_FillValue                    -�   FORMAT_VERSION                 comment       File format version    
_FillValue                    -�   HANDBOOK_VERSION               comment       Data handbook version      
_FillValue                    -�   REFERENCE_DATE_TIME                 comment       !Date of reference for Julian days      conventions       YYYYMMDDHHMISS     
_FillValue                    -�   DATE_CREATION                   comment       Date of file creation      conventions       YYYYMMDDHHMISS     
_FillValue                    -�   DATE_UPDATE                 	long_name         Date of update of this file    conventions       YYYYMMDDHHMISS     
_FillValue                    -�   PLATFORM_NUMBER                   	long_name         Float unique identifier    conventions       WMO float identifier : A9IIIII     
_FillValue                  @  -�   PROJECT_NAME                  comment       Name of the project    
_FillValue                    .<   PI_NAME                   comment       "Name of the principal investigator     
_FillValue                    0<   STATION_PARAMETERS           	            	long_name         ,List of available parameters for the station   conventions       Argo reference table 3     
_FillValue                 �  2<   CYCLE_NUMBER               	long_name         Float cycle number     units         1      conventions       <0..N, 0 : launch cycle (if exists), 1 : first complete cycle   
_FillValue         ��         3�   	DIRECTION                  	long_name         !Direction of the station profiles      conventions       -A: ascending profiles, D: descending profiles      
_FillValue                    3�   DATA_CENTRE                   	long_name         .Data centre in charge of float data processing     conventions       Argo reference table 4     
_FillValue                    3�   DC_REFERENCE                  	long_name         (Station unique identifier in data centre   conventions       Data centre convention     
_FillValue                    3�   DATA_STATE_INDICATOR                  	long_name         1Degree of processing the data have passed through      conventions       Argo reference table 6     
_FillValue                     4�   	DATA_MODE                  	long_name         Delayed mode or real time data     conventions       >R : real time; D : delayed mode; A : real time with adjustment     
_FillValue                    5   INST_REFERENCE                    	long_name         Instrument type    conventions       Brand, type, serial number     
_FillValue                    5   WMO_INST_TYPE                     	long_name         Coded instrument type      conventions       Argo reference table 8     
_FillValue                     7   JULD               	long_name         ?Julian day (UTC) of the station relative to REFERENCE_DATE_TIME    units         "days since 1950-01-01 00:00:00 UTC     calendar      julian     conventions       8Relative julian days with decimal part (as parts of day)   
_FillValue        @�i�          @  7<   JULD_QC                	long_name         Quality on Date and Time   conventions       Argo reference table 2     
_FillValue                    7|   JULD_LOCATION                  	long_name         @Julian day (UTC) of the location relative to REFERENCE_DATE_TIME   units         "days since 1950-01-01 00:00:00 UTC     calendar      julian     conventions       8Relative julian days with decimal part (as parts of day)   
_FillValue        @�i�          @  7�   LATITUDE               	long_name         &Latitude of the station, best estimate     units         degree_north   
_FillValue        @�i�       	valid_min         �V�        	valid_max         @V�           @  7�   	LONGITUDE                  	long_name         'Longitude of the station, best estimate    units         degree_east    
_FillValue        @�i�       	valid_min         �f�        	valid_max         @f�           @  8   POSITION_QC                	long_name         ,Quality on position (latitude and longitude)   conventions       Argo reference table 2     
_FillValue                    8D   POSITIONING_SYSTEM                    	long_name         Positioning system     
_FillValue                  @  8L   PROFILE_PRES_QC                	long_name         #Global quality flag of PRES profile    conventions       Argo reference table 2a    
_FillValue                    8�   PROFILE_PSAL_QC                	long_name         #Global quality flag of PSAL profile    conventions       Argo reference table 2a    
_FillValue                    8�   PROFILE_TEMP_QC                	long_name         #Global quality flag of TEMP profile    conventions       Argo reference table 2a    
_FillValue                    8�   PRES         
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   	valid_min                    	valid_max         @�p        comment       $In situ measurement, sea surface = 0        8�   PRES_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  :�   PRES_ADJUSTED            
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   	valid_min                    	valid_max         @�p        comment       $In situ measurement, sea surface = 0        ;$   PRES_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  =$   PRES_ADJUSTED_ERROR          
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.         =�   TEMP         
         	long_name         $SEA TEMPERATURE IN SITU ITS-90 SCALE   units         degree_Celsius     
_FillValue        G�O�   	valid_min         �          	valid_max         @D         comment       In situ measurement         ?�   TEMP_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  A�   TEMP_ADJUSTED            
         	long_name         $SEA TEMPERATURE IN SITU ITS-90 SCALE   units         degree_Celsius     
_FillValue        G�O�   	valid_min         �          	valid_max         @D         comment       In situ measurement         B$   TEMP_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  D$   TEMP_ADJUSTED_ERROR          
         	long_name         *SEA TEMPERATURE ERROR IN SITU ITS-90 SCALE     units         degree_Celsius     
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.         D�   PSAL         
         	long_name         PRACTICAL SALINITY     units         1e-3   
_FillValue        G�O�   	valid_min                    	valid_max         @E         comment       In situ measurement         F�   PSAL_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  H�   PSAL_ADJUSTED            
         	long_name         ADJUSTED PRACTICAL SALINITY    units         1e-3   
_FillValue        G�O�   	valid_min                    	valid_max         @E         comment       In situ measurement         I$   PSAL_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                  �  K$   PSAL_ADJUSTED_ERROR          
         	long_name         PRACTICAL SALINITY ERROR   units         1e-3   
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.         K�   	PARAMETER               	            	long_name         /List of parameters with calibration information    conventions       Argo reference table 3     
_FillValue                 �  M�   SCIENTIFIC_CALIB_EQUATION               	            	long_name         'Calibration equation for this parameter    
_FillValue                    O$   SCIENTIFIC_CALIB_COEFFICIENT            	            	long_name         $SRDL identifier in the SMRU database   
_FillValue                    g$Argo profile    3.0 3.0 19500101000000  20200527160100  20200527160100  0008245800082458000824580008245800082458000824580008245800082458                                                            MEOP                                                            MEOP                                                            MEOP                                                            MEOP                                                            MEOP                                                            MEOP                                                            MEOP                                                            MEOP                                                            IMOS                                                            IMOS                                                            IMOS                                                            IMOS                                                            IMOS                                                            IMOS                                                            IMOS                                                            IMOSPRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL                                    AAAAAAAAIFIFIFIFIFIFIFIF                                                                                                                                                                                                                                                                                                DDDDDDDD                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                995 995 995 995 995 995 995 995 @��UUU`@��j8�@@��v����@����q�@�প���@��q��@��;�8�@��E�q�11111111@��UUU`@��j8�@@��v����@����q�@�প���@��q��@��;�8�@��E�q��Sm�Rn�!�Svk�LL�Sv�[\E{�Sv�p���Sv�O^U��Sw�/2���Sw��f�]�Swo�J�@d���"@d����B)@d�ǊO @d�Y��|M@d��)V��@d����c@d����@d��D��11111111ARGOS   ARGOS   ARGOS   ARGOS   ARGOS   ARGOS   ARGOS   ARGOS   AAAAAAAAAAAAAAAAAAAAAAAAA   A�  A�  B   BH  Bp  B�  B�                                  @�  A   A�  A�  B   BH  Bp  B�  B�  B�  B�  B�  B�  C  C  C  @�  A   A�  A�  BH  B�  B�  C   C  C  C   CH  C�  C�  C�  C�  @�  A   A�  BH  B�  C  C  C  C  CH  CX  C�  C�  C�  C�  C�  @�  A   A�  BH  BX  Bp  B�  B�  B�  C  CH  C�  C�  C�  C�  C�  A   A�  A�  BH  B�  B�  C  CH                                  A   A�  A�  BH  B�  C  CH  C�                                  A   A�  A�  BH  B�  B�  C  CH                                  11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111A   A�  A�  B   BH  Bp  B�  B�                                  @�  A   A�  A�  B   BH  Bp  B�  B�  B�  B�  B�  B�  C  C  C  @�  A   A�  A�  BH  B�  B�  C   C  C  C   CH  C�  C�  C�  C�  @�  A   A�  BH  B�  C  C  C  C  CH  CX  C�  C�  C�  C�  C�  @�  A   A�  BH  BX  Bp  B�  B�  B�  C  CH  C�  C�  C�  C�  C�  A   A�  A�  BH  B�  B�  C  CH                                  A   A�  A�  BH  B�  C  CH  C�                                  A   A�  A�  BH  B�  B�  C  CH                                  11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O���z��z��z��z��z��Z��Z��Z                                ������
��9X��Z������Ͽ��Ͽ�9X�������
��z�����`B������
���
��ȴ��ȴ��ȴ���y��ȴ��ȴ��������?}�����Z�󕁿�33��n���n���n����������P��+��+��ff���+�����`B��Z���Ͽ�F���
��33��33��33��Kǿ�Kǿ�+���ٿ��ٿ��˿�`B���˿�E����������t����
����\��\��+��Kǿ�+���˿��˿��������                                �����`B��������E���Z���
��33                                �������T���+�����z��Z                                11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111��z��z��z��z��z��Z��Z��Z                                ������
��9X��Z������Ͽ��Ͽ�9X�������
��z�����`B������
���
��ȴ��ȴ��ȴ���y��ȴ��ȴ��������?}�����Z�󕁿�33��n���n���n����������P��+��+��ff���+�����`B��Z���Ͽ�F���
��33��33��33��Kǿ�Kǿ�+���ٿ��ٿ��˿�`B���˿�E����������t����
����\��\��+��Kǿ�+���˿��˿��������                                �����`B��������E���Z���
��33                                �������T���+�����z��Z                                11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���B�%B}�B�+B�%B�%B�B�%B�+                                BJ�BD�BF�BR�B^5B^5BaHB^5By�B�JBaHBbNBl�B�B�=B�JB_;Be`B]/B]/BaHBcTB}�B�1B�+B��B�uB�?B��B�;B�#B�;B`BB_;B^5B^5B_;B|�B�B�B�7B��B��B�!B�^B�wBŢB��B^5BZBYB\)B`BBn�Bp�Bw�B}�B��B��B�RB�LB��B�#B�NBcTBcTBdZBs�Bu�B�%B��B��                                BhsBq�BjBl�B�B��B��B�R                                BjBhsBiyBjBu�B�=B��B�'                                44444444444444441111111111111111111111111111111111111111111111111111111111111111444444444444444444444444444444444444444444444444B�%B}�B�+B�%B�%B�B�%B�+                                BJ�BD�BF�BR�B^5B^5BaHB^5By�B�JBaHBbNBl�B�B�=B�JB_;Be`B]/B]/BaHBcTB}�B�1B�+B��B�uB�?B��B�;B�#B�;B`BB_;B^5B^5B_;B|�B�B�B�7B��B��B�!B�^B�wBŢB��B^5BZBYB\)B`BBn�Bp�Bw�B}�B��B��B�RB�LB��B�#B�NBcTBcTBdZBs�Bu�B�%B��B��                                BhsBq�BjBl�B�B��B��B�R                                BjBhsBiyBjBu�B�=B��B�'                                44444444444444441111111111111111111111111111111111111111111111111111111111111111444444444444444444444444444444444444444444444444>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���>���PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 0.000000e+00  psu/km, s2= 0.000000e+00  psu                                                                                                                                                                                                                 