%% ct96
% 
% EXP='ft11KI';
% PI='Christophe Guinet';
% nomfic='ft11_ODV.txt';
% disp(EXP)

%% remove tags
Mqc = remove_tag(info_deployment,'ft11-Cy30b-12');
Mqc = remove_tag(info_deployment,'ft11-Cy28b-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft11 = [
	 1	   0	   0	  .05	 -.01
	 2	   0	   0	  .02	  .02
	 3	   0	   0	   0	  0
	 4	   0	   0	   0	  0
];

temp_error=0.05;
psal_error=0.05;


