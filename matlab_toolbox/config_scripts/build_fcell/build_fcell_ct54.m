%% ct54KG

%% remove tags
Mqc=remove_profiles(info_deployment,'ct54-501-10','date_max',152);
Mqc=remove_profiles(info_deployment,'ct54-503-10','date_max',200);



%% apply corrections

list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct54 = [
    1	    0	    -.15	  .02	    .19
    2	    0	    0	    .04	    .02
    3	    0	    0	    .01	    .04
    4	    0	    0	    0	    0
    5	    0	    0	    0.01    0.07
    6	    0	    0	    .02	    .07
    7	    0	    .02	    -.06	    .12
    8	    0	    0	   -.05	    .1
    9	    0	    0	    .12	    .02
    10	    0	    0	    0	    0
    11	    0	    .03	    0	    0.04
    12	    0	    0	    0	    -.05
    13	    0	    -.2	    .065	    .27
    ];

temp_error=0.05;
psal_error=0.05;


