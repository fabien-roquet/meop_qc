%% hg23

% EXP='hg23BS';
% PI='Olle Karlsson';
% nomfic='hg23_ODV.txt';
% disp(EXP)
% 
%% remove tags



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.hg23 = zeros (length(list_tag),5);

temp_error=0.05;
psal_error=0.05;


