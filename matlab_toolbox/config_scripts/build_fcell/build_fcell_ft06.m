%% ft06KI

% EXP='ft06KI';
% PI='Christophe Guinet';
% nomfic='ft06_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_profiles(info_deployment,'ft06-Cy16-10','P+S+',[600 34.7]);
Mqc=remove_profiles(info_deployment,'ft06-Cy16-10','P-S+',[50 34.3]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft06 = [
    1	   0	   0		-0.13	  -0
    2	   0	   0		-0.052	0.02
    3	   0	   0		-0.071	  -0
    4	   0	   0		-0.12	-0.15
    5	   0	   0		0.043	0.02
    6	   0	   0		-.02	0.03
    7	   0	   0	   0	-0.07
    8	   0	   0	   0	  -0
    9	   0	   0		 .03	0.04
    ];

temp_error=0.05;
psal_error=0.05;


