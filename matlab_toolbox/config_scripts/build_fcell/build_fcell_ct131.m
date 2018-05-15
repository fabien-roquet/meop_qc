%% ct131

%% remove tags
Mqc=remove_tag(info_deployment,'ct131-035BAT2-15');
Mqc=remove_Sprofiles(info_deployment,'ct131-048BAT2-15','Smin',33);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct131 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.10
	];

temp_error=0.05;
psal_error=0.05;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
