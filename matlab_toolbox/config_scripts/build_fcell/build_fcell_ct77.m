%% ct77CS

%% remove tags

Mqc=remove_tag(info_deployment,'ct77-173-12');
Mqc=remove_tag(info_deployment,'ct77-183-12');
Mqc=remove_tag(info_deployment,'ct77-169-12');
Mqc=remove_profiles(info_deployment,'ct77-182-12','Smin',33);
Mqc=remove_profiles(info_deployment,'ct77-469-12','P+S-',[900 34.5]);
Mqc=remove_profiles(info_deployment,'ct77-473-12','Smax',34.8);
Mqc=remove_profiles(info_deployment,'ct77-652-12','date_max',175);
Mqc=remove_profiles(info_deployment,'ct77-652-12','Smin',33);
Mqc=remove_Sprofiles(info_deployment,'ct77-701-12','date_max',109);
Mqc=remove_profiles(info_deployment,'ct77-854-12','index',[68 308]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct77 = [
	1	0.00	0.07	0.00	0.08
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.14
	4	0.00	0.01	0.00	0.07
	5	0.00	0.00	0.00	0.00
	6	0.00	-0.05	-0.10	0.32
	7	0.00	0.00	0.00	0.11
	8	0.00	0.00	-0.08	0.01
	9	0.00	0.05	-0.16	0.05
	10	0.00	0.01	-0.10	0.06
	11	0.00	-0.01	0.00	0.02
	12	0.00	0.00	0.00	0.00
	13	0.00	-0.01	-0.17	0.24
	14	0.00	0.12	0.00	0.04
	15	0.00	-0.03	0.05	-.04
	16	0.00	0.02	0.00	0.04
	17	0.00	0.00	-0.05	0.05
	18	0.00	0.04	0.00	0.02
	19	0.00	0.00	-0.05	0.07
	20	0.00	0.00	0.05	0.08
	21	0.00	0.01	0.10	0.04
	22	0.00	-0.01	0.10	0.04
	23	0.00	0.00	0.00	0.07
	24	0.00	0.00	0.00	0.07
	25	0.00	0.00	0.00	0.09
    ];

temp_error=0.05;
psal_error=0.05;





