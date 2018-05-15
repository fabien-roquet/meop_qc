%% ct11
% 
% EXP='ct11';
% PI='Christophe Guinet';

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct11-10096-05');
Mqc=remove_Sprofiles(info_deployment,'ct11-10097-05');



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
calib_coeff.ct11 = [
	1	   0	   0	   0	-0.05
	2	   0	   0	   0	 0
	3	   0	   0	   0	 0
    ];


temp_error=0.2;
psal_error=0.2;


