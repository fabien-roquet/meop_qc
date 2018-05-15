%% ct15

%% remove tags
Mqc=remove_tag(info_deployment,'ct15-171-05');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct15 = [
	1	0.00	0.00	0.00	0.02
	2	0.00	0.00	0.00	0.00
    ];

temp_error=0.05;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;



