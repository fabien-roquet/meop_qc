%% ct100C
% 
% EXP='ct100C';
% PI='Mark Hindell';
% nomfic='ct100_ODV.txt';
% disp(EXP)


%% remove tags
Mqc=remove_profiles(info_deployment,'ct100-251-13','P-T-',[100 7]);
Mqc=remove_profiles(info_deployment,'ct100-264-13','P-T-',[100 7.2]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct100 =[
	 1	   0	   0	   0	.05
	 2	   0	   0	   0	.17
	 3	   0	   0	   0	.3
	 4	   0	   0	   0	.15
	 5	   0	   0	   .05	.05
];

temp_error=0.1;
psal_error=0.1;




