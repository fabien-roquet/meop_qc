%% ct38e

% EXP='ct38e';
% PI='Christophe Guinet';
% disp(EXP)



%% remove tags
Mqc=remove_profiles(info_deployment,'ct38e-30-08','index',162);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct38e = [
    1	   0	   0	   0	  .02
    2	   0	   0	  .03	  .10
    3	   0	   0	   0	   -0
    4	   0	   0	   0	  .03
    5	   0	   0	  .08	  .05
    ];


temp_error=0.05;
psal_error=0.05;



