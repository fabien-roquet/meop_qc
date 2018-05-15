%% ct74RS
% 
% EXP='ct74RS';
% PI='Dan Costa';
% nomfic='ct74_ODV.txt';
% disp(EXP)

%% remove tags
% Mqc = remove_tag(info_deployment,list_tag(1).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(4).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(7).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(13).name(1:end-8));
% Mqc = remove_tag(info_deployment,list_tag(17).name(1:end-8));

Mqc = remove_tag(info_deployment,'ct74-698-11');
Mqc = remove_tag(info_deployment,'ct74-724-11');
Mqc = remove_tag(info_deployment,'ct74-795-11');

Mqc = remove_Sprofiles(info_deployment,'ct74-rb431-11','date_max',-1);
Mqc = remove_profiles (info_deployment,'ct74-710-11','date_max',200);
Mqc = remove_profiles (info_deployment,'ct74-720-11','date_max',150);
Mqc = remove_Sprofiles(info_deployment,'ct74-698r-11','Smin',32);
Mqc = remove_Sprofiles(info_deployment,'ct74-702-11','Smin',32);
Mqc = remove_Sprofiles(info_deployment,'ct74-709-11','Smin',33.1);
Mqc = remove_Sprofiles(info_deployment,'ct74-712-11','Smin',33.1);
Mqc = remove_Sprofiles(info_deployment,'ct74-712-11','P+S-',[600 34.6]);
Mqc = remove_Sprofiles(info_deployment,'ct74-722-11','Smin',33);
Mqc = remove_Sprofiles(info_deployment,'ct74-722-11','P+S-',[400 34.6]);
Mqc = remove_Sprofiles(info_deployment,'ct74-723-11','Smin',33);
Mqc = remove_Sprofiles(info_deployment,'ct74-724r-11','Smin',33);
Mqc = remove_Sprofiles(info_deployment,'ct74-724r-11','P+S-',[400 34.5]);
Mqc = remove_Sprofiles(info_deployment,'ct74-724r-11','P+S-',[700 34.7]);
Mqc = remove_Sprofiles(info_deployment,'ct74-795r-11','Smin',33);
Mqc = remove_Sprofiles(info_deployment,'ct74-795r-11','Smax',35);
Mqc = remove_Sprofiles(info_deployment,'ct74-rb426-11','Smin',33);
Mqc = remove_Sprofiles(info_deployment,'ct74-rb435-11','Smin',32);
list_tag = dir([info_deployment.dir,'*_prof.nc']);
for index=1:length(list_tag),
    Mqc = remove_profiles (info_deployment,list_tag(index).name(1:end-12),'Tmin',-2.2);
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct74 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.28
	3	0.00	0.00	0.00	0.66
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.72
	6	0.00	0.00	0.00	0.12
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.42
	9	0.00	0.00	0.00	-.02
	10	0.00	0.00	0.00	-.56
	11	0.00	0.00	0.00	0.18
	12	0.00	0.00	0.00	0.15
	13	0.00	0.00	0.00	0.00
	14	0.00	0.00	0.00	-.55
	15	0.00	0.00	0.00	0.56
	16	0.00	0.00	0.00	-.78
	17	0.00	0.00	0.00	0.00
	18	0.00	0.00	0.00	-.55
	19	0.00	0.00	0.00	-.01
	20	0.00	0.00	0.00	0.53
	21	0.00	0.00	0.00	0.00
	22	0.00	0.00	0.00	0.61
    ];

temp_error=0.05;
psal_error=0.05;





