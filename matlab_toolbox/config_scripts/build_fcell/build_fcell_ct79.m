%% ct79CI
% 
% EXP='ct79CI';
% PI='Mark Hindell';
% nomfic='ct79_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_tag(info_deployment,'ct79-249-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct79 = [
    1	   0	   0	   0	 0.1
    2	   0	   0	   0	 0.1
    3	   0	   0	   0	   0
    4	   0	   0	   0	   0
    ];


temp_error=0.05;
psal_error=0.05;




