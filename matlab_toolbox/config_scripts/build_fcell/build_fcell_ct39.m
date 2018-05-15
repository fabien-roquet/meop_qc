%% ct96

% EXP='ct39EI';
% PI='Monica Muelbert';
% nomfic='ct39_ODV.txt';
% disp(EXP)

%% load data in odv format, convert into fcell and then write ARGOcdf file
% sc_load_odv2prof;

%% remove tags
Mqc=remove_profiles(info_deployment,'ct39-49-08');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct39 = [
	 1	   0	   0	   .05	 .07
	 2	   0	   .03	   -.02	 .07
	 3	   0	   -.05	   0	 .21
	 4	   0	   -.02	   0	0.19
	 5	   0	   .05	   .03	 .0
	 6	   0	   0	   .05	 0.07
	 7	   0	   0	   .03	0.11
	 8	   0	   0	   .05	 .04
	 9	   0	   0	   .08	0.06
	10	   0	   0	   0	  -0
    ];

temp_error=0.05;
psal_error=0.05;




