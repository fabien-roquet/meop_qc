%% bv3

%% remove tags
Mqc=remove_profiles(info_deployment,'bv3-10-14','P+T-',[400 -.5]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.bv3 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.03	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	];
salinity_offset.bv301 = [1 0; -.1 .05];

temp_error=0.1;
psal_error=0.1;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
