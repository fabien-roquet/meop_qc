%% ct35x

% EXP='ct35x';
% PI='BORNEMANN-BESTER';
% disp(EXP)


%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct35x-WW005-08');
Mqc=remove_Sprofiles(info_deployment,'ct35x-GG380-08');


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

salinity_offset.ct35x        = zeros (length(list_tag),1);
salinity_offset.ct35x04= [1 35 135 0; 0 -.25 -.25 0];

calib_coeff.ct35x = [
	1	   0	   0	   0	  -0
	2	   0	   0	   0	 0.1
	3      0	   0	   0	 -.05
    4      0	   0	   0	 0.2
    ];


temp_error=0.05;
psal_error=0.05;

minT=-3; maxT=32; minS=4; maxS=40; min_Nprof=30;



