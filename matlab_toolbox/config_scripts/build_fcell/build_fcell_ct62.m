%% ct62KI

% EXP='ct62KI';
% PI='Christophe Guinet';
% nomfic='ct62_ODV.txt';
% disp(EXP)

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct62 = [
    1	0.0098	0.0069	-0.023	  -0
    2	-0.012	0.0078	0.02	  -0
    ];

temp_error=0.05;
psal_error=0.05;






