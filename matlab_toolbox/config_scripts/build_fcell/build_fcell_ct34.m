 %% bouvet
%
% EXP='bouvet';
% PI='Kit Kovacs';
% disp(EXP)

Mqc = remove_tag(info_deployment,'ct34-2440-08');
Mqc = remove_profiles(info_deployment,'ct34-2451-08','Tmax',6);
Mqc = remove_profiles(info_deployment,'ct34-2480-08','Tmax',6);
Mqc = remove_profiles(info_deployment,'ct34-2499-08','Tmax',4);
Mqc=remove_profiles(info_deployment,'ct34-2447-08','index',272);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);

sc_init_corrections;

%salinity_offset.ct34        = zeros (length(list_tag),1);
%salinity_offset.ct3417= [ 1 300 0 ; 0 -.09 -.09 ];

calib_coeff.ct34 = [
    1	   0	   0	   0	0.00
    2	   0	 -.03	   0	0.08
    3	   0	   0	 .03	0.10
    4	   0	   0	-.05	0.14
    5	   0	   0	-.05	0.08
    6	   0	   0	-.08	0.04
    7	   0	   0	   0	0.09
    8	   0	   0	-.01	0.07
    9	   0	   0	 .05	0.06
    10	   0	   0	   0	0.1
    11	   0	   0	   0	0.06
    12	   0	   0	   0	0.07
    13	   0	   0	   0	0.07
    14	   0	   0	 .02	0.05
    15	   0	   0	   0	0.03
    16	   0	   0	 .05	0.04
    17	   0	   0	   0	0.05
    18	   0	   0	   0	0.10
    19	   0	   0	   0	0.00
    20	   0	 -.03	   0	0.15
    ];


temp_error=0.05;
psal_error=0.05;



