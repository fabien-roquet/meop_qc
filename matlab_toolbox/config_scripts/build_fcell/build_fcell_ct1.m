%% ct1

% EXP='ct1';
% PI='Mark Hindell';% disp(EXP)


%% remove tags
Mqc=remove_profiles(info_deployment,'ct1-Dasher-04','P-S+',[20 34.5]);
Mqc=remove_profiles(info_deployment,'ct1-Donner-04','date_max',60);
%Mqc=remove_Sprofiles(info_deployment,'ct1-Blitzen-04');

%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

calib_coeff.ct1 = [
	1	   0	   0	   0	-1.20
	2	   0	   0	   0	0.3
	3      0	   0	   0	0.1
    4	   0	   0	   0	0.5
	5	   0	   0	   0	0.3
    6	   0	   0	   0	0.45
    ];


temp_error=0.2;
psal_error=0.2;



