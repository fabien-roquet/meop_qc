%% ct42

% EXP='ct42';
% PI='BORNEMANN-BESTER';


%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct42 = [
	1	   0	   0	   0	  0.08
    ];

temp_error=0.05;
psal_error=0.05;



