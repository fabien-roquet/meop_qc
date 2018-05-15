%% ct3
% 
% EXP='ct3';
% PI='Christophe Guinet';

%% remove tags
Mqc=remove_profiles(info_deployment,'ct3-9931-04','date_max',44);
Mqc=remove_profiles(info_deployment,'ct3-9938-04','date_max',130);



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
calib_coeff.ct3 = [
	 1	   0	   0	   0	 0
	 2	   0	   0	   0	0.02
	 3	   0	   0	   0	0.04
	 4	   0	   0	   0	0.03
	 5	   0	   0	   0	  -0
	 6	   0	   0	   0	0.06
	 7	   0	   0	   0	0.03
	 8	   0	   0	   0	0.05
	 9	   0	   0	   0	  -0
	 10	   0	   0	   0	  -0
    ];
salinity_offset.ct3        = zeros (length(list_tag),1);
salinity_offset.ct310=[1 150 0; -.04 -0.04 -.24];

minT=-3; maxT=8; minS=4; maxS=40; min_Nprof=30;
temp_error=0.2;
psal_error=0.2;


