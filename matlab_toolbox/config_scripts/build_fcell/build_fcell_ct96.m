%% ct96KI
% EXP='ct96KI';
% PI='Mark Hindell';
% nomfic='ct96_ODV.txt';

%% remove tags
Mqc=remove_tag(info_deployment,'ct96-13-13');
Mqc=remove_tag(info_deployment,'ct96-15-13');
Mqc=remove_profiles(info_deployment,'ct96-05-13','Smin',33);
Mqc=remove_profiles(info_deployment,'ct96-05-13','Pmax',1400);
Mqc=remove_profiles(info_deployment,'ct96-16-13','Smax',34.85);
Mqc=remove_profiles(info_deployment,'ct96-16-13','Smin',33);
Mqc=remove_profiles(info_deployment,'ct96-18-13','date_max',50);
Mqc=remove_profiles(info_deployment,'ct96-18-13','date_max',50,'_fr0');
Mqc = remove_Sprofiles(info_deployment,'ct96-02-13','Smin',32);
Mqc = remove_Sprofiles(info_deployment,'ct96-02-13','Smin',32,'_fr0');
Mqc = remove_Sprofiles(info_deployment,'ct96-02-13','index',43);
Mqc = remove_Sprofiles(info_deployment,'ct96-03-13','index',[346 349]);
Mqc = remove_Sprofiles(info_deployment,'ct96-05-13','index',91);
Mqc = remove_Sprofiles(info_deployment,'ct96-20-13','index',584);
Mqc = remove_Sprofiles(info_deployment,'ct96-21-13','Smin',33,'_fr0');
Mqc = remove_Sprofiles(info_deployment,'ct96-22-13','index',[23 317]);
Mqc = remove_Sprofiles(info_deployment,'ct96-24-13','date_max',62,'_fr0');
Mqc = remove_Sprofiles(info_deployment,'ct96-25-13','Smin',32,'_fr0');
Mqc = remove_Sprofiles(info_deployment,'ct96-26-13','index',706);
Mqc = remove_Sprofiles(info_deployment,'ct96-28-13','index',[255 570]);
Mqc = remove_Sprofiles(info_deployment,'ct96-28-13','Smin',33,'_fr0');
Mqc=remove_profiles(info_deployment,'ct96-23-13','Smin',33);


%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

calib_coeff.ct96 =[
    1	   0	   0	   0	-.13
    2	   0	   0	   0	 .05
    3	   0	   0	   0	0.03
    4	   0	 0.02	   0	-.03
    5	   0	   0	   0	-0.1
    6	   0	   0	   0	-.1
    7	   0	   0	   0	-.01
    8	   0	0.01	-.02	-.03
    9	   0	   0	 .05	-.1
    10	   0	   0	-.04	-.02
    11	   0	0.02	   0	-0.16
    12	   0	   0	   0	 0
    13	   0	   0	   0	-.03
    14	   0	   0	   0	 0
    15	   0	0.04	   0	-.01
    16	   0	   0	   0	-.02
    17	   0	   0	 -.03	-0.07
    18	   0	   0	 -.02	-0.04
    19	   0	   0	   0	-0.14
    20	   0	-0.05	   0	0
    21	   0	   0	 .02	-.05
    22	   0	   0	 .03	-0.05
    23	   0	0.02	   0	-0.06
    24	   0	-0.03	 .02	-0.06
    25	   0	 .02	-.08	-0.08
    26	   0	   0	-.02	-0.1
    27	   0	   0	 .03	-0.1
    28	   0	   0	   0	-0.01
    29	   0	0.04	   0	-0.05
];

temp_error=0.05;
psal_error=0.05;




