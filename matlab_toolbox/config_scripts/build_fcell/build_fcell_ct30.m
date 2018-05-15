%% ct30

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct30-Y-07','date_max',105);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct30 = [
	1	0.00	0.00	0.00	0.08
	2	0.00	0.00	0.00	-0.28
	3	0.00	0.00	0.00	0.05
	4	0.00	0.00	0.00	-0.1
    ];



temp_error=0.1;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;
