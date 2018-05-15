%% ct126

%% remove tags
Mqc=remove_tag(info_deployment,'ct126-197-15'); % bad locations

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct126 = [
	1	0.00	0.00	0.00	0.20
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
    ];

temp_error=0.1;
psal_error=0.1;