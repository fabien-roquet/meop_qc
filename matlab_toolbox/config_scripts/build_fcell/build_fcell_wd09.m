%% wd09

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd09 = [
    1	0.05	0.01	0.00	-.10
    2	0.00	0.00	0.00	-.10
    3	0.00	0.00	0.02	-.06
    ];

temp_error=0.05;
psal_error=0.05;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
