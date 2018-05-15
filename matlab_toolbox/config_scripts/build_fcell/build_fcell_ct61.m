%% ct61

%% remove tags
Mqc=remove_tag(info_deployment,'ct61-01-09');
Mqc=remove_Sprofiles(info_deployment,'ct61-02-09','Smin',35.5);
Mqc=remove_profiles(info_deployment,'ct61-04-09','P+T+',[100 16]);
Mqc=remove_profiles(info_deployment,'ct61-04-09','T-S+',[13 35.6]);
Mqc=remove_profiles(info_deployment,'ct61-08-09','Pmax',100);
Mqc=remove_Sprofiles(info_deployment,'ct61-08-09');
Mqc=remove_profiles(info_deployment,'ct61-09-09','Pmax',140);
Mqc=remove_profiles(info_deployment,'ct61-10-09','Tmax',21);
Mqc=remove_Sprofiles(info_deployment,'ct61-10-09','Smin',35);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct61 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	10	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.2;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
