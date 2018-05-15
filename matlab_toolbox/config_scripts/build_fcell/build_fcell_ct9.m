%% AntP05
% EXP='AntP05';
% PI='Dan Costa';
%name_prof = [datadir EXP '_prof.nc'];

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct9-26342-05');
Mqc=remove_Sprofiles(info_deployment,'ct9-28590-05','P-T+',[20 1.9]);
Mqc=remove_Sprofiles(info_deployment,'ct9-28595-05');

%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

%salinity_offset.ct9        = zeros (length(list_tag),1);
%salinity_offset.ct902=[ 1 100 0 ; 0 -.16 -.2 ];

calib_coeff.ct9 = [
    1	   0	   0	   0	 NaN
    2	   0	   0	   0	0.15
    3	   0	   0	   0	 NaN
    4	   0	   0	   0	0.5
    5	   0	   0	   0	 NaN
    6	   0	  .1	   0	 0.3
    ];

temp_error=0.2;
psal_error=0.2;
minT=-3; maxT=32; minS=25; maxS=40; min_Nprof=30;





