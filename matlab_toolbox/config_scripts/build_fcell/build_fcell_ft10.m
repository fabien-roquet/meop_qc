%% ft10KI
% 
% EXP='ft10KI';
% PI='Christophe Guinet';
% nomfic='ft10_ODV.txt';
% disp(EXP)


%% remove tags
Mqc=remove_profiles(info_deployment,'ft10-Ox02-11','Pmax',1000);
Mqc=remove_profiles(info_deployment,'ft10-Ox02-11','Tmax',10);
Mqc=remove_profiles(info_deployment,'ft10-Ox02-11','P+T+',[300 4]);
Mqc=remove_profiles(info_deployment,'ft10-Ox02-11','Smax',34.65);
Mqc=remove_profiles(info_deployment,'ft10-Ox03-11','Smin',33.5);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft10 = [
    1	   0	   0	   .1	-0.2
    2	   0	   0	   .15	  -0
    3	   0	   0		0.021	  .01
    4	   0	   0		0	  .02
    5	   0	   0		-0.002	  -0
    6	   0	   0		-0.0018	  -0
    7	   0	   0		-0.064	  -0
    8	   0	   0		-0.072	-0.1
    9	   0	   0	   .03	-0.1
    ];

temp_error=0.05;
psal_error=0.05;


