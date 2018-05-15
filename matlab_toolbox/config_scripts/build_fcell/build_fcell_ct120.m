%% ct120

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct120-F4-15','date_max',19);
Mqc=remove_Sprofiles(info_deployment,'ct120-050BAT-15','Smin',33.4);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct120 = [
	1	0.00	0.00	0.10	-.60
	2	0.00	0.00	-.10	0.05
	3	0.00	0.00	0.00	-.15
	4	0.00	0.00	0.00	0.10
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.15
    8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.05	0.10
	10	0.00	0.00	0.00	0.00
	11	0.00	0.00	0.03	-.03
	12	0.00	0.00	0.03	0.00
	13	0.00	0.00	0.00	-.60
    ];

temp_error=0.05;
psal_error=0.05;