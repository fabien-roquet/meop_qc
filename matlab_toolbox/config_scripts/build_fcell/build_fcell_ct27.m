%% ct27WS

% EXP='ct27WS';
% PI='Lars Boehme';
% nomfic='ct27_ODV.txt';
% disp(EXP)

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct27 = [
	1	   0	   0	   0	0.2
	2	   0	   0	   0	0.2
	3	   0	   0	   0	0.15
	4	   0	   .05	   0	0.15
    ];

temp_error=0.05;
psal_error=0.1;


