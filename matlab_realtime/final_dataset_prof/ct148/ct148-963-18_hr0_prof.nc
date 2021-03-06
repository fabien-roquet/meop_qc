CDF       
      	DATE_TIME         	STRING256         STRING64   @   STRING32       STRING16      STRING8       STRING4       STRING2       N_PROF        N_PARAM       N_LEVELS  �   N_CALIB          .   comment              number_of_ts_profiles         @         number_of_t_profiles      @         number_chla_profiles                 number_doxy_profiles                 number_light_profiles                    geospatial_lat_min        �Ke
:��   geospatial_lat_max        �K7�{��<   geospatial_lon_min        @T�S���   geospatial_lon_max        @T���r�k   pi_name       IMOS   	data_type         Marine mammals time-series data    format_version        1.1    date_update       2020-05-27T16:23:38Z   version_database      SMRU-NRT   PI        IMOS   reference_file_name       ct148-963-18_prof.nc   is_the_data_public        nyes: data can be used freely providing that data owner is properly cited (see meop.net for citing information)     nation        	AUSTRALIA      deployment_code       ct148      source        Marine mammal observation      	data_mode         D      
references        http://www.meop.net    reference_doi                Conventions       CF-1.6 Sea-mammals-1.1     Netcdf_version        3.6    naming_authority      BMEOP consortium (Marine Mammals Exploring the Oceans Pole to Pole)     cdm_data_type         Station    geospatial_vertical_min                  geospatial_vertical_max       @�@        data_assembly_center      MEOP/Fabien Roquet (MISU)      distribution_statement       Follow MEOP data policy standards, cf. http://www.meop.net/the-dataset/data-access.html. Data available free of charge. User assumes all risk for use of data. User must display citation in any publication or product using data. User must contact PI prior to any commercial use of data   citation      �The marine mammal data were collected and made freely available by the International MEOP Consortium and the national programs that contribute to it (http://www.meop.net).    thermal_lag_adjustment        no     platform_code         81096      wmo_platform_code         Q9901133   smru_platform_code        ct148-963-18   species       Southern elephant seal     time_coverage_start       2018-12-20T00:00:00Z   time_coverage_end         2019-08-28T00:00:00Z   location      	Kerguelen      loc_algorithm         K      firmware_version      208    firmware_parameters       CTD_GEN_18C    instr_id      14963      ptt       67127         .   	DATA_TYPE                  comment       	Data type      
_FillValue                    -�   FORMAT_VERSION                 comment       File format version    
_FillValue                    -�   HANDBOOK_VERSION               comment       Data handbook version      
_FillValue                    -�   REFERENCE_DATE_TIME                 comment       !Date of reference for Julian days      conventions       YYYYMMDDHHMISS     
_FillValue                    -�   DATE_CREATION                   comment       Date of file creation      conventions       YYYYMMDDHHMISS     
_FillValue                    -�   DATE_UPDATE                 	long_name         Date of update of this file    conventions       YYYYMMDDHHMISS     
_FillValue                    -�   PLATFORM_NUMBER                   	long_name         Float unique identifier    conventions       WMO float identifier : A9IIIII     
_FillValue                    -�   PROJECT_NAME                  comment       Name of the project    
_FillValue                  �  .   PI_NAME                   comment       "Name of the principal investigator     
_FillValue                  �  .�   STATION_PARAMETERS           	            	long_name         ,List of available parameters for the station   conventions       Argo reference table 3     
_FillValue                  �  /�   CYCLE_NUMBER               	long_name         Float cycle number     units         1      conventions       <0..N, 0 : launch cycle (if exists), 1 : first complete cycle   
_FillValue         ��        0$   	DIRECTION                  	long_name         !Direction of the station profiles      conventions       -A: ascending profiles, D: descending profiles      
_FillValue                    00   DATA_CENTRE                   	long_name         .Data centre in charge of float data processing     conventions       Argo reference table 4     
_FillValue                    04   DC_REFERENCE                  	long_name         (Station unique identifier in data centre   conventions       Data centre convention     
_FillValue                  `  0<   DATA_STATE_INDICATOR                  	long_name         1Degree of processing the data have passed through      conventions       Argo reference table 6     
_FillValue                    0�   	DATA_MODE                  	long_name         Delayed mode or real time data     conventions       >R : real time; D : delayed mode; A : real time with adjustment     
_FillValue                    0�   INST_REFERENCE                    	long_name         Instrument type    conventions       Brand, type, serial number     
_FillValue                  �  0�   WMO_INST_TYPE                     	long_name         Coded instrument type      conventions       Argo reference table 8     
_FillValue                    1l   JULD               	long_name         ?Julian day (UTC) of the station relative to REFERENCE_DATE_TIME    units         "days since 1950-01-01 00:00:00 UTC     calendar      julian     conventions       8Relative julian days with decimal part (as parts of day)   
_FillValue        @�i�            1x   JULD_QC                	long_name         Quality on Date and Time   conventions       Argo reference table 2     
_FillValue                    1�   JULD_LOCATION                  	long_name         @Julian day (UTC) of the location relative to REFERENCE_DATE_TIME   units         "days since 1950-01-01 00:00:00 UTC     calendar      julian     conventions       8Relative julian days with decimal part (as parts of day)   
_FillValue        @�i�            1�   LATITUDE               	long_name         &Latitude of the station, best estimate     units         degree_north   
_FillValue        @�i�       	valid_min         �V�        	valid_max         @V�             1�   	LONGITUDE                  	long_name         'Longitude of the station, best estimate    units         degree_east    
_FillValue        @�i�       	valid_min         �f�        	valid_max         @f�             1�   POSITION_QC                	long_name         ,Quality on position (latitude and longitude)   conventions       Argo reference table 2     
_FillValue                    1�   POSITIONING_SYSTEM                    	long_name         Positioning system     
_FillValue                    1�   PROFILE_PRES_QC                	long_name         #Global quality flag of PRES profile    conventions       Argo reference table 2a    
_FillValue                    1�   PROFILE_PSAL_QC                	long_name         #Global quality flag of PSAL profile    conventions       Argo reference table 2a    
_FillValue                    1�   PROFILE_TEMP_QC                	long_name         #Global quality flag of TEMP profile    conventions       Argo reference table 2a    
_FillValue                    2    PRES         
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   	valid_min                    	valid_max         @�p        comment       $In situ measurement, sea surface = 0     .�  2   PRES_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 �  `�   PRES_ADJUSTED            
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   	valid_min                    	valid_max         @�p        comment       $In situ measurement, sea surface = 0     .�  l�   PRES_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 �  �|   PRES_ADJUSTED_ERROR          
         	long_name         SEA PRESSURE   units         decibar    
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.      .�  �4   TEMP         
         	long_name         $SEA TEMPERATURE IN SITU ITS-90 SCALE   units         degree_Celsius     
_FillValue        G�O�   	valid_min         �          	valid_max         @D         comment       In situ measurement      .�  �   TEMP_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 � �   TEMP_ADJUSTED            
         	long_name         $SEA TEMPERATURE IN SITU ITS-90 SCALE   units         degree_Celsius     
_FillValue        G�O�   	valid_min         �          	valid_max         @D         comment       In situ measurement      .� �   TEMP_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 � ?�   TEMP_ADJUSTED_ERROR          
         	long_name         *SEA TEMPERATURE ERROR IN SITU ITS-90 SCALE     units         degree_Celsius     
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.      .� KD   PSAL         
         	long_name         PRACTICAL SALINITY     units         1e-3   
_FillValue        G�O�   	valid_min                    	valid_max         @E         comment       In situ measurement      .� z$   PSAL_QC          
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 � �   PSAL_ADJUSTED            
         	long_name         ADJUSTED PRACTICAL SALINITY    units         1e-3   
_FillValue        G�O�   	valid_min                    	valid_max         @E         comment       In situ measurement      .� ��   PSAL_ADJUSTED_QC         
         	long_name         quality flag   conventions       Argo reference table 2     
_FillValue                 � �   PSAL_ADJUSTED_ERROR          
         	long_name         PRACTICAL SALINITY ERROR   units         1e-3   
_FillValue        G�O�   comment       WContains the error on the adjusted values as determined by the delayed mode QC process.      .� �T   	PARAMETER               	            	long_name         /List of parameters with calibration information    conventions       Argo reference table 3     
_FillValue                  � 4   SCIENTIFIC_CALIB_EQUATION               	            	long_name         'Calibration equation for this parameter    
_FillValue                 	  �   SCIENTIFIC_CALIB_COEFFICIENT            	            	long_name         $SRDL identifier in the SMRU database   
_FillValue                 	  '�Argo profile    3.0 3.0 19500101000000  20200527162338  20200527162338  000810960008109600081096                                                            MEOP                                                            MEOP                                                            MEOP                                                            IMOS                                                            IMOS                                                            IMOSPRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL                     AAA IFIFIF                                                                                                              DDD                                                                                                                                                                                                 995 995 995 @���8�@���8�@��d    111 @���8�@���8�@��d    �KUeH���K7�{��<�Ke
:��@T���r�k@T�
�@T�S���111 ARGOS   ARGOS   ARGOS   AAA AAA AAA ?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  ?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  ?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  ?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  ?�  @   @@  @�  @�  @�  @�  A   A  A   A0  A@  AP  A`  Ap  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  A�  B   B  B  B  B  B  B  B  B   B$  B(  B,  B0  B4  B8  B<  B@  BD  BH  BL  BP  BT  BX  B\  B`  Bd  Bh  Bl  Bp  Bt  Bx  B|  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  B�  C   C  C  C  C  C  C  C  C  C	  C
  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C  C   C!  C"  C#  C$  C%  C&  C'  C(  C)  C*  C+  C,  C-  C.  C/  C0  C1  C2  C3  C4  C5  C6  C7  C8  C9  C:  C;  C<  C=  C>  C?  C@  CA  CB  CC  CD  CE  CF  CG  CH  CI  CJ  CK  CL  CM  CN  CO  CP  CQ  CR  CS  CT  CU  CV  CW  CX  CY  CZ  C[  C\  C]  C^  C_  C`  Ca  Cb  Cc  Cd  Ce  Cf  Cg  Ch  Ci  Cj  Ck  Cl  Cm  Cn  Co  Cp  Cq  Cr  Cs  Ct  Cu  Cv  Cw  Cx  Cy  Cz  C{  C|  C}  C~  C  C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C C�  CÀ C�  CĀ C�  Cŀ C�  Cƀ C�  Cǀ C�  CȀ C�  Cɀ C�  Cʀ C�  Cˀ C�  C̀ C�  C̀ C�  C΀ C�  Cπ C�  CЀ C�  Cр C�  CҀ C�  CӀ C�  CԀ C�  CՀ C�  Cր C�  C׀ C�  C؀ C�  Cـ C�  Cڀ C�  Cۀ C�  C܀ C�  C݀ C�  Cހ C�  C߀ C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C� C�  C� C�  C� C�  C� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� C�  C�� D   D @ D � D � D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D	  D	@ D	� D	� D
  D
@ D
� D
� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D  D@ D� D� D   D @ D � D � D!  D!@ D!� D!� D"  D"@ D"� D"� D#  D#@ D#� D#� D$  D$@ D$� D$� D%  D%@ D%� D%� D&  D&@ D&� D&� D'  D'@ D'� D'� D(  D(@ D(� D(� D)  D)@ D)� D)� D*  D*@ D*� D*� D+  D+@ D+� D+� D,  D,@ D,� D,� D-  D-@ D-� D-� D.  D.@ D.� D.� D/  D/@ D/� D/� D0  D0@ D0� D0� D1  D1@ D1� D1� D2  D2@ D2� D2� D3  D3@ D3� D3� D4  D4@ D4� D4� D5  D5@ D5� D5� D6  D6@ D6� D6� D7  D7@ D7� D7� D8  D8@ D8� D8� D9  D9@ D9� D9� D:  D:@ D:� D:� D;  D;@ D;� D;� D<  D<@ D<� D<� D=  D=@ D=� D=� D>  D>@ D>� D>� D?  D?@ D?� D?� D@  D@@ D@� D@� DA  DA@ DA� DA� DB  DB@ DB� DB� DC  DC@ DC� DC� DD  DD@ DD� DD� DE  DE@ DE� DE� DF  DF@ DF� DF� DG  DG@ DG� DG� DH  DH@ DH� DH� DI  DI@ DI� DI� DJ  DJ@ DJ� DJ� DK  DK@ DK� DK� DL  DL@ DL� DL� DM  DM@ DM� DM� DN  DN@ DN� DN� DO  DO@ DO� DO� DP  DP@ DP� DP� DQ  DQ@ DQ� DQ� DR  DR@ DR� DR� DS  DS@ DS� DS� DT  DT@ DT� DT� DU  DU@ DU� DU� DV  DV@ DV� DV� DW  DW@ DW� DW� DX  DX@ DX� DX� DY  DY@ DY� DY� DZ  DZ@ DZ� DZ� D[  D[@ D[� D[� D\  D\@ D\� D\� D]  D]@ D]� D]� D^  D^@ D^� D^� D_  D_@ D_� D_� D`  D`@ D`� D`� Da  Da@ Da� Da� Db  Db@ Db� Db� Dc  Dc@ Dc� Dc� Dd  Dd@ Dd� Dd� De  De@ De� De� Df  Df@ Df� Df� Dg  Dg@ Dg� Dg� Dh  Dh@ Dh� Dh� Di  Di@ Di� Di� Dj  Dj@ Dj� Dj� Dk  Dk@ Dk� Dk� Dl  Dl@ Dl� Dl� Dm  Dm@ Dm� Dm� Dn  Dn@ Dn� Dn� Do  Do@ Do� Do� Dp  Dp@ Dp� Dp� Dq  Dq@ Dq� Dq� Dr  Dr@ Dr� Dr� Ds  Ds@ Ds� Ds� Dt  Dt@ Dt� Dt� Du  Du@ Du� Du� Dv  Dv@ Dv� Dv� Dw  Dw@ Dw� Dw� Dx  Dx@ Dx� Dx� Dy  Dy@ Dy� Dy� Dz  111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>G�>G�>G�>G�>G��>G��>G�_>G�S>G��>G�>G��>G~�>GL�>G}>F��>F�K>FF\>F>EЙ>E��>Eu�>EG>E�>D�r>D�>D|S>DH�>D:>C�r>C�r>C_>COS>C \>B�>B��>B� >Bo�>BE�>BO>A��>A΃>A�0>A�v>A];>A8g>A�>@�>@�d>@�@>@�>@G�>?�F>?U�>>��>=�!>=Z><>;�>9��>8Բ>7�>6y�>5Bi>4�>2�>1��>0F�>/3>-��>,��>+OX>*�>(��>'�">&��>%m�>$Q�>#=�>"1�>!.> 4@>D�>`�>�h>��>�>ZS>��>=�>��>xw><�>> 
>E�>��>�>��>� >�>t�>!C5>$��>)j�>.�^>4Z>>:�+>A�>I�>QC>Y�}>b�>l��>v�>���>��%>�/�>��>��>���>���>��R>���>ƒ�>��>���>�)i>�V>�B-?��?>�?�	?�B?��?$-s?(��?.��?7P?@��?Iɔ?R9�?Y�[?_Q?c�
?f��?iaU?kj=?mD?n��?oݯ?q<?r	?st?t?u\?v"�?wE;?x�P?y�H?{��?}��?�m?�w�?�S�?�x#?���?���?��&?��?��?���?���?��?��X?��>?��?Ȭ�?�P?��?�4:?��?�Z?�N"?��?���?�i�?���?�]�?���?�%�?مT?��?�J7?ڲ�?��?یq?��&?�`�?ܾ�?�V?�Y?ݫX?�<?�b�?��k?�.-?ߙt?��?�x-?��?�^L?�� ?�HG?��?�3>?�Y?��?䐗?�R?�t�?��/?�T?��c?�-?�*?��z?�f?�ʻ?�-�?鎪?���?�K<?��?� �?�X�?��?�M?�V1?�z?��4?�En?�6?�ݜ?�'�?�p}?�?���?�C�?�j?���?��?�Pb?�?���?��?�Q<?�)?�ε?��?�J�?�?��g?�?�A�?�P?�?��?�9=?�w�?��p?���?�5?�u ?��g?��M?�7�?�y�?��$?��/?�B�?���?�˘?��?�Vs?���?��?�)�?�p�?��D?���?�F�?��?���?�T?�a?���?��?�,5?�m?��?��V?�)q?�iM?���?��*?�-?�o�?���?��Q?�:f?�~�?���@ �@ 'A@ J@ m@ �
@ �@ �@ �@�@>�@aq@��@�B@�T@� @�@,�@M�@m�@��@�@��@�@�@$�@@�@\a@w@��@��@��@��@��@�@�@*u@;�@L2@[%@h�@t�@�@�@��@�@��@�>@�t@�=@��@�[@��@�P@�l@��@��@�@��@��@�(@��@�:@��@�@��@}�@v�@o"@g,@^�@V^@M�@D�@;�@2w@)G@ @�@�@�@�9@�@�`@�Z@ۣ@�D@�C@ƨ@�X@�1@�/@�P@��@��@�b@��@��@�B@�@��@}�@x�@s�@nv@im@dh@_d@Z`@U\@PT@KJ@F;@A&@<@6�@1�@,�@'M@"@�@V@�@u@�@`@��@�@�W@�@�@��@��@��@̤@�w@�:@��@��@�@��@��@�T@��@��@��@}�@v�@o�@h�@a`@Z@R�@K@C�@;�@4@,D@$W@T@;@
@�@�b@��@�Y@�@��@�@�@�@��@��@�*@��@�@�H@{k@qn@gR@]@R�@H2@=�@2�@'�@�@�@%@ ��@ ��@ ��@ ��@ ʅ@ �@ �i@ ��@ ��@ �s@ }@ o�@ a�@ T)@ F0@ 8@ )�@ T@ �?�� ?��<?��-?���?��8?�dS?�E)?�%�?�
?��?���?��q?���?�c�?�B�?�!A?���?���?���?��t?�v�?�TJ?�1h?�T?��?�ǜ?���?��*?�\/?�8	?��?��A?�ʢ?���?���?�[�?�6�?�^?���?��W?���?�z�?�T�?�.�?��?��?��F?���?�oh?�H�?�";?���?���?���?��?�`(?�9.?�*?��?��?���?�u�?�N�?�'g?� 4?���?���?���?�c_?�<,?��?���?�ƫ?���?�xs?�Qd?�*]?�a?��q?���?�?�g�?�A8?��?���?��z?�?�?�Zl?�4>?�(?��+?��G?�~?�v�?�Q??�+�?�v?��A?�+?�7?�re?�M�?�)+?��?���?�l?�{?�t�?�Q?�-�?�
T?��6?��E??�~�?�\�?�:V?�S?���?���?�{?�F?�qF?�P|?�/�?��?��m?�υ?���?�c?�q,?�R1?�3t?��?���?�ش?��?�u?�8?�c=?�F�?�*?��?���?��Z?��?��?�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gsq>g�2>g�:>g�^>g��>h	>hH�>hy >h�&>h�;>i�>i;�>ij7>i�o>i�>i�#>ju>j<
>j`�>j��>j�]>j�>j�>j�f>k>k3>kJ[>k_�>ks}>k�>k��>k��>k�Q>k��>k|�>kh�>kO	>k0�>k>j�E>j��>j�I>j\�>j'�>i�>i��>iv�>i6�>h�d>h��>heP>hg>g��>g|�>g*>fԔ>f|T>f!6>e�>ea�>d��>d��>d*�>c��>cH�>b��>bV�>a�>aR�>`�[>`:�>_��>_�>^m	>]��>]�>\e�>[��>Z�>Z�>Y"�>W��>VOQ>T�G>R��>PV�>M�>Kd>H��>E�^>B��>?9�>;��>7�n>3�`>/�j>*�->&f> �%>U>w�>B�>�l>զ=�KC=�^i=��=�Q�=���=���=��`=�p={�=e`B=N�e=4��=r�=��=+�=a�v=�5=�l�>Lb�>¦X?��?_�U?�5F?�"�?� ?���?�q�?�r�?Ќ.?س�?��?�,I?�^?��?���?��'?�]?�C�?���?��?� �@ �@ ^�@ ��@ �,@�@?#@\n@rK@�@��@�D@��@�n@�Z@��@��@��@��@�'@��@d@}�@}�@~�@�>@��@�X@�:@��@��@�_@�J@�@,@-@S�@}�@��@܁@�@E�@}Q@��@�s@-b@j<@��@��@$E@b�@�\@߾@�@[w@��@��@�@K@@��@�}@��@*�@_a@�e@��@�\@	!@	L�@	vd@	��@	¨@	�@
�@
!�@
;K@
Q�@
d�@
tG@
�@
�"@
�@
�J@
�@
u[@
c�@
K�@
-0@
�@	�#@	��@	j@	%�@�=@��@)@ŕ@Z�@�j@q`@�?@o@�@Y,@Ƿ@2�@�1@b@f@ ��@ -�?�#Y?���?���?��e?�f�?�F�?�.:?�?��?�r?�0�?�N#?�xa?��?���?�G�?�F?��?�"?�?��"?�X?�T?��I?�D?�]�?�<�?�'|?��?��?�%�?�7�?�Rc?�t�?�J?�Ϋ?�[?�A�?��?���?��?�f�?�_?��?�l�?��g?�*�?���?��?�Z=?��+?�-�?�~?��?�t�?��T?�R�?���?�3A?���?��?���?��8?�f�?���?�F�?��?�$�?��
?� y?�m?���?�C�?���?��?�~^?�� ?�Jn?���?�|?�s?�� ?�1�?���?��@ "K@ Nz@ y�@ �E@ ��@ �u@ @D�@j{@�@��@�@�Y@p@5N@R�@o2@�"@��@��@�V@�\@��@�@}@*�@6�@AT@I�@O�@S�@U�@T�@Q�@L@C�@9|@.�@#�@�@�@��@�@��@�t@Ƣ@�R@��@�@@��@uO@c�@Q�@?@,@�@ @��@�W@�u@�8@��@��@p@Y�@C!@,@�@ � @ � @ �@ ��@ �+@ �t@ j�@ Q�@ 8O@ �@ �?���?���?�q?�=p?�	�?���?��?�n?�:/?�K?��r?���?�j�?�7p?�?���?���?�j�?�8M?��?���?��*?�p�?�?�?��?�ޠ?���?�4?�P%?�!�?��j?���?���?�l?�?�?�n?��v?��?��D?�l?�Cv?�{?�� ?��h?��U?���?�]%?�9?��?���?���?��a?���?�n�?�ON?�0�?��?��r?���?���?���?��?�l�?�Rg?�8v?��?�Y?��-?��D?���?��6?�?�r+?�Z�?�C"?�+�?�?��p?��?���?��?�:?��?�{�?�f�?�Q�?�=2?�(�?��?� �?��(?�٭?��g?�U?�w?��?�{O?�i?�V�?�E ?�3C?�!�?�Q?��?��?��*?��q?��?�t?�0?�?�{?�k??�[�?�K�?�<�?�-3?� ?��?���?��?��S?�Ӭ?��?�?�I?�?���?�}�?�o�?�a�?�S�?�E�?�8+?�*t?��?�.?��?��?��?��-?���?�b?�??�_?�?�{�?�n?�a7?�S�?�F�?�9^?�,?��?�m?�?���?��O?���?��j?���?�`?��?�*?�|?�|�?�n�?�a?�S5?�E<?�71?�)?��?��?��G?���?��W?�ҽ?��?��B?��a?�f?�Q?�y"?�i�?�Zq?�J�?�;O?�+�?��?��?���?��p?��?�ʡ?�	?�O?�u?�x?�vZ?�e?�S�?�B.?�0�?��?��?���?��{?�� ?�à?��?�7?�M?�x??�e?�Q�?�>C?�*�?��?�?��?���?�Ʋ?�S?��?�8?�t}?�_�?�J�?�5�?� ?�@?���?��{?���?�d?韽?�?�t@?�^n?�H�?�2�?��?��?���?���?���?�	?�&?�M?�m�?�W�?�B%?�,�?�'?��?��?�ם?���?�?�L?�?�e�?�H�?�)u?��?��?�
?敺?�k4?�>~?��?�ޤ?嫑?�vr?�?Q?�;?��<?�b?�O�?�Z?��M?㉦?�Dz?���?��?�l�?�"-?�֤?�?�<�?��{?���?�P?� -?߯�?�__?��?޾?�m�?�M?��a?�}�?�/G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>�+>�+>�+>�+>�R�>��>���>�o>�o>�o>��>�,>�E�>�cS>��J>��->��N>�ܹ>��>��>�`>��>��a>��>���>��d>�Ř>���>�!�>�V�>���>���>��>�FM>���>���>�9->���>��>��)>�]�>�*D>�6>�6h>���>��>���>��9>��>��F>��8>���>��F>�]9>Ᏺ>���>��?ت?ֵ?��??`?r�?sw?�P?0o?�/?�0?��?�?�O?�o?϶?�4?��?�A?��?�,?
}}?	x�?uf?q�?l�?ed?Y�?HV?0?�>��[>�e>>��H>�X�>��<>��1>�>!>�x.>�z>�	�>偩>�6�>�G�>��0>߅�>�v#>�W>���>�>��??	b!?�Z?�c?&ff?5�?N��?o��?�U�?�e?���?�?���?�Ѐ?๱?�?��5?��@�@6�@>�@*8@��@
�P@"�@��@�B@�l@�/@�@H
@�N@S^@��@��@3n@Z@t;@�>@�>@�;@�@s�@_�@GA@*q@
@�@��@�X@n]@B�@m@�@�@��@^=@/�@U@�9@��@xG@K�@�@�O@��@�@w@O@'�@�@�7@��@�9@q�@O�@/"@G@�V@�P@�4@�@}�@c_@I�@1r@�@R@��@�%@Ś@�#@��@��@�b@t3@f�@Z�@O'@D}@:�@1q@(�@!.@ @j@c@�@�@�]@�H@��@�Y@�r@��@�@�@�@�@�@�@�@�@�G@�%@�+@�U@�@�@�@�@��@�@�S@�+@�@��@��@��@��@��@�@�~@�Z@�+@��@�@�O@��@�g@��@�(@�c@��@��@�l@�0@��@�N@�@��@��@�@�S@��@�@�@��@�@��@�@��@ٍ@��@��@ͪ@�@�2@��@�`@�l@�@�^@�<@��@��@�5@~D@t�@j�@`d@UY@I�@=�@27@&�@U@@@�@�>@�@��@�y@�@��@��@��@��@��@��@~�@u,@kz@a�@X9@N�@E@;�@2@(�@"@�@,@�@
�+@
�@
�@
�}@
��@
�.@
�t@
��@
��@
��@
��@
��@
��@
yy@
o"@
d�@
Z&@
O}@
D�@
9�@
.�@
#�@
H@
�@
4@	�m@	�}@	�`@	�@	Ğ@	��@	�@	�@	��@	�U@	u�@	g�@	Y�@	K<@	<�@	-�@	�@	M@��@��@ߞ@�,@�p@�j@�@�x@x�@fK@S�@@�@-�@@&@��@�K@�T@��@�K@�7@p�@Y�@B�@+@�@��@��@�I@��@��@q!@S�@5�@�@�[@�S@��@�|@s�@Qe@.�@2@�Y@�@�B@y@Sl@-e@�@�5@�@��@i�@A�@}@��@�@�	@u�@L\@"�@�@�#@�&@{@P�@&�@ �o@ �'@ ��@ }�@ S]@ )-?��?��
?�V.?��?��:?�\5?�	�?��B?�eg?�?��?�r�?�"�?���?��2?�7R?��(?���?�R?�L?��X?�tI?�,'?���?���?�Y�?��?�ұ?���?�PF?��?�ҹ?���?�ZT?� (?��a?��
?�z*?�E�?��?��?��?�?�W�?�-=?�l?��f?�5?��?�su?�S�?�5�?��?���?��<?�?�?�?�i6?�M8?�1�?�+?��?��e?���?��?�-?�x�?�_�?�F�?�.�?��?���?��?�И?��?��?���?�xd?�cE?�N�?�:,?�&3?��?��m?��?��=?��??ﶩ?�|??�`?�ts?�d�?�U�?�G8?�9?�+:?��?��?��?���?��?���?��L?��#?��q?�7?�w?�1?�f?�?�E?��?�?��?�|�?�x�?�t�?�qs?�n�?�l^?�j�?�i^?�h�?�h{?�h�?�i�?�k,?�m'?�o�?�r�?�vg?�z�?�Z???�?�??��??�
?��?�ΐ?�ٹ?��|?���?���?�k?��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999911111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111199999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999>G�>G�>G�>G�>G��>G��>G�_>G�S>G��>G�>G��>G~�>GL�>G}>F��>F�K>FF\>F>EЙ>E��>Eu�>EG>E�>D�r>D�>D|S>DH�>D:>C�r>C�r>C_>COS>C \>B�>B��>B� >Bo�>BE�>BO>A��>A΃>A�0>A�v>A];>A8g>A�>@�>@�d>@�@>@�>@G�>?�F>?U�>>��>=�!>=Z><>;�>9��>8Բ>7�>6y�>5Bi>4�>2�>1��>0F�>/3>-��>,��>+OX>*�>(��>'�">&��>%m�>$Q�>#=�>"1�>!.> 4@>D�>`�>�h>��>�>ZS>��>=�>��>xw><�>> 
>E�>��>�>��>� >�>t�>!C5>$��>)j�>.�^>4Z>>:�+>A�>I�>QC>Y�}>b�>l��>v�>���>��%>�/�>��>��>���>���>��R>���>ƒ�>��>���>�)i>�V>�B-?��?>�?�	?�B?��?$-s?(��?.��?7P?@��?Iɔ?R9�?Y�[?_Q?c�
?f��?iaU?kj=?mD?n��?oݯ?q<?r	?st?t?u\?v"�?wE;?x�P?y�H?{��?}��?�m?�w�?�S�?�x#?���?���?��&?��?��?���?���?��?��X?��>?��?Ȭ�?�P?��?�4:?��?�Z?�N"?��?���?�i�?���?�]�?���?�%�?مT?��?�J7?ڲ�?��?یq?��&?�`�?ܾ�?�V?�Y?ݫX?�<?�b�?��k?�.-?ߙt?��?�x-?��?�^L?�� ?�HG?��?�3>?�Y?��?䐗?�R?�t�?��/?�T?��c?�-?�*?��z?�f?�ʻ?�-�?鎪?���?�K<?��?� �?�X�?��?�M?�V1?�z?��4?�En?�6?�ݜ?�'�?�p}?�?���?�C�?�j?���?��?�Pb?�?���?��?�Q<?�)?�ε?��?�J�?�?��g?�?�A�?�P?�?��?�9=?�w�?��p?���?�5?�u ?��g?��M?�7�?�y�?��$?��/?�B�?���?�˘?��?�Vs?���?��?�)�?�p�?��D?���?�F�?��?���?�T?�a?���?��?�,5?�m?��?��V?�)q?�iM?���?��*?�-?�o�?���?��Q?�:f?�~�?���@ �@ 'A@ J@ m@ �
@ �@ �@ �@�@>�@aq@��@�B@�T@� @�@,�@M�@m�@��@�@��@�@�@$�@@�@\a@w@��@��@��@��@��@�@�@*u@;�@L2@[%@h�@t�@�@�@��@�@��@�>@�t@�=@��@�[@��@�P@�l@��@��@�@��@��@�(@��@�:@��@�@��@}�@v�@o"@g,@^�@V^@M�@D�@;�@2w@)G@ @�@�@�@�9@�@�`@�Z@ۣ@�D@�C@ƨ@�X@�1@�/@�P@��@��@�b@��@��@�B@�@��@}�@x�@s�@nv@im@dh@_d@Z`@U\@PT@KJ@F;@A&@<@6�@1�@,�@'M@"@�@V@�@u@�@`@��@�@�W@�@�@��@��@��@̤@�w@�:@��@��@�@��@��@�T@��@��@��@}�@v�@o�@h�@a`@Z@R�@K@C�@;�@4@,D@$W@T@;@
@�@�b@��@�Y@�@��@�@�@�@��@��@�*@��@�@�H@{k@qn@gR@]@R�@H2@=�@2�@'�@�@�@%@ ��@ ��@ ��@ ��@ ʅ@ �@ �i@ ��@ ��@ �s@ }@ o�@ a�@ T)@ F0@ 8@ )�@ T@ �?�� ?��<?��-?���?��8?�dS?�E)?�%�?�
?��?���?��q?���?�c�?�B�?�!A?���?���?���?��t?�v�?�TJ?�1h?�T?��?�ǜ?���?��*?�\/?�8	?��?��A?�ʢ?���?���?�[�?�6�?�^?���?��W?���?�z�?�T�?�.�?��?��?��F?���?�oh?�H�?�";?���?���?���?��?�`(?�9.?�*?��?��?���?�u�?�N�?�'g?� 4?���?���?���?�c_?�<,?��?���?�ƫ?���?�xs?�Qd?�*]?�a?��q?���?�?�g�?�A8?��?���?��z?�?�?�Zl?�4>?�(?��+?��G?�~?�v�?�Q??�+�?�v?��A?�+?�7?�re?�M�?�)+?��?���?�l?�{?�t�?�Q?�-�?�
T?��6?��E??�~�?�\�?�:V?�S?���?���?�{?�F?�qF?�P|?�/�?��?��m?�υ?���?�c?�q,?�R1?�3t?��?���?�ش?��?�u?�8?�c=?�F�?�*?��?���?��Z?��?��?�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gl�>gsq>g�2>g�:>g�^>g��>h	>hH�>hy >h�&>h�;>i�>i;�>ij7>i�o>i�>i�#>ju>j<
>j`�>j��>j�]>j�>j�>j�f>k>k3>kJ[>k_�>ks}>k�>k��>k��>k�Q>k��>k|�>kh�>kO	>k0�>k>j�E>j��>j�I>j\�>j'�>i�>i��>iv�>i6�>h�d>h��>heP>hg>g��>g|�>g*>fԔ>f|T>f!6>e�>ea�>d��>d��>d*�>c��>cH�>b��>bV�>a�>aR�>`�[>`:�>_��>_�>^m	>]��>]�>\e�>[��>Z�>Z�>Y"�>W��>VOQ>T�G>R��>PV�>M�>Kd>H��>E�^>B��>?9�>;��>7�n>3�`>/�j>*�->&f> �%>U>w�>B�>�l>զ=�KC=�^i=��=�Q�=���=���=��`=�p={�=e`B=N�e=4��=r�=��=+�=a�v=�5=�l�>Lb�>¦X?��?_�U?�5F?�"�?� ?���?�q�?�r�?Ќ.?س�?��?�,I?�^?��?���?��'?�]?�C�?���?��?� �@ �@ ^�@ ��@ �,@�@?#@\n@rK@�@��@�D@��@�n@�Z@��@��@��@��@�'@��@d@}�@}�@~�@�>@��@�X@�:@��@��@�_@�J@�@,@-@S�@}�@��@܁@�@E�@}Q@��@�s@-b@j<@��@��@$E@b�@�\@߾@�@[w@��@��@�@K@@��@�}@��@*�@_a@�e@��@�\@	!@	L�@	vd@	��@	¨@	�@
�@
!�@
;K@
Q�@
d�@
tG@
�@
�"@
�@
�J@
�@
u[@
c�@
K�@
-0@
�@	�#@	��@	j@	%�@�=@��@)@ŕ@Z�@�j@q`@�?@o@�@Y,@Ƿ@2�@�1@b@f@ ��@ -�?�#Y?���?���?��e?�f�?�F�?�.:?�?��?�r?�0�?�N#?�xa?��?���?�G�?�F?��?�"?�?��"?�X?�T?��I?�D?�]�?�<�?�'|?��?��?�%�?�7�?�Rc?�t�?�J?�Ϋ?�[?�A�?��?���?��?�f�?�_?��?�l�?��g?�*�?���?��?�Z=?��+?�-�?�~?��?�t�?��T?�R�?���?�3A?���?��?���?��8?�f�?���?�F�?��?�$�?��
?� y?�m?���?�C�?���?��?�~^?�� ?�Jn?���?�|?�s?�� ?�1�?���?��@ "K@ Nz@ y�@ �E@ ��@ �u@ @D�@j{@�@��@�@�Y@p@5N@R�@o2@�"@��@��@�V@�\@��@�@}@*�@6�@AT@I�@O�@S�@U�@T�@Q�@L@C�@9|@.�@#�@�@�@��@�@��@�t@Ƣ@�R@��@�@@��@uO@c�@Q�@?@,@�@ @��@�W@�u@�8@��@��@p@Y�@C!@,@�@ � @ � @ �@ ��@ �+@ �t@ j�@ Q�@ 8O@ �@ �?���?���?�q?�=p?�	�?���?��?�n?�:/?�K?��r?���?�j�?�7p?�?���?���?�j�?�8M?��?���?��*?�p�?�?�?��?�ޠ?���?�4?�P%?�!�?��j?���?���?�l?�?�?�n?��v?��?��D?�l?�Cv?�{?�� ?��h?��U?���?�]%?�9?��?���?���?��a?���?�n�?�ON?�0�?��?��r?���?���?���?��?�l�?�Rg?�8v?��?�Y?��-?��D?���?��6?�?�r+?�Z�?�C"?�+�?�?��p?��?���?��?�:?��?�{�?�f�?�Q�?�=2?�(�?��?� �?��(?�٭?��g?�U?�w?��?�{O?�i?�V�?�E ?�3C?�!�?�Q?��?��?��*?��q?��?�t?�0?�?�{?�k??�[�?�K�?�<�?�-3?� ?��?���?��?��S?�Ӭ?��?�?�I?�?���?�}�?�o�?�a�?�S�?�E�?�8+?�*t?��?�.?��?��?��?��-?���?�b?�??�_?�?�{�?�n?�a7?�S�?�F�?�9^?�,?��?�m?�?���?��O?���?��j?���?�`?��?�*?�|?�|�?�n�?�a?�S5?�E<?�71?�)?��?��?��G?���?��W?�ҽ?��?��B?��a?�f?�Q?�y"?�i�?�Zq?�J�?�;O?�+�?��?��?���?��p?��?�ʡ?�	?�O?�u?�x?�vZ?�e?�S�?�B.?�0�?��?��?���?��{?�� ?�à?��?�7?�M?�x??�e?�Q�?�>C?�*�?��?�?��?���?�Ʋ?�S?��?�8?�t}?�_�?�J�?�5�?� ?�@?���?��{?���?�d?韽?�?�t@?�^n?�H�?�2�?��?��?���?���?���?�	?�&?�M?�m�?�W�?�B%?�,�?�'?��?��?�ם?���?�?�L?�?�e�?�H�?�)u?��?��?�
?敺?�k4?�>~?��?�ޤ?嫑?�vr?�?Q?�;?��<?�b?�O�?�Z?��M?㉦?�Dz?���?��?�l�?�"-?�֤?�?�<�?��{?���?�P?� -?߯�?�__?��?޾?�m�?�M?��a?�}�?�/G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>�+>�+>�+>�+>�R�>��>���>�o>�o>�o>��>�,>�E�>�cS>��J>��->��N>�ܹ>��>��>�`>��>��a>��>���>��d>�Ř>���>�!�>�V�>���>���>��>�FM>���>���>�9->���>��>��)>�]�>�*D>�6>�6h>���>��>���>��9>��>��F>��8>���>��F>�]9>Ᏺ>���>��?ت?ֵ?��??`?r�?sw?�P?0o?�/?�0?��?�?�O?�o?϶?�4?��?�A?��?�,?
}}?	x�?uf?q�?l�?ed?Y�?HV?0?�>��[>�e>>��H>�X�>��<>��1>�>!>�x.>�z>�	�>偩>�6�>�G�>��0>߅�>�v#>�W>���>�>��??	b!?�Z?�c?&ff?5�?N��?o��?�U�?�e?���?�?���?�Ѐ?๱?�?��5?��@�@6�@>�@*8@��@
�P@"�@��@�B@�l@�/@�@H
@�N@S^@��@��@3n@Z@t;@�>@�>@�;@�@s�@_�@GA@*q@
@�@��@�X@n]@B�@m@�@�@��@^=@/�@U@�9@��@xG@K�@�@�O@��@�@w@O@'�@�@�7@��@�9@q�@O�@/"@G@�V@�P@�4@�@}�@c_@I�@1r@�@R@��@�%@Ś@�#@��@��@�b@t3@f�@Z�@O'@D}@:�@1q@(�@!.@ @j@c@�@�@�]@�H@��@�Y@�r@��@�@�@�@�@�@�@�@�@�G@�%@�+@�U@�@�@�@�@��@�@�S@�+@�@��@��@��@��@��@�@�~@�Z@�+@��@�@�O@��@�g@��@�(@�c@��@��@�l@�0@��@�N@�@��@��@�@�S@��@�@�@��@�@��@�@��@ٍ@��@��@ͪ@�@�2@��@�`@�l@�@�^@�<@��@��@�5@~D@t�@j�@`d@UY@I�@=�@27@&�@U@@@�@�>@�@��@�y@�@��@��@��@��@��@��@~�@u,@kz@a�@X9@N�@E@;�@2@(�@"@�@,@�@
�+@
�@
�@
�}@
��@
�.@
�t@
��@
��@
��@
��@
��@
��@
yy@
o"@
d�@
Z&@
O}@
D�@
9�@
.�@
#�@
H@
�@
4@	�m@	�}@	�`@	�@	Ğ@	��@	�@	�@	��@	�U@	u�@	g�@	Y�@	K<@	<�@	-�@	�@	M@��@��@ߞ@�,@�p@�j@�@�x@x�@fK@S�@@�@-�@@&@��@�K@�T@��@�K@�7@p�@Y�@B�@+@�@��@��@�I@��@��@q!@S�@5�@�@�[@�S@��@�|@s�@Qe@.�@2@�Y@�@�B@y@Sl@-e@�@�5@�@��@i�@A�@}@��@�@�	@u�@L\@"�@�@�#@�&@{@P�@&�@ �o@ �'@ ��@ }�@ S]@ )-?��?��
?�V.?��?��:?�\5?�	�?��B?�eg?�?��?�r�?�"�?���?��2?�7R?��(?���?�R?�L?��X?�tI?�,'?���?���?�Y�?��?�ұ?���?�PF?��?�ҹ?���?�ZT?� (?��a?��
?�z*?�E�?��?��?��?�?�W�?�-=?�l?��f?�5?��?�su?�S�?�5�?��?���?��<?�?�?�?�i6?�M8?�1�?�+?��?��e?���?��?�-?�x�?�_�?�F�?�.�?��?���?��?�И?��?��?���?�xd?�cE?�N�?�:,?�&3?��?��m?��?��=?��??ﶩ?�|??�`?�ts?�d�?�U�?�G8?�9?�+:?��?��?��?���?��?���?��L?��#?��q?�7?�w?�1?�f?�?�E?��?�?��?�|�?�x�?�t�?�qs?�n�?�l^?�j�?�i^?�h�?�h{?�h�?�i�?�k,?�m'?�o�?�r�?�vg?�z�?�Z???�?�??��??�
?��?�ΐ?�ٹ?��|?���?���?�k?��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999911111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111199999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���=���G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�B�B�B�B�B��B�CB�tB�B�B�B�B�B�_B�5B�B��B��B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�nB��B�B�|B�dB�eB�|B��B��B�5B��B�B�|B B�B5B�B�BOB
B�B�B�B�B�B�B�B�B�B�B #B"dB$�B'
B)pB+�B.eB0�B3�B6>B8�B;�B>�BA�BD�BG�BJ�BM�BQ0BT�BX�B\�BaCBe�Bj}Bo\BthBy�BB��B��B��B�!B��B��B�?B��B�!BīB͟B��B��B��B�yB	 PB	cB	�B	!�B	,�B	7�B	A�B	J�B	RGB	XB	^WB	f}B	n�B	vyB	};B	�OB	��B	�PB	��B	��B	��B	��B	�B	�B	��B	�pB	�B	��B	�-B	��B	��B	��B	��B	�B	��B	��B	�RB	�jB	B	˫B	ִB	�B	��B	��B	��B
�B
�B
aB
�B
$DB
*JB
/�B
4aB
8mB
;�B
>wB
@�B
B�B
D1B
E�B
F�B
H&B
ICB
JUB
KfB
L{B
M�B
N�B
O�B
QB
R-B
S=B
T1B
T�B
U�B
V�B
WeB
XLB
Y>B
Z9B
[:B
\BB
]OB
^_B
_rB
`�B
a�B
b�B
c�B
d�B
e�B
gB
hB
iB
j(B
k.B
l1B
m0B
n,B
o#B
pB
qB
q�B
r�B
s�B
t�B
usB
vJB
wB
w�B
x�B
y|B
z?B
z�B
{�B
|tB
}*B
}�B
~�B
;B
�B
��B
�5B
��B
�|B
�B
��B
�ZB
��B
��B
�.B
��B
�bB
��B
��B
�.B
��B
�aB
��B
��B
�1B
��B
�kB
�	B
��B
�JB
��B
��B
�8B
��B
��B
�6B
��B
��B
�HB
��B
��B
�lB
�(B
��B
��B
�gB
�+B
��B
��B
��B
�JB
�B
��B
��B
�xB
�CB
�B
��B
��B
�mB
�<B
�B
��B
��B
��B
�iB
�EB
�#B
�B
��B
��B
��B
��B
�zB
�bB
�LB
�6B
�!B
�B
��B
��B
��B
��B
��B
��B
��B
�vB
�bB
�NB
�9B
�"B
�B
��B
��B
ĽB
ŠB
ƁB
�`B
�=B
�B
��B
��B
˗B
�fB
�3B
��B
��B
τB
�BB
��B
ѲB
�dB
�B
ӻB
�_B
��B
՜B
�;B
��B
�}B
�B
��B
�aB
�B
ڠB
�>B
��B
�tB
�B
ݣB
�8B
��B
�\B
��B
�zB
�B
�B
�B
�B
�'B
�B
�1B
�B
�5B
�B
�4B
�B
�.B
�B
�"B
�B
�B
�B
��B
�ZB
��B
�&B
�B
��B
�>B
�B
��B
�OB
��B
�B
�[B
�B
�
B
�aB
�B
�B
�cB
�B
�B
�_B
�B
�B
�VB
�B
��B
�HB
�B
��B
�4B
�B
��B
�B
�gB
��B
��B
�GB
��B
��B
�#B
�kB
��B
��B
�?B
��B
��B
�B
�TB
��B
��B
�B
�`B
��B
��B
�%B
�fB
��B
��B
�%B
�dB
��B
��B
�B
�[B
��B
��B
�B
�MB
��B
��B
��B
�:B
�tB
��B
��B !B [B �B �BB=BuB�B�BBTB�B�B�B/BfB�B�B	B?BvB�B�BBMB�B�B�B%B[B�B�B�B3BiB�B�BBBBxB�B�B	B	QB	�B	�B	�B
+B
aB
�B
�BB:BqB�B�BBJB�B�B�B#BYB�B�B�B1BgB�B�B	B?BuB�B�BBKB�B�B�B BUB�B�B�B)B^B�B�B�B0BdB�B�B B4BhB�B�BB5BiB�B�BB4BfB�B�B�B/BaB�B�B�B&BWB�B�B�BBJBzB�B�B	B8BgB�B�B�B!BPB}B�B�BB3B`B�B�B�BB>BiB�B�B�BB@BjB�B�B�BB:BbB�B�B�B B *B RB yB �B �B �B!B!7B!]B!�B!�B!�B!�B"B"7B"ZB"}B"�B"�B"�B#B#(B#IB#jB#�B#�B#�B#�B$
B$)B$HB$gB$�B$�B$�B$�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�B�B�B�B�B�B�B�B��B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B�B��B��B��B��B��B�B�+B�HB�hB�B�B��B��B�B�GB�pB�B��B��B�#B�SB��B�B��B�B�SB�B��B��B�8B�uB�B��B�7B�{B��B�
B�TB��B��B�BB��B��B�HB��B�B�iB��B�=B��B�9B��B�ZB��B��B�JB�B��B��B�bB FB6B7BHBkB�B�BVB	�BpB)BB�BBTB�BAB�B�B"�B%�B(�B-'B3DB;GBEBP�B]�BkpBy�B��B��B��B�1B	�B	�B	,�B	;�B	I�B	W9B	c�B	oFB	y�B	��B	��B	�#B	��B	�sB	��B	�B	�>B	�6B	�B	¨B	�%B	�{B	ϫB	ӷB	נB	�hB	�B	�B	�B	�VB	�B	�B	�B	��B	�~B	�GB	��B
 �B
