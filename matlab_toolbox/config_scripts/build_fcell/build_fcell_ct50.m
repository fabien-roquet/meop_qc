%% ct50

% EXP='ct50';
% PI='BORNEMANN-BESTER';


%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct50 = [
	1	   0	   0	   0	0.03
    2	   0	   0	 .10	0.06
    3	   0	   0	   0	0.07
	4	   0	   0	   0	-0.05
    ];

temp_error=0.05;
psal_error=0.05;



