%% ct7
% 
% EXP='ct7';
% PI='Christophe Guinet';

%% remove tags
Mqc=remove_profiles(info_deployment,'ct7-10037-05','Smin',33.5);



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
calib_coeff.ct7 = [
	1	   0	   0	   0	  -0
	2	   0	   0	   0	 0
	3	   0	   0	   0	0.03
	4	   0	   0	   0	 0
	5	   0	   0	   0	  -0
	6	   0	   0	   0	 0.1
	7	   0	   0	   0	 0    
    ];


temp_error=0.2;
psal_error=0.2;


