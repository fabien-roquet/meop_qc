%% ft14KI
% 
% EXP='ft14KI';
% PI='Christophe Guinet';
% nomfic='ft14_ODV.txt';
% disp(EXP)
% 

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft14 =[
	 1	   0	   0	   0	  0
	 2	   0	   0	   0	  0
	 3	   0	   0	   0      0
	 4	   0	   0	   0	  0
	 5	   0	   0	   0	  0
];

temp_error=0.05;
psal_error=0.05;





