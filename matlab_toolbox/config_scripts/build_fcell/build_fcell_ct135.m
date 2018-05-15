%% ct135

%% remove tags
Mqc=remove_tag(info_deployment,'ct135-188BAT-14');
Mqc=remove_tag(info_deployment,'ct135-892BAT-12');
Mqc=remove_Sprofiles(info_deployment,'ct135-937BAT-14');
Mqc=remove_Sprofiles(info_deployment,'ct135-939BAT-14','Smin',33.5);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct135 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	-.03
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.03
	6	0.00	0.00	-.06	-.15
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.02	0.02
	10	0.00	0.00	0.05	0.02
	11	0.00	0.00	0.00	0.00
	];

temp_error=0.05;
psal_error=0.05;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
