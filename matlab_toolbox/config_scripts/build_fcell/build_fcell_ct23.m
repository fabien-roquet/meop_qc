%% ct23

% EXP='ct23';
% PI='Christophe Guinet';
% disp(EXP)

%% remove tags
Mqc = remove_profiles(info_deployment,'ct23-C09-06','Pmax',1300);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct23 = [
	 1	   0	   0	   0	  -0
	 2	   0	   0	   0	  -0
	 3	   0	   0	   0	  -0
	 4	   0	   0	   0	  -0
	 5	   0	   0	   0	  -0
	 6	   0	   0	   0	  -0
     7	   0	   0	   0	  -0
	 8	   0	   0	   0	  -0
	 9	   0	   0	   0	 -.05
	 10	   0	   0	   0	 -.1
	 11	   0	   0	 -.05	 -.05
	 12	   0	   0	  .03	 -.05
    ];


temp_error=0.05;
psal_error=0.05;
