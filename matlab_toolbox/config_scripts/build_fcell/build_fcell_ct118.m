%% ct118

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct118-301-11');
Mqc=remove_Sprofiles(info_deployment,'ct118-301-11','Smax',35);
Mqc=remove_Sprofiles(info_deployment,'ct118-894-13','Smax',34.6);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct118 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	-.10
	3	0.00	0.00	0.00	0.00
	4	0.00	-.20	0.00	0.10
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
