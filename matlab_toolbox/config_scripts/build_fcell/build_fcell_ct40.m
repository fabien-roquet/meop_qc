%% ct40SG
% 
% EXP='ct40SG';
% PI='Mike Fedak';
% nomfic='ct40_ODV.txt';
% disp(EXP)

%% remove tags

Mqc=remove_profiles(info_deployment,'ct40-Boris-08','Smin',33.5);
Mqc=remove_profiles(info_deployment,'ct40-Bob-08','Smin',33);
Mqc=remove_profiles(info_deployment,'ct40-Lily-08','date_max',150);
Mqc=remove_profiles(info_deployment,'ct40-Lily-08','date_max',150);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct40 = [
	 1	   0	   0	   0	0.27
	 2	   0	   0	0.02	0.12
	 3	   0	   0	   0	0.12
	 4	   0	   0	   0	0.10
	 5	   0	   0	0.10	0.05
	 6	   0	   0	-.05	0.20
	 7	   0	   0	   0	0.10
	 8	   0	   0	0.03	0.16
	 9	   0	   0	0.10	0.08
	10	   0	   0	   0	0.05
    ];


temp_error=0.05;
psal_error=0.1;



