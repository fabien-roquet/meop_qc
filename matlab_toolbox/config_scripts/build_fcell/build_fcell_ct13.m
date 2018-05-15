%% ct13

%% remove tags
Mqc=remove_tag(info_deployment,'ct13-057-05');
Mqc=remove_tag(info_deployment,'ct13-099-05');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct13 = [
	1	0.00	0.00	0.00	0.16
	2	0.00	0.00	0.00	0.01
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	-0.14
    ];


temp_error=0.1;
psal_error=0.2;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;
