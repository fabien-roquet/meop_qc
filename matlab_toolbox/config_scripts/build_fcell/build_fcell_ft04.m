%% ft04KI

% EXP='ft04KI';
% PI='Christophe Guinet';
% nomfic='ft04_ODV.txt';

%% remove tags
Mqc=remove_tag(info_deployment,'ft04-Cy08-10');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft04 = [
    1	   0	   0	   .05	-.02
    2	   0	   0	   0	  -0
    3	   0	   0	   .03	 0.12
    4	   0	   0	   .03	0.05
    5	   0	   0	   0	  -.05
    ];

temp_error=0.05;
psal_error=0.05;


