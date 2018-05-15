%% ft03KI

% EXP='ft03KI';
% PI='Christophe Guinet';
% nomfic='ft03_ODV.txt';
% disp(EXP)
% 

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft03 = [
    1	 0    0 	0	  -.02
    2	 0    0   	-0.02	-.02
    3	 0	  0	0.04	0.06
    4	 0	  0	  0.03	  -.04
    5	 0 	  0 	-0.1	0.05
    6	 0 	  0 	0.028	  .03
    ];

temp_error=0.05;
psal_error=0.05;



