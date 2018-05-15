%% ct87

%% remove tags
Mqc=remove_tag(info_deployment,'ct90-064-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct90 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.00	0.00	0.03
	    ];


temp_error=0.05;
psal_error=0.05;