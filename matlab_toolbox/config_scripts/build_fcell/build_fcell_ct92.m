%% ct92

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct92 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
