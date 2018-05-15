%% ct112

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct112-051-14','Smax',34.6);
Mqc=remove_Sprofiles(info_deployment,'ct112-051-14','Smin',33.2);
Mqc=remove_profiles(info_deployment,'ct112-051-14','P+T-',[300 0]);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct112 = [
	1	0.00	0.00	0.00	-0.02
	2	0.00	0.00	0.00	0.07
	3	0.00	0.00	0.00	-0.15
	4	0.00	0.00	0.00	-0.08
	5	0.00	0.00	0.00	0.02
	6	0.00	0.00	0.00	-0.03
	7	0.00	0.00	0.00	0.09
	8	0.00	0.00	0.00	-0.17
    ];


temp_error=0.05;
psal_error=0.05;