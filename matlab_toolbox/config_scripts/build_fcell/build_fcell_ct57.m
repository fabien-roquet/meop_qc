%% ct57

%% remove tags
Mqc=remove_tag(info_deployment,'ct57-W482-10');
Mqc=remove_profiles(info_deployment,'ct57-L478-10','Tmax',4);
Mqc=remove_profiles(info_deployment,'ct57-W481-10','Smin',33.5);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct57 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
