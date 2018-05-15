%% ct104

%% remove tags
Mqc = remove_tag(info_deployment,'ct102-10432-13');
Mqc = remove_Sprofiles(info_deployment,'ct102-12797-13');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct102 = [
    1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.05	0.00
	3	0.00	0.00	0.06	0.02
	4	0.00	0.00	-.03	0.08
	5	0.00	0.00	0.00	0.45
	6	0.00	0.00	0.05	0.08
	7	0.00	0.00	0.00	0.08
	8	0.00	0.00	0.00	-.05
    ];


temp_error=0.05;
psal_error=0.05;