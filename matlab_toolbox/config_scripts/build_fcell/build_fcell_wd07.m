%% wd07

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd07 = [
	1	0.00	0.00	0.00	0.00
	];

temp_error=0.03;
psal_error=0.1;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
