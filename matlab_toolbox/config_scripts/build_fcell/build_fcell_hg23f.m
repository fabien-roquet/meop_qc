%% ct77CS

% EXP='hg23fB';
% PI='Olle Karlsson';
% nomfic='hg23f_ODV.txt';


%% remove tags



%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.hg23f = zeros (length(list_tag),5);

temp_error=0.05;
psal_error=0.05;


