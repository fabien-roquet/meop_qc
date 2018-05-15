%% ct22EI

% EXP='ct22EI';
% PI='Monica Muelbert';
% nomfic='ct22_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct22-11-08');
Mqc=remove_Sprofiles(info_deployment,'ct22-17-08');


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct22 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
    ];

temp_error=0.1;
psal_error=0.05;


