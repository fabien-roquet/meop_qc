%% ct32

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct32-Fp36-07','Pmax',600);
Mqc=remove_profiles(info_deployment,'ct32-M171-07','date_max',210);
Mqc=remove_profiles(info_deployment,'ct32-M171-07','Smax',35.7);
Mqc=remove_Sprofiles(info_deployment,'ct32-M171-07','Pmax',1200);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct32 = [
	1	0.00	0.00	0.00	0.02
	2	0.00	0.00	0.00	0.07
	3	0.00	0.00	0.00	0.15
    ];


temp_error=0.05;
psal_error=0.05;