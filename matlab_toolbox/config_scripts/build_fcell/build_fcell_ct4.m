%% ct4

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct4-9908-04','date_max',56);
Mqc=remove_Sprofiles(info_deployment,'ct4-9915-04','Smax',34.6);
Mqc=remove_Sprofiles(info_deployment,'ct4-9921-04');


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct4 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	-0.01
	3	0.00	0.00	0.20	0.2
	4	0.00	0.00	-.20	-0.29
	
    ];


temp_error=0.05;
psal_error=0.2;