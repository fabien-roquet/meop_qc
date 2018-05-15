%% ct45SG

% EXP='ct45SG';
% PI='Mike Fedak';
% nomfic='ct45_ODV.txt';
% disp(EXP)

%% load data in odv format, convert into fcell and then write ARGOcdf file
% sc_load_odv2prof;

%% remove tags


Mqc=remove_profiles(info_deployment,'ct45-Fortis-08','date_max',30);
Mqc=remove_Sprofiles(info_deployment,'ct45-FreddieMac-08');
Mqc=remove_profiles(info_deployment,'ct45-NorthernRock-08','date_max',33);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct45 = [
	 1	   0	   0	   0	-0.09
	 2	   0	   0	   0	0.13
	 3	   0	   0	   0	0.15
	 4	   0	   0	   0	 0
	 5	   0	   0	   0	 0.1
	 6	   0	   0	   0	 0.2
	 7	   0	   0	   0	 0
	 8	   0	   0	   0	 -.18
	 9	   0	   0	   0	 .04
	10	   0	   0	   0	 .08
    ];

%salinity_offset.ct45        = zeros (length(list_tag),1);
%salinity_offset.ct4507= [ 1 0; .1 -.05 ];

temp_error=0.05;
psal_error=0.05;

