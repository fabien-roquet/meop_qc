%% ct59

%% remove tags
Mqc=remove_profiles(info_deployment,'ct59-532-09','Tmax',10);
Mqc=remove_profiles(info_deployment,'ct59-667-09','Smax',34.5);
Mqc=remove_profiles(info_deployment,'ct59-738-09','Tmax',9);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct59 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
    ];


temp_error=0.05;
psal_error=0.1;

minT=-2.5; maxT=20; minS=25; maxS=40; min_Nprof=30;