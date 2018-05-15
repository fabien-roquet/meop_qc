%% ct88RS

% EXP='ct88RS';
% PI='Dan Costa';
% nomfic='ct88_ODV.txt';
% disp(EXP)

%% remove tags

Mqc = remove_tag(info_deployment,'ct88-698-12');
Mqc = remove_tag(info_deployment,'ct88-724-12');
Mqc = remove_profiles(info_deployment,'ct88-225-12','Pmax',850);
Mqc = remove_profiles(info_deployment,'ct88-225-12','Tmin',-2.1);
Mqc = remove_profiles(info_deployment,'ct88-225-12','Smin',33);
Mqc = remove_profiles(info_deployment,'ct88-225-12','Smax',34.4);
Mqc = remove_profiles(info_deployment,'ct88-226-12','date_max',170);
Mqc = remove_profiles(info_deployment,'ct88-226-12','Tmax',-0.2);
Mqc = remove_profiles(info_deployment,'ct88-226-12','Smin',32.5);
Mqc = remove_profiles(info_deployment,'ct88-227-12','date_max',70);
Mqc = remove_profiles(info_deployment,'ct88-227-12','Pmax',600);
Mqc = remove_profiles(info_deployment,'ct88-228-12','date_max',150);
Mqc = remove_profiles(info_deployment,'ct88-228-12','Smin',32.5);
Mqc = remove_profiles(info_deployment,'ct88-228-12','Tmin',-2.1);
Mqc = remove_profiles(info_deployment,'ct88-228-12','P+T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct88-229-12','date_max',70);
Mqc = remove_profiles(info_deployment,'ct88-229-12','Pmax',550);
Mqc = remove_profiles(info_deployment,'ct88-229-12','P-S+',[30 34.6]);
Mqc = remove_profiles(info_deployment,'ct88-230-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-230-12','P+T-',[50 -2.1]);
Mqc = remove_profiles(info_deployment,'ct88-230-12','Smin',33.6);
Mqc = remove_profiles(info_deployment,'ct88-230-12','Tmax',5);
Mqc = remove_profiles(info_deployment,'ct88-231-12','Tmax',5);
Mqc = remove_profiles(info_deployment,'ct88-231-12','Smin',33.5);
Mqc = remove_profiles(info_deployment,'ct88-231-12','Tmin',-2.2);
Mqc = remove_profiles(info_deployment,'ct88-232-12','date_max',75);
Mqc = remove_profiles(info_deployment,'ct88-232-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-232-12','Tmin',-2.2);
Mqc = remove_profiles(info_deployment,'ct88-233-12','date_max',155);
Mqc = remove_profiles(info_deployment,'ct88-233-12','Pmax',600);
Mqc = remove_profiles(info_deployment,'ct88-233-12','P+T-',[50 -2.1]);
Mqc = remove_profiles(info_deployment,'ct88-233-12','Tmax',5);
Mqc = remove_profiles(info_deployment,'ct88-233-12','P+S-',[380 35.4]);
Mqc = remove_profiles(info_deployment,'ct88-233-12','P+S-',[100 34]);
Mqc = remove_profiles(info_deployment,'ct88-234-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-234-12','Smin',32.5);
Mqc = remove_profiles(info_deployment,'ct88-234-12','P+T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct88-235-12','date_max',240);
Mqc = remove_profiles(info_deployment,'ct88-235-12','Tmax',0);
Mqc = remove_profiles(info_deployment,'ct88-235-12','Smin',32.5);
Mqc = remove_profiles(info_deployment,'ct88-235-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-235-12','P+T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct88-235-12','P+S-',[100 34.2]);
Mqc = remove_profiles(info_deployment,'ct88-240-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-240-12','Smin',33);
Mqc = remove_profiles(info_deployment,'ct88-240-12','Tmin',-2.2);
Mqc = remove_profiles(info_deployment,'ct88-240-12','P+T+',[300 -0.7]);
Mqc = remove_profiles(info_deployment,'ct88-243-12','Pmax',800);
Mqc = remove_profiles(info_deployment,'ct88-243-12','Smin',33);
Mqc = remove_profiles(info_deployment,'ct88-243-12','Tmin',-2.2);
Mqc = remove_profiles(info_deployment,'ct88-243-12','P+S-',[400 34]);
Mqc = remove_profiles(info_deployment,'ct88-243-12','P+T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct88-244-12','date_max',140);
Mqc = remove_profiles(info_deployment,'ct88-244-12','Pmax',600);
Mqc = remove_profiles(info_deployment,'ct88-244-12','Smin',33);
Mqc = remove_profiles(info_deployment,'ct88-244-12','Tmin',-2.2);
Mqc = remove_profiles(info_deployment,'ct88-247-12','date_max',80);
Mqc = remove_profiles(info_deployment,'ct88-247-12','Pmax',600);
Mqc = remove_profiles(info_deployment,'ct88-247-12','Tmin',-2.1);
Mqc = remove_profiles(info_deployment,'ct88-258-12','date_max',125);
Mqc = remove_profiles(info_deployment,'ct88-258-12','Smin',33.1);
Mqc = remove_profiles(info_deployment,'ct88-258-12','P+S-',[400 34.8]);
Mqc = remove_profiles(info_deployment,'ct88-258-12','P+T-',[50 -2]);
Mqc = remove_profiles(info_deployment,'ct88-258-12','P+T+',[500 -1.5]);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct88 = [
	1	0.00	0.00	0.00	-.40
	2	0.00	0.00	0.00	 .25
	3	0.00	0.00	0.00	 .3
	4	0.00	0.00	0.00	 .4
	5	0.00	0.00	0.00	 .4
	6	0.00	0.00	0.00	 .7
	7	0.00	0.00	0.00	0.4
	8	0.00	0.00	0.00	0.4
	9	0.00	0.00	0.00	0.7
	10	0.00	0.00	0.00	1.2
	11	0.00	0.00	0.00	.2
	12	0.00	0.00	0.00	0.6
	13	0.00	0.00	0.00	.2
	14	0.00	0.00	0.00	.0
	15	0.00	0.00	0.00	.2
	16	0.00	0.00	0.00	.4
	17	0.00	0.00	0.00	0.00
	18	0.00	0.00	0.00	0.00
	19	0.00	0.00	0.00	0.5
    ];

temp_error=0.1;
psal_error=0.2;


