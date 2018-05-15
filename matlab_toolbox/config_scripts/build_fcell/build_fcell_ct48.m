%% ct48
% 
% EXP='ct48AP';
% PI='Dan Costa';
% nomfic='ct48_ODV.txt';
% disp(EXP)
% 
% %% load data in odv format, convert into fcell and then write ARGOcdf file
% sc_load_odv2prof;

%% remove tags
list_tag = dir([info_deployment.dir,'*_prof.nc']);
Mqc=remove_tag(info_deployment,'ct48-060x-09');
Mqc=remove_tag(info_deployment,'ct48-059-09');
%Mqc=remove_Sprofiles(info_deployment,'ct48-059-09','date_max',10);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','P-S+',[20 34.5]);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','Smin',33.5);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','P+S-',[200 33.8]);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','P+T-',[800 -1]);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','P+T+',[100 4]);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','P+T-',[200 -1]);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','Smax',35);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-060-09','Tmax',6);
[Mqc,nn]=remove_profiles(info_deployment,'ct48-576b-09','date_max',110);
for ii=1:length(list_tag)
   Mqc=remove_profiles(info_deployment,list_tag(ii).name(1:end-12),'lat_min',-20);   
end


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct48 = [
	 1	   0	   0	   0	 0.1
	 2	   0	   0	   .05	 .05
	 3	   0	   0	   .02	 0.11
	 4	   0	   0	   0	-.04
	 5	   0	   0	   .03	0.13
	 6	   0	   0	   0	  .12
	 7	   0	   0	   .02	0.2
	 8	   0	   0	   0	0.05
	 9	   0	   0	   0	 .05
	10	   0	   0	   0	   0
	11	   0	   0	   0	   0
	12	   0	   0	   0	   0
	13	   0	   0	   .05	 .02
	14	   0	   0	   0	  .01
	15	   0	   0	   0	0.03
    ];



temp_error=0.05;
psal_error=0.05;
minT=-3; maxT=15; minS=4; maxS=40; min_Nprof=30;

