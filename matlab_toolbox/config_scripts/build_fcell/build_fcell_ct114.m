%% ct114

%% remove tags
Mqc=remove_profiles(info_deployment,'ct114-04-14','Tmin',2);
Mqc=remove_Sprofiles(info_deployment,'ct114-06-14');
Mqc=remove_Sprofiles(info_deployment,'ct114-10-14','date_max',50);
Mqc=remove_Sprofiles(info_deployment,'ct114-11-14','P+T+',[300 10]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct114 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.05
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.15
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	10	0.00	0.00	0.00	0.00
	11	0.00	0.00	0.00	0.00
	12	0.00	0.00	0.00	0.10
	13	0.00	0.00	0.00	0.00
	14	0.00	0.00	0.00	0.00
	15	0.00	0.00	0.00	0.00
	];
% ct114-09-14: -0.1 from 150 days on
salinity_offset.ct11408 = [1 149 150 0; 0 0 -.1 -.1];

temp_error=0.05;
psal_error=0.1;

minT=-3;
maxT=32;

minS= 4;
maxS=40;

min_Nprof= 30;
