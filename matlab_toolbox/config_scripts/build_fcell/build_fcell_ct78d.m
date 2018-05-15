%% ct78DS


%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct78d-D408-11');
Mqc=remove_profiles(info_deployment,'ct78d-D704-11','date_max',98);
Mqc=remove_profiles(info_deployment,'ct78d-D351-11','index',644);
Mqc=remove_profiles(info_deployment,'ct78d-D398-11','index',710);
Mqc=remove_profiles(info_deployment,'ct78d-D400-11','index',746);
Mqc=remove_profiles(info_deployment,'ct78d-D487-11','index',207);
Mqc=remove_profiles(info_deployment,'ct78d-D484-11','index',425);
Mqc=remove_profiles(info_deployment,'ct78d-D496-11','index',208);
Mqc=remove_profiles(info_deployment,'ct78d-D761-11','index',28);



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct78d = [
	1	0.00	-0.01	0.00	0.05
	2	0.00	-0.01	0.00	0.07
	3	0.00	-0.05	0.06	0.12
	4	0.00	0.00	-.01	0.08
	5	0.00	0.00	0.11	0.02
	6	0.00	0.03	0.01	0.05
	7	0.00	-0.07	0.05	0.15
	8	0.00	0.00	0.00	0.03
	9	0.00	-0.36	-0.00	0.47
	10	0.00	0.03	-0.10	0.10
	11	0.00	0.06	0.00	0.00
	12	0.00	0.00	0.02	0.08
	13	0.00	-0.18	0.04	0.25
	14	0.00	-0.02	0.02	0.13
	15	0.00	-0.02	-0.04	0.04
	16	0.00	-0.02	0.02	0.11
	17	0.00	0.05	0.03	0.58
	18	0.00	-0.02	0.01	0.06
	19	0.00	-0.01	-.05	0.09
	20	0.00	0.03	0.09	0.12
	21	0.00	0.02	0.10	0.02
    ];

temp_error=0.05;
psal_error=0.05;



