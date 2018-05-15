%% ct29AP

%% remove tags

list_tag = dir([info_deployment.dir,'*_prof.nc']);
%Mqc=remove_profiles(info_deployment,'ct29-W627-07','P-T-',[20 0]);
Mqc=remove_profiles(info_deployment,'ct29-599-07','P-S+',[50 34.5]);
Mqc=remove_profiles(info_deployment,'ct29-W634-07','T-S+',[-1 34.3]);
Mqc=remove_profiles(info_deployment,'ct29-630-07','P-T+',[20 .5]);
Mqc=remove_profiles(info_deployment,'ct29-632-07','index',276);

%% apply corrections
sc_init_corrections;

calib_coeff.ct29 = [
    1	   0	   0	   0	   0
    2	   0	   0	   0	   .05
    3	   0	   0	   0	   0
    4	   0	   0	   0	   .03
    5	   0	   0	   0	   0
    6	   0	   0	   0	   0
    7	   0	   -.1	   .1	   .18
    8	   0	   0	   0	   0
    9	   0	   0	   .05	   0
    10	   0	   .03	   0	 .05
    11	   0	   0	   0	   0
    ];


temp_error=0.05;
psal_error=0.05;
minT=-3; maxT=32; minS=4; maxS=40; min_Nprof=30;


