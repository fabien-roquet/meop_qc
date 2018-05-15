%% remove tags
Mqc=remove_profiles(info_deployment,'wd3-CTD1-07','P-S+',[20 33.7]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd3 = zeros (length(list_tag),5);

temp_error=0.2;
psal_error=0.2;

