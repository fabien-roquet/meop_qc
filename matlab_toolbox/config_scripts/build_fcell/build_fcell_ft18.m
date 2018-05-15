%% ft18

%% remove tags
Mqc=remove_profiles(info_deployment,'ft18-F2-12','date_min',120);
Mqc=remove_Sprofiles(info_deployment,'ft18-F2-12');
Mqc=remove_profiles(info_deployment,'ft18-F4-12','date_min',120);
Mqc=remove_Sprofiles(info_deployment,'ft18-F4-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft18 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.10
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	-.10
	5	0.00	0.00	0.00	-.06
];

temp_error=0.05;
psal_error=0.05;