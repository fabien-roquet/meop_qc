%% remove tags

Mqc=remove_Sprofiles(info_deployment,'ft15-F1-13');
Mqc=remove_Sprofiles(info_deployment,'ft15-F2-13');
Mqc=remove_profiles(info_deployment,'ft15-F1-13','index',[122 148 154 205]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft15 = [
    1	0.00	0.00	0.00	0.00
    2	0.00	0.00	0.00	0.00
    ];

temp_error=0.05;
psal_error=0.2;

