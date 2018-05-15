%% ct110

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct110 = [
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
