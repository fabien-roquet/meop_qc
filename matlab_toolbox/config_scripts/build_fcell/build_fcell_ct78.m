%% ct78DS

%% remove tags

Mqc = remove_tag(info_deployment,'ct78-471-12');
Mqc = remove_tag(info_deployment,'ct78-878-12');
Mqc = remove_tag(info_deployment,'ct78-879-12');
Mqc = remove_Sprofiles(info_deployment,'ct78-460-12');
Mqc = remove_Sprofiles(info_deployment,'ct78-758-12');
Mqc = remove_Sprofiles(info_deployment,'ct78-820-12');
Mqc=remove_profiles(info_deployment,'ct78-700-12','index',[366 575 652 667]);
Mqc=remove_profiles(info_deployment,'ct78-820-12','index',[828]);
Mqc=remove_profiles(info_deployment,'ct78-829-12','index',[676 745]);
Mqc=remove_profiles(info_deployment,'ct78-875-12','index',[8]);
Mqc=remove_Sprofiles(info_deployment,'ct78-875-12','index',[59 62 68]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct78 = [
	1	0.00	-0.01	0.02	0.06
	2	0.00	0.30	-0.19	0.04
	3	0.00	0.02	0.01	-0.05
	4	0.00	-0.24	-0.08	0.28
	5	0.00	-0.15	0.01	0.23
	6	0.00	0.00	0.00	0.00
	7	0.00	-0.03	0.00	0.07
	8	0.00	0.04	0.00	0.03
	9	0.00	0.10	-0.24	0.12
	10	0.00	0.01	0.00	0.13
	11	0.00	-0.01	0.11	0.10
	12	0.00	0.01	0.01	0.07
	13	0.00	0.00	0.00	0.06
	14	0.00	-0.01	0.02	0.10
	15	0.00	-0.01	0.11	0.01
	16	0.00	-0.02	0.00	0.05
	17	0.00	0.01	-0.00	0.11
	18	0.00	-0.02	0.00	-0.02
	19	0.00	-0.02	-0.01	0.16
	20	0.00	-0.02	0.06	0.06
	21	0.00	0.01	0.00	0.03
	22	0.00	0.00	0.00	0.00
	23	0.00	0.00	0.00	0.00
	24	0.00	0.00	0.00	0.09
    ];

temp_error=0.05;
psal_error=0.05;



