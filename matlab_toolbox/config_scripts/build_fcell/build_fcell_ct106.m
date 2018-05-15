%% ct106

%% remove tags
Mqc=remove_profiles(info_deployment,'ct106-796-13','date_max',150);
Mqc=remove_profiles(info_deployment,'ct106-796-13','Smin',35.1);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct106 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
