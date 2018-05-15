%% ct17

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct17-m098-06');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct17 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	-0.36
	3	0.00	0.00	0.00	-0.11
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.21
    ];


temp_error=0.1;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;
