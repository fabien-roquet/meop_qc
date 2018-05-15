%% ct99

%% remove tags
Mqc=remove_profiles(info_deployment,'ct99-YY189-13','Pmax',1200);
Mqc=remove_profiles(info_deployment,'ct99-YY189-13','index',[194 196]);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct99 = [
	1	0.00	0.00	0.00	0.01
	2	0.00	0.00	0.00	0.10
	3	0.00	0.00	0.00	0.12
    ];

temp_error=0.05;
psal_error=0.05;