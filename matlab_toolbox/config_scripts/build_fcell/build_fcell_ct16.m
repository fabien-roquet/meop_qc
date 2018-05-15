%% ct16

%% remove tags
Mqc = remove_Sprofiles(info_deployment,'ct16-174-06','Smin',34);
Mqc = remove_Sprofiles(info_deployment,'ct16-240-06');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct16 = [
	1	0.00	0.00	0.00	0.62
	2	0.00	0.00	0.00	-0.04
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.3
	5	0.00	0.00	0.00	0.00
    ];

temp_error=0.1;
psal_error=0.2;

minT=-3; maxT=8; minS=4; maxS=40; min_Nprof=30;
