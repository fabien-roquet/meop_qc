%% ct108

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct108-564-13','date_max',80);
Mqc=remove_Sprofiles(info_deployment,'ct108-569-13');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct108 = [
	1	0.00	0.00	0.00	-0.09
	2	0.00	0.00	0.00	0.07
	3	0.00	0.00	0.00	0.30
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.08
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
    9	0.00	0.00	0.00	0.14
    ];


temp_error=0.05;
psal_error=0.05;