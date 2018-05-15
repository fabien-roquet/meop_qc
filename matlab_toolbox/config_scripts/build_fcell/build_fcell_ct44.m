%% ct44

%% remove tags
Mqc=remove_profiles(info_deployment,'ct44-1-08','index',2);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct44 = [
	1	0.00	-.10	0.00	-.20
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	    ];


temp_error=0.1;
psal_error=0.2;