AB
�B
NB

�B
2B
�B
�B
OB
�B
�B
HB
�B
�B
";B
$�B
&�B
)FB
+�B
.B
0rB
2�B
5?B
7�B
:B
<jB
>�B
A#B
CzB
E�B
HB
JaB
L�B
N�B
QB
SGB
UqB
W�B
Y�B
[�B
]�B
_�B
a�B
c�B
e�B
g�B
iB
kUB
m!B
n�B
p�B
rNB
s�B
u�B
w B
x�B
zB
{�B
|�B
~=B
�B
��B
��B
��B
��B
��B
��B
�xB
�$B
��B
�1B
��B
��B
�]B
��B
�	B
�VB
��B
��B
�B
�QB
��B
��B
��B
��B
�B
�3B
�KB
�aB
�tB
��B
��B
��B
��B
��B
��B
��B
��B
�B
�!B
�:B
�UB
�tB
��B
��B
��B
�B
�>B
�pB
��B
��B
�B
�XB
��B
��B
�B
�bB
��B
�B
�yB
��B
�}B
�B
��B
�]B
�B
��B
��B
�fB
�<B
�B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
�B
�B
� B
�/B
�>B
�LB
�ZB
�hB
�uB
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
B
ÀB
�pB
�^B
�JB
�4B
�B
� B
��B
��B
ˢB
�}B
�WB
�-B
�B
��B
ТB
�nB
�7B
��B
��B
ԀB
�=B
��B
֭B
�`B
�B
ػB
�cB
�B
ڧB
�BB
��B
�lB
��B
݂B
�B
ބB
��B
�oB
��B
�BB
�B
�B
�gB
��B
�'B
�B
��B
�AB
�B
��B
�TB
�B
�B
�`B
�B
�B
�fB
�B
�B
�eB
�B
�B
�]B
�B
��B
�OB
�B
��B
�;B
�B
��B
�"B
�mB
�B
�B
�MB
�B
��B
�'B
�oB
��B
��B
�DB
�B
��B
�B
�YB
�B
��B
�$B
�gB
�B
��B
�/B
�pB
�B
��B
�4B
�uB
�B
��B
�5B
�uB
�B
��B
�2B
�qB
��B
��B
�,B
�jB
��B
��B
�#B
�`B
��B
��B
�B
�SB
��B
��B
�B
�CB
�B
��B
��B
�0B
�kB
��B
��B
�B
�SB
��B
��B
��B
�7B
�oB
��B
��B
�B
�LB
��B
��B
��B
�#B
�YB
��B
��B
��B
�/B
�eB
��B
��B
�B
�;B
�pB
��B
��B B CB wB �B �BBFByB�B�BBBBtB�B�BB7BgB�B�B�B#BQBB�B�BB4B`B�B�B�BB9BdB�B�B�BB4B]B�B�B�B�B%BLBtB�B�B�B	B	4B	ZB	�B	�B	�B	�B
B
;B
`B
�B
�B
�B
�BB=BaB�B�B�B�BB;B_B�B�B�B�BB:B^B�B�B�B�BB;B`B�B�B�B�BBCBiB�B�B�BB+BRBzB�B�B�BBCBlB�B�B�BB<BfB�B�B�BB>BiB�B�B�BBIBvB�B�B�B.B\B�B�B�BBGBvB�B�BB6BfB�B�B�B&BVB�B�B�BBDBsB�B�B�B-B[B�B�B�BB7BaB�B�B�BB'BLBoB�B�B�B�BB&B?BVBkB~B�B�B�B�B�B�B�B�B�B�B�BBBB$B.B9BBBKBSBZB`BdBgBhBhBeBaBZBPBEB6B%BB�B�B�B�B~BWB,B�B�B�BaB&B�B�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�B��B��B��B��B��B�B�B�B�B�B�B��B�B�]B�B��B�B�GB�{B�B�B��B��B��B��B�%B�cB��B��B� B�XB��B �B�BBDBuB�B�B	.B
B�BKB�BRB�B�B=B�B�BnB�BmB"qB%�B) B,FB/ZB2B4zB6^B7�B8�B9XB9�B:!B:wB:�B;B;NB;�B;�B;�B<,B<\B<�B<�B<�B=B=7B=aB=�B=�B=�B>B>AB>tB>�B>�B?#B?gB?�B@B@]B@�BA2BA�BB>BB�BC�BD�BF�BI}BMyBR�BX�B`lBh�Bq�B{B�#B�JB�jB�FB��B�KB�kB��BܟB�>B	uB	.&B	H�B	^�B	pB	{�B	��B	��B	��B	��B	��B	�:B	�[B	�B	��B	��B	�qB	�B	�\B	�|B	�dB	�B	ΙB	��B	�B	�%B	�+B	�!B	�B	��B	ޮB	�nB	�"B	��B	�iB	��B	�B	�
B	�B	��B	�`B	��B	�B	�tB	��B	�B	�PB	��B	��B	��B	�,B	�XB	��B	��B	��B
 �B
�B
B
+B
>B
PB
`B
nB
	{B

�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
B
(B
AB
]B
|B
�B
�B
�B
"B
SB
 �B
!�B
"�B
$3B
%pB
&�B
'�B
).B
*pB
+�B
,�B
.8B
/{B
0�B
2B
3DB
4�B
5�B
7
B
8KB
9�B
:�B
<	B
=FB
>�B
?�B
@�B
B1B
ChB
D�B
E�B
GB
H9B
IjB
J�B
K�B
L�B
NB
OFB
PmB
Q�B
R�B
S�B
T�B
VB
W8B
XTB
YnB
Z�B
[�B
\�B
]�B
^�B
_�B
`�B
bB
cB
dB
e&B
f,B
g2B
h5B
i7B
j7B
k6B
l3B
m.B
n'B
oB
pB
q	B
q�B
r�B
s�B
t�B
u�B
v�B
w�B
xhB
yJB
z+B
{
B
{�B
|�B
}�B
~mB
?B
�B
��B
��B
�oB
�3B
��B
��B
�nB
�%B
��B
��B
�?B
��B
��B
�LB
��B
��B
�MB
��B
��B
�BB
��B
��B
�,B
��B
�lB
�
B
��B
�DB
��B
�xB
�B
��B
�?B
��B
�iB
��B
��B
�!B
��B
�AB
��B
�^B
��B
�vB
�B
��B
�B
��B
�&B
��B
�3B
��B
�>B
��B
�FB
��B
�KB
��B
�MB
��B
�MB
��B
�KB
��B
�FB
��B
�@B
��B
�8B
��B
�.B
��B
�"B
��B
�B
��B
�B
�B
��B
�oB
��B
�^B
��B
�LB
��B
�9B
��B
�&B
��B
�B
��B
��B
�tB
��B
�`B
��B
�LB
��B
�8B
��B
�$B
��B
�B
��B
��B
�vB
��B
�dB
��B
�SB
��B
�BB
��B
�0B
��B
�B
��B
�B
��B
��B
�rB
��B
�_B
��B
�LB
��B
�9B
įB
�%B
śB
�B
ƇB
��B
�qB
��B
�\B
��B
�EB
ɺB
�.B
ʣB
�B
ˋB
��B
�rB
��B
�XB
��B
�=B
ΰB
�"B
ϔB
�B
�wB
��B
�YB
��B
�:B
ҪB
�B
ӊB
��B
�hB
��B
�EB
ճB
�!B
֎B
��B
�hB
��B
�@B
جB
�B
كB
��B
�XB
��B
�+B
۔B
��B
�fB
��B
�5B
ݜB
�B
�jB
��B
�5B
ߚB
��B
�cB
��B
�*B
�B
��B
�QB
�B
�B
�tB
��B
�4B
�B
��B
�OB
�B
�
B
�fB
��B
�B
�zB
��B
�2B
�B
��B
�EB
�B
��B
�WB
�B
�B
�iB
��B
�B
�yB
��B
�.B
�B
��B
�<B
�B
��B
�JB
�B
��B
�VB
�B
�B
�aB
�B
�B
�jB
��B
�B
�rB
��B
�!B
�xB
��B
�&B
�}B
��B
�*B
��B
��B
�+B
��B
��B
�+B
��B
��B
�)B
�}B
��B
�$B
�xB
��B
�B
�qB
��B
�B
�gB
��B
�
B
�\B
��B
��B
�NB
��B
��B
�=B
��B
��B *B xB �BBbB�B�BHB�B�B,BwB�BBWB�B�B4B}B�BBVB�B�B+G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999911111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111199999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999BBB�B�B7BoB�B�B�B�B�BbB/B�B�B�BhBFB,BB	B�B�B�B�B�B�B�B�B�BvBhB[BNBAB4B(BBBB�B�B�B�B�B�B�B�B�B�B�B�B2B�BXBB�B�B�B	B
AB�B�B6B�BB�B5B�BwB'B�B�BqB GB"'B$B&B'�B*B,B.6B0^B2�B4�B7B9wB;�B>QB@�BCdBFBH�BKpBN=BQBTBWBZB]/B`BdBg�BlBp^Bt�By}B~OB�NB�}B��B�vB�IB�^B��B�`B�[B��B�bB�wB��B��B�-B��B�B	�B	JB	PB	$yB	/�B	:�B	EDB	O>B	X<B	_�B	e�B	k�B	s�B	|3B	��B	�~B	��B	��B	�kB	��B	��B	��B	��B	��B	��B	��B	�#B	��B	�/B	��B	�RB	�B	��B	��B	�MB	��B	��B	�tB	�B	ΜB	צB	�B	�gB	��B
�B

FB
OB
IB
!�B
)!B
/�B
5�B
;B
?�B
C�B
GB
I�B
K�B
M�B
O3B
P�B
Q�B
SB
TB
UB
VB
W!B
X0B
YFB
ZbB
[~B
\�B
]�B
^|B
_;B
_�B
`�B
a{B
bUB
c:B
d(B
eB
fB
gB
hB
iB
j'B
k0B
l9B
mBB
nJB
oPB
pUB
qVB
rVB
sRB
tKB
uAB
v3B
w"B
xB
x�B
y�B
z�B
{�B
|aB
}3B
~ B
~�B
�B
�PB
�B
��B
�}B
�0B
��B
��B
�4B
��B
�}B
�B
��B
�WB
��B
��B
�B
��B
�CB
��B
�dB
��B
��B
�B
��B
�&B
��B
�?B
��B
�XB
��B
�qB
� B
��B
� B
��B
�DB
��B
�nB
�B
��B
�9B
��B
�uB
�B
��B
�`B
�B
��B
�\B
�B
��B
�nB
�#B
��B
��B
�LB
�B
��B
��B
�@B
��B
��B
�|B
�:B
��B
��B
�rB
�3B
��B
��B
��B
�RB
�B
��B
��B
��B
�eB
�<B
�B
��B
��B
��B
�B
�\B
�:B
�B
��B
��B
��B
��B
�yB
�YB
�9B
�B
��B
��B
ôB
ĐB
�lB
�GB
� B
��B
��B
ɡB
�rB
�BB
�B
��B
͢B
�hB
�*B
��B
ЦB
�^B
�B
��B
�qB
�B
ԿB
�`B
��B
֓B
�%B
׵B
�GB
��B
�oB
�B
ژB
�,B
ۿB
�QB
��B
�pB
��B
ވB
�B
ߚB
� B
�B
�'B
�B
�&B
�B
�B
�B
�B
�B
�B
�xB
��B
�_B
��B
�BB
�B
�B
�B
��B
�\B
��B
�"B
�B
��B
�3B
�B
��B
�$B
�rB
��B
�B
�YB
��B
��B
�=B
�B
��B
�B
�dB
�B
��B
�:B
��B
��B
�B
�PB
�B
��B
�B
�\B
�B
��B
� B
�`B
�B
��B
�B
�ZB
��B
��B
�B
�KB
��B
��B
��B
�3B
�lB
��B
��B
�B
�JB
��B
��B
��B
� B
�UB
��B
��B
��B
�!B
�TB
��B
��B
��B
�B
�IB
�xB
��B
��B
�B
�5B
�cB
��B
��B
��B
�B
�EB
�qB
��B
��B
��B
�!B
�LB
�wB
��B
��B
��B
�!B
�KB
�uB
��B
��B
��B
�B
�DB
�mB
��B
��B
��B B ;B cB �B �B �BB/BXB�B�B�B�B%BMBwB�B�B�BBEBnB�B�B�BB<BeB�B�B�BB3B\B�B�B�BB+BTB}B�B�B�B BIBrB�B�B�BB=BfB�B�B�B	B	0B	XB	�B	�B	�B	�B
B
GB
nB
�B
�B
�BB2BYB�B�B�B�BBABgB�B�B�B�B$BIBoB�B�B�BB&BKBoB�B�B�B�B"BDBhB�B�B�B�BB7BYBzB�B�B�B�BB@B`B�B�B�B�B�BB<BZByB�B�B�B�BB)BFBbBB�B�B�B�BB"B<BWBqB�B�B�B�B�BBB6BMBdB{B�B�B�B�B�B�BB'B;BOBbBuB�B�B�B�B�B�B�BBB$G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�BB�B�B�BDB�B9B�B�B�B|BoBaBTBGB:B-B BBB �B �B �B �B �B �B �B �B �B |B nB `B RB EB 8B +B B B B��B��B��B��B��B��B��B��B��B��B�}B�sB�nB�lB�nB�sB�{B��B��B��B��B��B��B��B B B 8B TB pB �B �B �B �BB5BZB�B�B�B�B%BQB�B�B�BBKB�B�B�B3BsB�B�BBB�B�B(B{B�B+B�B�BnB�B	uB
B
�B=B�B�BXB!B�B�B�B�B�BBTB�BB�BXB#BB!B#NB%�B(!B*�B-�B0nB3tB6�B:�B@�BH�BR�B]�Bj�Bx�B�B�$B��B��B�2B	�B	)�B	9gB	HoB	V�B	c�B	pVB	{�B	��B	�VB	�SB	��B	��B	��B	��B	�KB	�`B	�KB	�B	ΣB	�B	�\B	�B	�~B	�ZB	�B	�B	�+B	�B	��B	��B	�B	�B
 �B
�B
pB
	B
�B
CB
�B
6B
�B
 B
XB
�B
�B
!=B
#�B
%�B
(
B
*NB
,�B
.�B
1&B
3vB
5�B
8"B
:{B
<�B
?.B
A�B
C�B
F1B
H�B
J�B
MB
O_B
Q�B
S�B
VB
X?B
ZiB
\�B
^�B
`�B
b�B
d�B
f�B
h�B
j�B
l�B
n�B
pbB
r3B
s�B
u�B
wqB
yB
z�B
|ZB
}�B
kB
��B
�PB
��B
�B
�GB
�~B
��B
��B
��B
��B
��B
�bB
�B
��B
�?B
��B
�B
�]B
��B
��B
�AB
��B
��B
��B
�B
�HB
�kB
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
� B
�B
�B
�	B
�B
�B
�B
�*B
�8B
�JB
�^B
�vB
��B
��B
��B
��B
� B
�LB
�zB
��B
��B
�B
�JB
��B
��B
�B
�pB
��B
�ZB
��B
�uB
�B
��B
�lB
�&B
��B
��B
��B
�VB
�2B
�B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
��B
�|B
�qB
�eB
�VB
�FB
�5B
�!B
�B
��B
��B
��B
ƤB
ǅB
�cB
�@B
�B
��B
��B
̜B
�mB
�;B
�B
��B
ЗB
�\B
�B
��B
әB
�RB
�B
ջB
�jB
�B
��B
�fB
�	B
٧B
�BB
��B
�lB
��B
܃B
�	B
݊B
�B
�|B
��B
�YB
߾B
�B
�vB
��B
� B
�tB
��B
�B
�lB
�B
�B
�\B
�B
��B
�EB
�B
��B
�(B
�sB
�B
�B
�LB
�B
��B
�B
�dB
�B
��B
�/B
�rB
�B
��B
�4B
�tB
�B
��B
�0B
�mB
�B
��B
�!B
�\B
�B
��B
�B
�EB
�}B
�B
��B
�%B
�\B
�B
��B
��B
�5B
�jB
�B
��B
�B
�<B
�pB
�B
��B
�
B
�=B
�pB
�B
��B
�B
�7B
�hB
�B
��B
��B
�-B
�]B
�B
�B
��B
�B
�MB
�|B
�B
��B
�	B
�8B
�fB
��B
��B
��B
�B
�KB
�yB
��B
��B
��B
�*B
�VB
��B
��B
��B
�B
�,B
�UB
�~B
��B
��B
��B
� B
�HB
�qB
��B
��B
��B
�B
�;B
�cB
��B
��B
��B
�B
�+B
�SB
�yB
��B
��B
��B
�B
�:B
�`B
��B
��B
��B
��B
�B
�;B
�^B
��B
��B
��B
��B
�B
�,B
�MB
�nB
��B
��B
��B
��B
�B
�-B
�KB
�iB
��B
��B
��B
��B
��B
�B
�6B
�QB
�mB
��B
��B
��B
��B
��B B )B CB [B uB �B �B �B �B �B
B#B:BRBjB�B�B�B�B�B�BB&B>BUBlB�B�B�B�B�B�BB&B>BUBmB�B�B�B�B�B�BB,BEB^BwB�B�B�B�B�BB)BCB^BxB�B�B�B�BBB9BVBsB�B�B�B�BB$BCBaB�B�B�B�B�BB?B`B�B�B�B�B	B	(B	KB	mB	�B	�B	�B	�B
B
=B
`B
�B
�B
�B
�BB2BTBvB�B�B�B�BB@BaB�B�B�B�B�BB5BPBkB�B�B�B�B�B�BBB&B3B?BHBPBVBZB[BZBVBQBMBJBFBCBAB?B=B<B:B8B5B2B.B*B%BBBBB�B�B�B�B�B�B�BkBMB,BB�B�B�BWB#B�B�BrB1B
�B
�B
WB
	G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�B7B*BBB	�B�B�B�B�B�B�B�B�B BRB�B�B�B�B%B~B$BB	B
 BKB|B�B�BB=BcB�B�B�B�BB4BdB�B�B2B�B!B"B$B%�B'CB(�B*B,LB.�B11B4(B7WB:�B=�B@�BC�BE�BG�BIBJBJ�BJ�BK;BK�BK�BK�BL3BLcBL�BL�BL�BM BM!BMABM_BM|BM�BM�BM�BM�BNBN2BNUBN{BN�BN�BOBO9BOvBO�BPBP`BP�BQ3BQ�BRHBR�BT BU�BX�B\�Ba�Bh	BolBw�B��B��B��B�	B�B��B�SB��B��B�1B�B	�B	�B	<bB	V�B	mB	~0B	��B	��B	��B	��B	�pB	�pB	��B	�B	��B	�B	�!B	��B	�oB	йB	��B	֧B	�OB	��B	� B	�B	�&B	�B	�B	��B	�B	�nB	�!B	��B	�bB	��B	�{B	��B	�nB	��B	�@B	��B	��B	�AB	��B	��B
B
>B
oB
�B
�B
�B
B
	B

6B
JB
[B
iB
tB
|B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
�B
 �B
!�B
"�B
#�B
$�B
%�B
'B
(8B
)\B
*�B
+�B
,�B
.B
/7B
0hB
1�B
2�B
4B
58B
6nB
7�B
8�B
:B
;EB
<{B
=�B
>�B
@B
ANB
B�B
C�B
D�B
FB
GDB
HrB
I�B
J�B
K�B
MB
NFB
OmB
P�B
Q�B
R�B
S�B
UB
V4B
WPB
XjB
Y�B
Z�B
[�B
\�B
]�B
^�B
_�B
aB
bB
cB
d!B
e'B
f,B
g0B
h2B
i2B
j1B
k.B
l*B
m#B
nB
oB
pB
p�B
q�B
r�B
s�B
t�B
u�B
v�B
woB
xUB
y8B
zB
z�B
{�B
|�B
}�B
~fB
:B
�B
��B
��B
�|B
�GB
�B
��B
��B
�WB
�B
��B
��B
�;B
��B
��B
�DB
��B
��B
�6B
��B
�{B
�B
��B
�YB
��B
��B
�+B
��B
�[B
��B
��B
�B
��B
�=B
��B
�]B
��B
�vB
�B
��B
�B
��B
�&B
��B
�2B
��B
�9B
��B
�>B
��B
�>B
��B
�<B
��B
�5B
��B
�+B
��B
�B
��B
�B
��B
��B
�rB
��B
�[B
��B
�BB
��B
�'B
��B
�
B
�zB
��B
�YB
��B
�7B
��B
�B
��B
��B
�ZB
��B
�1B
��B
�B
�sB
��B
�IB
��B
�B
��B
��B
�YB
��B
�,B
��B
��B
�hB
��B
�9B
��B
�
B
�sB
��B
�EB
��B
�B
��B
��B
�SB
��B
�&B
��B
��B
�dB
��B
�9B
��B
�B
�wB
��B
�LB
��B
� B
��B
��B
�^B
��B
�0B
��B
�B
�mB
��B
�@B
éB
�B
�{B
��B
�LB
ŴB
�B
ƅB
��B
�UB
ǼB
�$B
ȋB
��B
�YB
��B
�&B
ʍB
��B
�YB
˿B
�$B
̉B
��B
�SB
͸B
�B
΀B
��B
�HB
ϫB
�B
�pB
��B
�5B
їB
��B
�ZB
һB
�B
�|B
��B
�;B
ԚB
��B
�XB
շB
�B
�rB
��B
�,B
׈B
��B
�@B
؜B
��B
�QB
٫B
�B
�_B
ڶB
�B
�gB
ۿB
�B
�mB
��B
�B
�nB
��B
�B
�kB
޾B
�B
�dB
߶B
�B
�XB
�B
��B
�GB
�B
��B
�4B
�B
��B
�!B
�oB
�B
�B
�ZB
�B
��B
�EB
�B
��B
�.B
�{B
��B
�B
�cB
�B
��B
�JB
�B
��B
�/B
�|B
��B
�B
�`B
�B
��B
�CB
�B
��B
�#B
�nB
�B
�B
�MB
�B
��B
�+B
�tB
�B
�B
�NB
�B
��B
�(B
�pB
�B
��B
�FB
�B
��B
�B
�aB
�B
��B
�3B
�xB
�B
�B
�FB
�B
��B
�B
�VB
��B
��B
�B
�aB
��B
��B
�'B
�hB
��B
��B
�+B
�kB
��B
��B
�(B
�gB
��B
��B
�"B
�`B
��B
��B
�B
�RB
��B
��B
�B
�@B
�zB
��B
��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999911111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111199999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111119999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��>L��G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�G�O�PRES            TEMP            PSAL            PRES            TEMP            PSAL            PRES            TEMP            PSAL            Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               Pc = P - ( p1 [dbar/km] * P  * 1e-3 + p2 [dbar] )                                                                                                                                                                                                               Tc = T - ( t1 [degC/km] * Pc * 1e-3 + t2 [degC] )                                                                                                                                                                                                               Sc = S - ( s1 [ psu/km] * Pc * 1e-3 + s2 [ psu] )                                                                                                                                                                                                               p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 5.000000e-02  psu/km, s2= -2.000000e-02  psu                                                                                                                                                                                                                p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 5.000000e-02  psu/km, s2= -2.000000e-02  psu                                                                                                                                                                                                                p1= 0.000000e+00 dbar/km, p2= 0.000000e+00 dbar                                                                                                                                                                                                                 t1= 0.000000e+00 degC/km, t2= 0.000000e+00 degC                                                                                                                                                                                                                 s1= 5.000000e-02  psu/km, s2= -2.000000e-02  psu                                                                                                                                                                                                                