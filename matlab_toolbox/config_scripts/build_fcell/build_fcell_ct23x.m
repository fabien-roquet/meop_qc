%% ct23xK

% EXP='ct23xK';
% PI='Christophe Guinet';
% nomfic='ct23x_ODV.txt';
% disp(EXP)


%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct23x-536-08','date_max',140);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct23x = [
    1	0   0   -.1	0
    2	0   0   -0.042	.02
    3	0   0   -0.035	  -0
    4	0   0   -0.054	-.04
    5	0   0   0.05	 .15
    6	   0	   0	   0	 .06
    ];
salinity_offset.ct23x        = zeros (length(list_tag),1);
salinity_offset.ct23x02=[1 250 0; 0 0 .5]; %ct23x-536-08

temp_error=0.05;
psal_error=0.05;

