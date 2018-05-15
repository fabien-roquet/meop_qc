%% hg47

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'hg47-C1-15');
Mqc=remove_Sprofiles(info_deployment,'hg47-C2-15');
Mqc=remove_Sprofiles(info_deployment,'hg47-D2-15');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.hg47 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.2;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
