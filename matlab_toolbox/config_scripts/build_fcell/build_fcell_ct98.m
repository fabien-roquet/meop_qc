%% ct98

%% remove tags
Mqc=remove_profiles(info_deployment,'ct98-33-13','P-S+',[100 34.5]);
Mqc=remove_profiles(info_deployment,'ct98-34-13','Tmax',8);
Mqc=remove_Sprofiles(info_deployment,'ct98-34-13','Smin',33);
Mqc=remove_Sprofiles(info_deployment,'ct98-42-13','P-S+',[50 34.5]);
Mqc=remove_Sprofiles(info_deployment,'ct98-45-13','date_max',120);
Mqc=remove_profiles(info_deployment,'ct98-45-13','P+T+',[400 2.4]);
Mqc=remove_Sprofiles(info_deployment,'ct98-47-13','date_max',220);
Mqc=remove_Sprofiles(info_deployment,'ct98-49-13','Smin',32,'_fr0');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct98 =[
    1	   0	   0	   0	0.02
    2	   0	   0	 .10	0.00
    3	   0	   0	0.05	0.03
    4	   0	   0	   0	0.02
    5	   0	   0	0.06	-.02
    6	   0	   0	   0	-0.01
    7	   0	   0	 .05	0.02
    8	   0	   0	   0	0.04
    9	   0	   0	   0	0.09
    10	   0	   0	 .03	0.10
    11	   0	   0	-.05	0.10
    12	   0	   0	   0	0.03
    13	   0	   0	-.03	0.50
    14	   0	   0	   0	0.06
    15	   0	   0	 .05	0.02
    16	   0	   0	-.05	0.05
    17	   0	   0	 .02	0.02
];

temp_error=0.05;
psal_error=0.05;