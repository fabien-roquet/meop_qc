%% ct111

%% remove tags
Mqc=remove_tag(info_deployment,'ct111-835-10');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct111 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	-.04	0.00	0.05
	3	0.00	0.00	0.00	0.10
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	    ];

temp_error=0.05;
psal_error=0.2;