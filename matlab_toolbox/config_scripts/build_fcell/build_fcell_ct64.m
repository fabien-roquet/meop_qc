%% ct64MI

% EXP='ct64MI';
% PI='Mark Hindell';
% nomfic='ct64_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct64-M001-09','Smax',34.85);
Mqc=remove_Sprofiles(info_deployment,'ct64-M044-09');
Mqc=remove_profiles(info_deployment,'ct64-M053-09','Tmax',8);
Mqc=remove_profiles(info_deployment,'ct64-M059-09','Tmax',9);
Mqc=remove_profiles(info_deployment,'ct64-M061-09','date_min',10);
Mqc=remove_profiles(info_deployment,'ct64-M994-09','index',275);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;
 
calib_coeff.ct64 = [
	 1	   0	   0	   0	 0.05
	 2	   0	   0	   0	 0.15
	 3	   0	   0	   0	 0.15
	 4	   0	   0	   0	0.15
	 5	   0	   0	0.03	-0.05
	 6	   0	   0	   0	  -0
	 7	   0	   0	   0	 -.04
	 8	   0	   0	   0	 0.05
	 9	   0	   0	   0	-0.13
	10	   0	   0	   0	-0.05
	11	   0	   0	-.05	 0.08
	12	   0	   0	-.05	0.03
	13	   0	   0	-.05	 0.1
	14	   0	   0	0.03	 0.18
	15	   0	   0	0.03	 0.05
    ];

salinity_offset.ct64        = zeros (length(list_tag),1);
salinity_offset.ct6402= [ 1 180 181 0 ; 0 0 -.15 -.15];

temp_error=0.05;
psal_error=0.05;




