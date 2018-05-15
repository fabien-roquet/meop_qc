%% ct128a

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct128a = [
    1	0.10	-.15	0.00	0.05
	];

temp_error=0.1;
psal_error=0.2;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
