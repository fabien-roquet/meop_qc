%% ft12KI
% EXP='ft12KI';
% PI='Christophe Guinet';
% nomfic='ft12_ODV.txt';
% disp(EXP)


%% remove tags


Mqc = remove_Sprofiles(info_deployment,'ft12-F3-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft12 =[
	 1	   0	   0	   .01	  .04
	 2	   0	   0	   0	  -.1
	 3	   0	   0	   -.05	  -.05
	 4	   0	   0	   0	  0
	 5	   0	   0	   -.05	  -.04
	 6	   0	   0	   0	  -.1
	 7	   0	   0	   0	  0
];

temp_error=0.05;
psal_error=0.05;


