%% ct95KI

% EXP='ct95KI';
% PI='Christophe Guinet';
% nomfic='ct95_ODV.txt';
% disp(EXP)

%% remove tags

Mqc=remove_profiles(info_deployment,'ct95-C1-12','P-S+',[100 34.2]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct95 = [
	1	0.00	0.00	0.00	0.03
	2	0.00	0.00	0.00	-0.02
    ];

temp_error=0.05;
psal_error=0.05;






