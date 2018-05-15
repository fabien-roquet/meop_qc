%% ct65SA

% EXP='ct65SA';
% PI='Monica Muelbert';
% nomfic='ct65_ODV.txt';
% disp(EXP)

%% remove tags

Mqc=remove_profiles(info_deployment,'ct65-11079-10','Tmax',9.5);
Mqc=remove_profiles(info_deployment,'ct65-11342-10','Tmax',10);
Mqc=remove_tag(info_deployment,'ct65-11343-10');
Mqc=remove_Sprofiles(info_deployment,'ct65-11343r-10');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct65 = [
    1	   0	   0	   0	  0.10
    2      0	   0	   0	  0.04
	3	   0	   0	   0	  0.00
	4	   0	   0	   0	  0.00
    ];

temp_error=0.05;
psal_error=0.05;

