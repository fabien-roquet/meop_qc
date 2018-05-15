%% ct84KI

% EXP='ct84KI';
% PI='Christophe Guinet';
% nomfic='ct84_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_profiles(info_deployment,'ct84-254-12','date_max',20);
Mqc=remove_Sprofiles(info_deployment,'ct84-254-12','Smax',35);
Mqc=remove_profiles(info_deployment,'ct84-744-12','Smin',33);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct84 = [
    1	0   0   -0.064	  -0
    2	0   -0.03   -0.013	  -0
    3	0   -0.01   0.02	  .08
    ];

salinity_offset.ct84   = zeros (length(list_tag),1);
salinity_offset.ct8402 = [1 200 288 0;.1 .1 0 0];

temp_error=0.05;
psal_error=0.05;






