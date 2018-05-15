%% ct33

% EXP='ct33';
% PI='BORNEMANN-BESTER';
% disp(ct33)


%% remove tags
Mqc=remove_profiles(info_deployment,'ct33-WW061-07','Pmax',1200);
Mqc=remove_profiles(info_deployment,'ct33-WW061-07','Pmax',1200);
Mqc=remove_Sprofiles(info_deployment,'ct33-PO043-07','date_max',250);
Mqc=remove_Sprofiles(info_deployment,'ct33-WW058-07','date_max',220);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

%salinity_offset.ct33        = zeros (length(list_tag),1);
%salinity_offset.ct3304= [1 650 0; 0 0 -.02 ];


calib_coeff.ct33 = [
	1	   0	   0	   0	-.13
    2	   0	   0	   0	0.03
    3	   0	   0	   0	  -0
	4	   0	   0	   0	-0.04
	5	   0	   0	  .05	-0.15
    ];


temp_error=0.05;
psal_error=0.05;



