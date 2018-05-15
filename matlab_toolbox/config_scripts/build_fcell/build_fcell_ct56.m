%% ct56EI

% EXP='ct56EI';
% PI='Monica Muelbert';
% nomfic='ct56_ODV.txt';
% disp(EXP)
% 
% %% remove tags


list_tag = info_deployment.list_tag;
Mqc=remove_tag(info_deployment,'ct56-M838-10');
Mqc=remove_Sprofiles(info_deployment,'ct56-M798-10');
Mqc=remove_profiles(info_deployment,'ct56-M798-10','Pmax',800);
Mqc=remove_Sprofiles(info_deployment,'ct56-R021-10');
for ii=1:length(list_tag)
   Mqc=remove_profiles(info_deployment,list_tag(ii).name(1:end-12),'lat_min',-20);   
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct56 = [
	 1	   0	   0	   0	0
	 2	   0	   0	   0	 0
	 3	   0	   0	   0	 0
	 4	   0	   0	   0	0.03
	 5	   0	   0	   0	 0
	 6	   0	   0	   0	 -.03
	 7	   0	   0	   .05	0.12
	 8	   0	   0	   .03	0.05
    ];


temp_error=0.05;
psal_error=0.05;



