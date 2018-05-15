%% AntP07
% 
% EXP='AntP07';
% PI='Dan Costa';
% disp(EXP)


%% remove tags

Mqc=remove_Sprofiles(info_deployment,'ct25-559-07','P-S+',[20 34.5]);
Mqc=remove_Sprofiles(info_deployment,'ct25-560-07','P-S+',[20 34.5]);
Mqc=remove_Sprofiles(info_deployment,'ct25-563-07','date_min',10);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

%salinity_offset.ct25        = zeros (length(list_tag),1);
%salinity_offset.ct2503= [ 1 0 ; 0 -.15 ];

calib_coeff.ct25 = [
    1	   0	   0	   0	0.58
    2	   0	   0	   0	  -0
    3	   0	   0	   0	0.11
    4	   0	   0	   0	  -0
    5	   0	   0	-.05	-.10
    6	   0	   0	   0	  -0
    7	   0	   0	   0	0.05
    8	   0	   0	   0	0.05
    9	   0	   0	   0	-0.02
    10	   0	   0	   0	-0.2
    11	   0	   0	   0	0.01
    12	   0	   0	   0	0.00
    13	   0	   0	   0	  -0
    ];


temp_error=0.05;
psal_error=0.05;
minT=-3; maxT=15; minS=4; maxS=40; min_Nprof=30;

