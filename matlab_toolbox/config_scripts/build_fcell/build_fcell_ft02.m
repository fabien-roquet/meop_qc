%% ft02KI
% 
% EXP='ft02KI';
% PI='Christophe Guinet';
% nomfic='ft02_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_tag(info_deployment,'ft02-I-09');
Mqc=remove_profiles(info_deployment,'ft02-C-09','Tmax',8);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft02 = [
    1	   0	   0	   0	0
    2	   0	.02	 .05	0.05
    3	   0	   0	   0	   0
    4	   0	   0	   0	 0.1
    5	   0	   0	   0	0.07
    6	   0	   0	-.15	 .01
    7	   0	   0	   0	   0
    8	   0	   0	   0	 0.1
    ];

temp_error=0.05;
psal_error=0.05;





