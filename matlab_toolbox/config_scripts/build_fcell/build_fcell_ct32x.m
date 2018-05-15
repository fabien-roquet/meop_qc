%% ct32x

%% remove tags
Mqc=remove_profiles(info_deployment,'ct32x-F40-08','P+T+',[200 7]);
Mqc=remove_profiles(info_deployment,'ct32x-F40-08','P+S-',[35 33]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct32x = [
	1	0.00	0.00	0.00	0.23
	2	0.00	0.00	0.00	0.4
	3	0.00	0.00	0.00	0.13
	4	0.00	0.00	0.00	0.09
	5	0.00	0.00	0.00	0.17
	6	0.00	0.00	0.00	0.12
	7	0.00	0.00	0.00	0.14
    8	0.00	0.00	0.00	0.11
	9	0.00	0.00	0.00	0.05
	10	0.00	0.00	0.00	0.05
	11	0.00	0.00	0.00	0.09
	12	0.00	0.00	0.00	0.21
	13	0.00	0.00	0.00	0.14
	14	0.00	0.00	0.00	0.12
    15	0.00	0.00	0.00	0.12
    16	0.00	0.00	0.00	0.00
    ];


temp_error=0.05;
psal_error=0.05;