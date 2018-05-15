%% ft07KI
% 
% EXP='ft07KI';
% PI='Christophe Guinet';
% nomfic='ft07_ODV.txt';
% disp(EXP)


%% remove tags
Mqc=remove_tag(info_deployment,'ft07-Cy23-11');
Mqc=remove_tag(info_deployment,'ft07-Cy30-11');
Mqc=remove_profiles(info_deployment,'ft07-Cy21-11','Smin',33.5);
Mqc=remove_profiles(info_deployment,'ft07-Cy25-11','P+T-',[250 0.5]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft07 = [
    1	   0	   0	 -.07	  .05
    2	   0	   0	-0.05	  .02
    3	   0	   0	   0	  -0
    4	   0	   0	0.048	0.06
    5	   0	   0	0.05	0.02
    6	   0	   0	-0.02	0.1
    7	   0	   0	0.03	0.02
    8	   0	   0	0.04	 0.1
    9	   0	   0	0.042	  -0
    10	   0	   0	   0	  -0
    ];

temp_error=0.05;
psal_error=0.05;



