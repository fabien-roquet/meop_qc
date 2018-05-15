%% ft13

%% remove tags
Mqc=remove_tag(info_deployment,'ft13-616-12');
Mqc=remove_tag(info_deployment,'ft13-628-12');
Mqc=remove_tag(info_deployment,'ft13-633-12');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft13 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	10	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.2;
