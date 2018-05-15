%% ct10

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct10-23104-05');

%% apply corrections
sc_init_corrections;

calib_coeff.ct10 = [
	1	0.00	0.00	0.00	-.80
	2	0.00	0.00	0.00	0.31
	3	0.00	0.00	0.00	0.50
	4	0.00	0.00	0.00	0.33
	5	0.00	0.00	0.00	0.30
	6	0.00	0.00	0.00	0.35
	7	0.00	0.00	0.00	0.30
    ];


temp_error=0.10;
psal_error=0.20;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;
