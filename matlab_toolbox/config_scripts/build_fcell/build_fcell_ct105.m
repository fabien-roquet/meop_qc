%% ct105

%% remove tags
Mqc=remove_tag(info_deployment,'ct105-12-13');
Mqc=remove_profiles(info_deployment,'ct105-15f-13','index',338);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct105 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.06
	3	0.00	0.00	0.00	0.06
    ];


temp_error=0.05;
psal_error=0.05;