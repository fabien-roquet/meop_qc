%% ct68

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct68 = [
    1	0.00	0.00	0.00	-0.28
    2	0.00	0.00	0.00	 0.02
    ];


temp_error=0.05;
psal_error=0.05;
minT=-3; maxT=10; minS=4; maxS=40; min_Nprof=30;
