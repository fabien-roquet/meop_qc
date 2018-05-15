%% ct2

% EXP='ct2';
% PI='Mark Hindell';

%% remove tags

Mqc=remove_Sprofiles(info_deployment,'ct2-9916-04');
Mqc=remove_Sprofiles(info_deployment,'ct2-9925-04');

%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

%salinity_offset.ct202= [ 1 100 0 ; .1 -.02 .02 ];
%salinity_offset.ct203= [ 1 240 0 ; .23 .23 .18 ];

calib_coeff.ct2 = [
	 1	   0	   0	   0	 NaN
	 2	   0	   0	   0	 .55
	 3	   0	   0	   0	 .5
	 4	   0	   0	   0	 NaN
    ];


temp_error=0.2;
psal_error=0.2;

