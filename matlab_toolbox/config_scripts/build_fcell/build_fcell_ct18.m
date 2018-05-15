%% ct18

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct18-L-06','Smax',35.2);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct18 = [
	1	0.00	0.00	0.00	0.00
    ];


temp_error=0.05;
psal_error=0.05;