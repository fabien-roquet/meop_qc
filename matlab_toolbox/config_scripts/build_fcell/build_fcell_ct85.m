%% ct85

%% remove tags
Mqc=remove_profiles(info_deployment,'ct85-245-12','Tmax',4);
Mqc=remove_profiles(info_deployment,'ct85-246-12','Tmax',0);
Mqc=remove_profiles(info_deployment,'ct85-252-12','Pmax',800);
Mqc=remove_profiles(info_deployment,'ct85-44-13','Pmax',800);
Mqc=remove_Sprofiles(info_deployment,'ct85-246-12','Smin',32);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct85 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.10
	5	0.00	0.00	0.00	0.05
	6	0.00	0.00	0.00	0.00
    7	0.00	0.00	0.00	0.00
	8	0.00	0.05	0.00	-.05
	    ];


temp_error=0.05;
psal_error=0.1;