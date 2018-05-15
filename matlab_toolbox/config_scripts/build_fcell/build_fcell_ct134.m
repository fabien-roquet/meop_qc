%% ct134

%% remove tags
Mqc=remove_tag(info_deployment,'ct134-295-14');
Mqc=remove_Sprofiles(info_deployment,'ct134-301-14');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct134 = [
    1	0.00	0.00	0.00	0.03
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.10
	4	0.00	0.00	0.00	0.20
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.03
	8	0.00	0.00	0.00	0.05
	];

temp_error=0.05;
psal_error=0.05;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
