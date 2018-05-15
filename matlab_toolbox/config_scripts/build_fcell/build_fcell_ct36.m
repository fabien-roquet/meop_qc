%% ct36KI

% EXP='ct36KI';
% PI='Mark Hindell';
% nomfic='ct36_ODV_Ker2009_AUS.txt';
% disp(EXP)

%% remove tags
Mqc=remove_tag(info_deployment,'ct36-R2-09');
Mqc=remove_tag(info_deployment,'ct36-R3-09');
Mqc=remove_Sprofiles(info_deployment,'ct36-B-09','date_max',200);
Mqc=remove_profiles(info_deployment,'ct36-C-09','P-T-',[20 2.1]);
Mqc=remove_profiles(info_deployment,'ct36-D-09','P-S-',[20 33.85]);
Mqc=remove_profiles(info_deployment,'ct36-R1-09','P-T-',[20 2.5]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct36 = [
    1	0   -0.03	0.03	0.10
    2	0   0	-0.05	 0.00
    3	0   0	0.05	 0.05
    4	0   0	0.05	0.09
    5	0   0	0.05	0.1
    6	0   -0.02	0.07	 0.07
    7	0   0	0.0	0.03
    8   0   0	0	  -0
    9	0   0	0	  -0
    10	0   -0.09	0.058	0.11
    ];

temp_error=0.05;
psal_error=0.05;





