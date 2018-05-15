%% ct89

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct89 = [
	1	0.00	0.00	0.00	-0.03
	2	0.00	0.00	0.00	-0.02
	3	0.00	0.00	0.00	0.06
	4	0.00	0.00	0.00	0.09
    ];


temp_error=0.05;
psal_error=0.05;