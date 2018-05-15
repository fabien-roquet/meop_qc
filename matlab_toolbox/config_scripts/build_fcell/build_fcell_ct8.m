%% ct8

% EXP='ct8';
% PI='Mark Hindell';% disp(EXP)


%% remove tags

Mqc=remove_tag(info_deployment,'ct8-Jason-05');
Mqc=remove_Sprofiles(info_deployment,'ct8-Rosita-05');
Mqc=remove_Sprofiles(info_deployment,'ct8-Soern-05');
Mqc=remove_profiles(info_deployment,'ct8-26626-05','date_max',70);
Mqc=remove_Sprofiles(info_deployment,'ct8-26626-05','date_max',50);
Mqc=remove_profiles(info_deployment,'ct8-2849-05','date_max',150);
Mqc=remove_profiles(info_deployment,'ct8-Aspasia-05','index',153);
Mqc=remove_profiles(info_deployment,'ct8-Busen-05','date_max',70);
Mqc=remove_profiles(info_deployment,'ct8-Undine-05','Pmax',1100);
Mqc=remove_Sprofiles(info_deployment,'ct8-Rudolph-05','date_max',70);

%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

salinity_offset.ct8        = zeros (length(list_tag),1);
salinity_offset.ct803= [ 1 175 176 0 ; 0 0 -.15 -.15 ];
salinity_offset.ct813= [ 1 220 221 0 ; 0 0 .2 .2 ];

calib_coeff.ct8 = [
	1	   0	   0	0.15	0.50
    2	   0	   0	   0	0.20
	3	   0	   0	 .10	1.30
    4	   0	   0	0.10	0.25
    5	   0	   0	0.25	0.45
    6	   0	   0	0.05	0.35
    7	   0	   0	-.05	0.25
    8	   0	   0	   0	0.40
    9	   0	   0	   0	  -0
    10	   0	   0	   0	 NaN
	11	   0	   0	0.05	0.25
    12	   0	   0	   0	 NaN
	13	   0	   0	0.10	0.20
    ];

temp_error=0.2;
psal_error=0.2;
minT=-3; maxT=12; minS=25; maxS=40; min_Nprof=30;



