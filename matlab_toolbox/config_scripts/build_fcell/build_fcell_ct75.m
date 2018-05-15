%% ct79CI

% EXP='ct75DD';
% PI='JB Charrassin';
% nomfic='ct75_ODV.txt';
% disp(EXP)

%% remove tags

Mqc = remove_tag( info_deployment, 'ct75-048-11');
Mqc = remove_tag( info_deployment,'ct75-056-11');
Mqc = remove_Sprofiles( info_deployment , 'ct75-030-11' ,'Smin', 34 );
Mqc = remove_Sprofiles( info_deployment , 'ct75-839-11' ,'Smin', 34 );

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct75 = [
	1	0.00	0.00	0.00	0.10
	2	0.00	0.00	0.00	0.10
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.15
	6	0.00	0.00	0.00	-.10
	7	0.00	0.00	0.00	0.07
    ];

temp_error=0.05;
psal_error=0.2;


