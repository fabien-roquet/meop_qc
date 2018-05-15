%% ct27x

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct27x = [
	1	0.00	0.00	0.00	0.24
    ];


temp_error=0.05;
psal_error=0.05;