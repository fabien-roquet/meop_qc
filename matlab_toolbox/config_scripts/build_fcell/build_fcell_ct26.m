%% ct26

% EXP='ct26';
% PI='Christophe Guinet';
% disp(EXP)
%% remove tags


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct26 = [
	1	   0	   0	   0	-0.05
	2	   0	   0	   0	  -0
	3	   0	   0	  -.05	  -0
	4	   0	   0	  .03	 0.07
    ];


temp_error=0.05;
psal_error=0.05;
