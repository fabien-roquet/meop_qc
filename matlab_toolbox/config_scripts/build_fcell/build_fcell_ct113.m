%% ct113

%% remove tags
Mqc=remove_profiles(info_deployment,'ct113-12787-13','date_max',40);
Mqc=remove_Sprofiles(info_deployment,'ct113-12787-13','Smin',34);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct113 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	];

temp_error=0.03;
psal_error=0.1;
