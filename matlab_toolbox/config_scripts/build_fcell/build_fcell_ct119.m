%% ct119

%% remove tags
Mqc=remove_profiles(info_deployment,'ct119-279-14','Tmax',2);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct119 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.03	0.00	0.05
	3	0.00	0.00	0.00	0.05
	4	0.00	0.00	0.00	0.05
	];

temp_error=0.05;
psal_error=0.1;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
