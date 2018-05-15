%% ct125

%% remove tags
Mqc=remove_tag(info_deployment,'ct125-227-12'); % no locations
Mqc=remove_profiles(info_deployment,'ct125-244-12','P-T-',[110 7]);
Mqc=remove_profiles(info_deployment,'ct125-244-12','P+T+',[600 7]);
Mqc=remove_tag(info_deployment,'ct125-244-12'); % no locations
Mqc=remove_tag(info_deployment,'ct125-953-13'); % no locations
Mqc=remove_profiles(info_deployment,'ct125-F946-13','P-T-',[110 7]);
Mqc=remove_tag(info_deployment,'ct125-F946-13'); % no locations
Mqc=remove_Sprofiles(info_deployment,'ct125-06BAT-14');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct125 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.10
	4	0.00	0.00	0.00	0.10
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
    ];

temp_error=0.1;
psal_error=0.1;