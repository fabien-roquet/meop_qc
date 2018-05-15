%% ct63RS

% EXP='ct63RS';
% PI='Dan Costa';
% nomfic='ct63_ODV.txt';
% disp(EXP)

%% remove tags
% Mqc = remove_tag(info_deployment,list_tag(2).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(4).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(6).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(9).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(12).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(13).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(21).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(26).name(1:end-8));

Mqc = remove_tag(info_deployment,'ct63-426-10');
Mqc = remove_tag(info_deployment,'ct63-427-10');
Mqc = remove_tag(info_deployment,'ct63-428-10');
Mqc = remove_tag(info_deployment,'ct63-431-10');
Mqc = remove_tag(info_deployment,'ct63-435-10');

Mqc = remove_Sprofiles(info_deployment,'ct63-G381-10','date_max',-1);
Mqc = remove_Sprofiles(info_deployment,'ct63-rf111-10','date_max',-1);

Mqc = remove_profiles(info_deployment,'ct63-430-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P-T+',[200 0]);
Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P+T-',[400 -2]);
Mqc = remove_profiles(info_deployment,'ct63-433-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-433-10','P+T+',[300 -.9]);
Mqc = remove_profiles(info_deployment,'ct63-435rec-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-444-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-445-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-446-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-448-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-G381-10','P-T-',[50 -1.9]);
Mqc = remove_profiles(info_deployment,'ct63-rf577-10','P-T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct63-rf795-10','Tmin',-2);
Mqc = remove_profiles(info_deployment,'ct63-rf795-10','Pmax',900);

Mqc = remove_profiles(info_deployment,'ct63-448-10','date_max',147);
Mqc = remove_profiles(info_deployment,'ct63-458-10','date_max',150);

Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P+S-',[50,33.5]);
Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P+S-',[200,34.3]);
Mqc = remove_profiles(info_deployment,'ct63-431rec-10','P+S-',[190,34]);
Mqc = remove_profiles(info_deployment,'ct63-433-10','Smin',33);
Mqc = remove_profiles(info_deployment,'ct63-435rec-10','Smin',33);
Mqc = remove_profiles(info_deployment,'ct63-444-10','P+S-',[500 34.5]);
Mqc = remove_profiles(info_deployment,'ct63-448-10','Smin',32.5);
Mqc = remove_profiles(info_deployment,'ct63-458-10','Smin',33.1);
Mqc = remove_profiles(info_deployment,'ct63-458-10','P+S-',[40 33.5]);


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct63 = [
	1	0.00	0.08	0.00	0.10
	2	0.00	0.00	0.00	0.00
	3	0.00	-.01	0.00	0.02
	4	0.00	0.00	0.00	0.00
	5	0.00	-.06	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	-.01	0.00	0.36
	8	0.00	-.03	0.00	0.30
	9	0.00	0.00	0.00	0.00
	10	0.00	-.20	0.00	0.54
	11	0.00	0.00	0.00	0.42
	12	0.00	0.00	0.00	0.00
	13	0.00	0.00	0.00	0.00
	14	0.00	-.12	0.00	0.17
	15	0.00	-.01	0.00	-.80
	16	0.00	-.03	0.00	1.01
	17	0.00	-.16	0.00	0.39
	18	0.00	-.01	0.00	0.00
	19	0.00	-.19	0.00	0.09
	20	0.00	-.09	0.00	0.09
	21	0.00	0.00	0.00	0.00
	22	0.00	0.00	0.00	0.00
	23	0.00	0.00	0.00	0.21
	24	0.00	-.11	0.00	0.00
	25	0.00	0.01	0.00	0.03
	26	0.00	0.00	0.00	0.00
	27	0.00	-.01	0.00	0.02
    ];

temp_error=0.05;
psal_error=0.05;








