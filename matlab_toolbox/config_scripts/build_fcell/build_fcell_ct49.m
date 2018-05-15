%% ct49SG

% EXP='ct49SG';
% PI='Mike Fedak';
% nomfic='ct49_ODV.txt';
% disp(EXP)


list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct49 = [
	 1	   0	   0	   0	0.07
	 2	   0	   0	   0	0.15
	 3	   0	   0	-.05	0.08
	 4	   0	   0	   0	-0.05
	 5	   0	   0	   0	0.05
	 6	   0	   0	   0	  -0
	 7	   0	   0	   0	 0.1
	 8	   0	   0	   0	 0.1
	 9	   0	   0	   0	 0.1
	10	   0	   0	   0	0.15
	11	   0	   0	   0	0.10
	12	   0	   0	   0	 0.1
    ];


temp_error=0.05;
psal_error=0.05;



