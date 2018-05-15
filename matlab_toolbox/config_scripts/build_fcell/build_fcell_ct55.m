%% ct55

%% remove tags
list_tag = dir([info_deployment.dir,'*_prof.nc']);
Mqc=remove_profiles(info_deployment,'ct55-11300-10','Smin',30);
Mqc=remove_profiles(info_deployment,'ct55-11300-10','T+S+',[6 32]);


%% apply corrections
sc_init_corrections;

calib_coeff.ct55 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.05
	4	0.00	0.00	0.00	-.10
	5	0.00	0.00	0.00	0.00
    ];

temp_error=0.05;
psal_error=0.05;