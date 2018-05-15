%% AntP08
% 
% EXP='AntP08';
% PI='Dan Costa';
% disp(EXP)

%% remove tags
list_tag = dir([info_deployment.dir,'*_prof.nc']);
Mqc=remove_Sprofiles(info_deployment,'ct37-757-08','P-T+',[20 4]);
Mqc=remove_profiles(info_deployment,'ct37-619-08','index',[753:754]);
Mqc=remove_profiles(info_deployment,'ct37-620-08','index',816);
Mqc=remove_profiles(info_deployment,'ct37-621-08','index',162);



%% apply corrections

list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct37 = [
	 1	   0	   0	   .05	0.05
	 2	   0	   0	   .05	0.06
	 3	   0	   0	   0	0.08
	 4	   0	   0	   .04	  .03
	 5	   0	   0	   .02	0.04
	 6	   0	   0	   .02	0.07
	 7	   0	   0	   .05	0.08
	 8	   0	   0	   -.02	-.05
	 9	   0	   0	   .05	-.02
	10	   0	   0	   -.03	 .02
	11	   0	   0	   .08	0.03
	12	   0	   0	   0	0
    ];
salinity_offset.ct3709 = [1 100 200 0; .09 .09 0 0];

temp_error=0.05;
psal_error=0.05;

