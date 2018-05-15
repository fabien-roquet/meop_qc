%% ct117

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct117 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.00	0.00	0.05
	    ];

temp_error=0.05;
psal_error=0.05;