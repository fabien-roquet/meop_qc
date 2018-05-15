%% ct21

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct21-36-07');
Mqc=remove_Sprofiles(info_deployment,'ct21-37-07','Smax',34.7);
Mqc=remove_Sprofiles(info_deployment,'ct21-41-07','date_min',45);
Mqc=remove_Sprofiles(info_deployment,'ct21-41-07','T+S+',[4 34.7]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct21 = [
	1	0.00	0.00	0.00	0.15
	2	0.00	0.00	0.00	0.02
	3	0.00	0.00	0.00	-.02
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.15
    6	0.00	0.00	0.00	0.08
    ];


temp_error=0.05;
psal_error=0.05;
minT=-3; maxT=15; minS=4; maxS=40; min_Nprof=30;
