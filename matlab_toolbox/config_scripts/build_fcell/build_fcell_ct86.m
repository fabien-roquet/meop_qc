%% ct86

%% remove tags
Mqc=remove_tag(info_deployment,'ct86-189-12');
Mqc=remove_Sprofiles(info_deployment,'ct86-364_2-11','Smin',35);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct86 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
