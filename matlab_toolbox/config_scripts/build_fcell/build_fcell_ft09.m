%% ft09

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ft09-048-11');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft09 = [
	1	0.00	0.00	0.00	0.20
    ];

temp_error=0.05;
psal_error=0.1;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;