%% ct35

% EXP='ct35';
% PI='BORNEMANN-BESTER';
% disp(EXP)


%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct35 = [
	 1	   0	   0	   0	  0.05
	 2	   0	   0	   0	  0.05
	 3	   0	   0	   0	  -0
	 4	   0	   0	   0	  0.02
	 5	   0	   0	   0	  0.05
     6	   0	   0	   0      0.08
    ];


temp_error=0.05;
psal_error=0.1;



