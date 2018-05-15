%% ct53

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct53 = [
	1	0.00	0.00	0.00	0.02
    ];


temp_error=0.05;
psal_error=0.1;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;