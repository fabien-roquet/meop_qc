%% create an empty table of correction coefficients

EXP = info_deployment.EXP;
list_tag = dir([info_deployment.dir,'*_lr0_prof.nc']);
aux=[(1:length(list_tag))' (1:length(list_tag))'*zeros(1,4)];
setfield(calib_coeff,EXP,aux);
temp_error=0.1; psal_error=0.2;
minT=-3; maxT=32; minS= 4; maxS=40;
min_Nprof= 30;
