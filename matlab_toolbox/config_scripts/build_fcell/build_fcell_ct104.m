%% ct104

%% remove tags
list_tag = dir([info_deployment.dir,'*_prof.nc']);

Mqc=remove_profiles(info_deployment,'ct104-EF960-13','date_max',100);
Mqc=remove_profiles(info_deployment,'ct104-EM959-13','P-S+',[40 34.15]);
Mqc=remove_profiles(info_deployment,'ct104-EM959-13','P+S-',[200 33]);
for ii=1:length(list_tag)
   Mqc=remove_profiles(info_deployment,list_tag(ii).name(1:end-12),'lat_min',-20);   
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct104 = [
	1	-.01	0.02	0.00	0.10
	2	0.06	-.01	0.00	0.08
	3	0.18	0.01	0.00	-.10
	4	-.07	0.04	0.00	0.10
	5	-.01	0.01	0.00	0.07
	6	0.05	-.02	0.00	0.10
	7	-.03	0.02	0.00	0.08
	8	0.05	0.00	0.00	0.10
	9	-.01	0.01	0.00	0.07
	10	-.01	0.01	0.00	0.10
	11	0.02	0.01	0.00	0.10
	12	-.02	0.02	0.00	0.10
	13	0.00	0.00	0.00	0.10
	14	0.18	-.01	0.00	0.00
    ];

temp_error=0.05;
psal_error=0.05;



