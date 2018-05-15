%% ct28

%% remove tags
Mqc=remove_tag(info_deployment,'ct28-574-07');
Mqc=remove_tag(info_deployment,'ct28-575-07');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct28 = [
	1	0.00	0.00	0.00	0.08
	2	0.00	0.00	0.00	0.09
	3	0.00	0.00	0.00	0.10
	4	0.00	0.00	0.00	0.09
	5	0.00	0.00	0.00	0.10
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.05
    8	0.00	0.00	0.00	0.08
    ];


temp_error=0.1;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;

