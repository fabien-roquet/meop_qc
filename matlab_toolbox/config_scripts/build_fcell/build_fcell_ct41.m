%% ct41

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct41 = [
	1	0.00	0.00	0.00	0.02
	2	0.00	0.00	0.00	0.05
	3	0.00	0.00	0.00	0.03
	4	0.00	0.00	0.00	0.05
	5	0.00	0.00	0.00	0.05
    ];


temp_error=0.05;
psal_error=0.1;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;