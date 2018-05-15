%% 

% EXP='awruDS';
% PI='Mark Hindell';
% nomfic='awru1_ODV.txt';
% disp(EXP)

%% remome profil
list_tag = dir([info_deployment.dir,'*_prof.nc']);
for ii=1:length(list_tag)
   Mqc=remove_profiles(info_deployment,list_tag(ii).name(1:end-12),'lat_min',-20);   
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.awru1 = [
	1	0.00	0.05	0.00	0.00
	2	0.00	0.25	0.00	0.00
	3	0.00	0.04	0.00	0.00
    ];

temp_error=0.2;
psal_error=0.2;


