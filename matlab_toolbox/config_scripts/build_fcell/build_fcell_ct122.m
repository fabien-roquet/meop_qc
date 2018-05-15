%% ct122

%% remove tags
Mqc=remove_tag(info_deployment,'ct122-153-15');
Mqc=remove_profiles(info_deployment,'ct122-157-15','Smax',8.5);
Mqc=remove_Sprofiles(info_deployment,'ct122-159-15');
Mqc=remove_Sprofiles(info_deployment,'ct122-32BAT-15','date_max',55);

% ct122-42BAT-15 has bad locations: question posed to Phil!
Mqc=remove_tag(info_deployment,'ct122-42BAT-15');

Mqc=remove_Sprofiles(info_deployment,'ct122-43BAT-15','Smax',34.8);
Mqc=remove_Sprofiles(info_deployment,'ct122-43BAT-15','date_max',130);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct122 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.02	0.03
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.02	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	-.10	-.02
	7	0.00	0.00	0.01	0.00
    8	0.00	0.00	0.03	0.00
	9	0.00	0.00	0.02	0.00
	10	0.00	0.00	0.00	0.00
	11	0.00	0.00	-.10	0.00
	12	0.00	0.00	-.02	-.03
    ];

temp_error=0.05;
psal_error=0.05;