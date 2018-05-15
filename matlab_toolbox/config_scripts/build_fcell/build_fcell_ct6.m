%% ct6

% EXP='ct6';
% PI='Mark Hindell';

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct6-10015-05');
Mqc=remove_Sprofiles(info_deployment,'ct6-10017-05');
Mqc=remove_profiles(info_deployment,'ct6-10011-05','P+T-',[400 0]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct6 = [
	 1	   0	   0	   0	0.30
	 2	   0	   0	   0	  -0
	 3	   0	   0	   0	  -0
	 4	   0	   0	   0	  -0
	 5	   0	   0	   0	0.06
	 6	   0	   0	   0	0.00
	 7	   0	   0	   0	-.30
	 8	   0	   0	   0	0.00
	 9	   0	   0	   0	0.00
     10    0	   0	   0	0.60
     11    0	   0	   0	0.00
    ];

temp_error=0.2;
psal_error=0.2;

