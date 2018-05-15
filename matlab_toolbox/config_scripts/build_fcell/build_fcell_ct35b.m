%% ct35b

% EXP='ct35b';
% PI='BORNEMANN-BESTER';
% disp(ct35b)


%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct35b-YY039-08','date_max',95);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

%salinity_offset.ct35b        = zeros (length(list_tag),1);
%salinity_offset.ct35b02= [1 350 0; 0 0 -.04 ];
%salinity_offset.ct35b01= [1 250 300 0; 0 0 -.1 -.1];

calib_coeff.ct35b = [
	1	   0	   0	   0	-.04
	2	   0	   0	   0	-.04
	3	   0	   0	   0	0.02
	4	   0	   0	   0	0.02
    ];

temp_error=0.05;
psal_error=0.1;



