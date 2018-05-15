%% ct31

%% remove tags
Mqc=remove_tag(info_deployment,'ct31-441-07');
Mqc=remove_tag(info_deployment,'ct31-448A-07');
Mqc=remove_tag(info_deployment,'ct31-448B-07');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct31 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	];

temp_error=0.1;
psal_error=0.2;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
