%% ct46EI

% EXP='ct46EI';
% PI='Monica Muelbert';
% nomfic='ct46_ODV.txt';
% disp(EXP)
% 
%% apply corrections

sc_init_corrections;
list_tag = dir([info_deployment.dir,'*_prof.nc']);

calib_coeff.ct46 = [
	 1	   0	   0	   .03	0.17
	 2	   0	   0	   .03	 0.1
	 3	   0	   0	   0	0.1
	 4	   0	   0	   0	0.1
	 5	   0	   0	   0	0.05
	 6	   0	   0	   0	0.12
	 7	   0	   0	   .04	 .06
	 8	   0	   0	   .05	  -0
	 9	   0	   0	   .1	 .07
	10	   0	  -.02	   .1	 .14
    ];


temp_error=0.05;
psal_error=0.05;

