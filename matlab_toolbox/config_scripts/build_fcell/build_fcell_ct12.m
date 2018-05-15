%% ct12

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct12-102-05');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct12 = [
	1	0.00	0.00	0.00	-0.01
	2	0.00	0.00	0.00	-0.68
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.32
	5	0.00	0.00	0.00	0.12
    ];


temp_error=0.1;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;
