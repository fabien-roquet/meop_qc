%% ct115

%% remove tags
Mqc=remove_profiles(info_deployment,'ct115-892-14','Smin',35);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct115 = [
	1	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
