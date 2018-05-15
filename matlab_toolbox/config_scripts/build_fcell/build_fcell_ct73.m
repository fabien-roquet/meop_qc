%% ct73

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct73 = [
	1	0.00	0.00	0.00	-0.02
	2	0.00	0.00	0.00	0.13
	3	0.00	0.00	0.00	0.07
	4	0.00	0.00	0.00	-0.11
	5	0.00	0.00	0.00	-0.05
	6	0.00	0.00	0.00	0.12
	    ];


temp_error=0.05;
psal_error=0.05;