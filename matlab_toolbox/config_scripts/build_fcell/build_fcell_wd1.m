%% 
% EXP='wd1';
% PI='Mark Hindell';
% nomfic='wd1_ODV.txt';

%% remove tags
list_tag = dir([info_deployment.dir,'*_prof.nc']);
Mqc = remove_profiles( info_deployment , 'wd1-10165-06' , 'Tmax' , 5 );
Mqc = remove_profiles( info_deployment , 'wd1-10213-06' , 'Tmax' , 5 );
for ii=1:length(list_tag)
   Mqc=remove_profiles(info_deployment,list_tag(ii).name(1:end-12),'lat_min',-20);   
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd1 = [
	1	0.00	0.60	0.00	0.00
	2	0.00	0.09	0.00	0.00
	3	0.00	-.06	0.00	0.00
	4	0.00	0.05	0.00	0.00
	5	0.00	-.05	0.00	0.00
	6	0.00	0.27	0.00	0.00
    ];

temp_error=0.2;
psal_error=0.2;

