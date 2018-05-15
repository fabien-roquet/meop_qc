%% ct52

%% remove tags
Mqc=remove_profiles(info_deployment,'ct52-F47-09','Pmax',400);
Mqc=remove_profiles(info_deployment,'ct52-F60-09','Pmax',400);
Mqc=remove_profiles(info_deployment,'ct52-M51-09','Tmax',8);
Mqc=remove_profiles(info_deployment,'ct52-M56-09','Pmax',400);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct52 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	-.50
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	10	0.00	0.00	0.00	0.10
	11	0.00	0.00	0.00	0.00
	12	0.00	0.00	0.00	0.05
	13	0.00	0.00	0.00	0.15
	14	0.00	0.00	0.00	0.10
	15	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.1;
