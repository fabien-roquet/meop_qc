%% wd06

%% remove tags
%Mqc=remove_tag(info_deployment,'ft02-I-09');
Mqc=remove_profiles(info_deployment,'wd06-07-13','Pmax',1000);
Mqc=remove_profiles(info_deployment,'wd06-09-13','Pmax',1000);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd06 = [
	1	0.00	-.05	0.00	0.00
	2	0.00	0.00	0.00	0.10
	3	0.00	0.00	0.00	0.15
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.10
	8	0.00	0.00	0.00	0.05
	];

temp_error=0.05;
psal_error=0.1;
