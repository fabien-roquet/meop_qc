%% ct109

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct109-032-14','Smin',33.5);
Mqc=remove_Sprofiles(info_deployment,'ct109-188-14','date_max',50);
Mqc=remove_Sprofiles(info_deployment,'ct109-191-14','date_max',158);
Mqc=remove_profiles(info_deployment,'ct109-965-14','Tmax',10);
Mqc=remove_tag(info_deployment,'ct109-969-14');
Mqc=remove_profiles(info_deployment,'ct109-973-14','Tmax',10);
Mqc=remove_profiles(info_deployment,'ct109-973-14','date_max',250);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct109 = [
	1	0.00	0.00	0.00	0.15
	2	0.00	0.00	0.00	0.15
	3	0.00	0.00	-.03	0.00
	4	0.00	0.00	0.00	0.02
	5	0.00	0.00	0.00	0.04
	6	0.00	0.00	0.00	-0.06
	7	0.00	0.00	0.00	0.03
	8	0.00	0.00	-.03	-0.01
    9	0.00	0.00	-.10	0.10
    10	0.00	0.00	-.02	0.00
	11	0.00	0.00	0.00	0.00
	12	0.00	0.00	0.00	0.00
	13	0.00	0.00	0.00	0.03
	14	0.00	0.00	0.02	0.02
	15	0.00	0.00	0.00	0.03
	16	0.00	0.00	0.00	0.03
	17	0.00	0.00	0.00	0.00
	18	0.00	0.00	0.00	0.15
	19	0.00	0.00	0.05	0.10
	20	0.00	0.00	0.00	0.00
	21	0.00	0.00	0.00	0.20
	22	0.00	0.00	0.00	0.00
	23	0.00	0.00	0.00	0.10
    ];

temp_error=0.05;
psal_error=0.05;