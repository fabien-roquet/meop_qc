%% 

% EXP='ft01KI';
% PI='Christophe Guinet';
% disp(EXP)

%% remove tags
Mqc = remove_tag(info_deployment,'ft01-Fluoro1-07');


%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft01 =[
    1	   0	   0	0	 0
    2	   0	   -.03	.05	 .10
];

temp_error=0.05;
psal_error=0.05;




