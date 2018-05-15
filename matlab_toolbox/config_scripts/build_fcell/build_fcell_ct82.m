%% ct96
% 
% EXP='ct82KI';
% PI='Christophe Guinet';
% nomfic='ct82_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_tag(info_deployment,'ct82-924-11');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct82 = [
    1	0   0   -0.05	-0.1
    2 0 0 0 0
    ];

temp_error=0.05;
psal_error=0.05;


