%% ct43WS

% EXP='ct43WS';
% PI='Lars Boehme';
% nomfic='ct43_ODV.txt';
% disp(EXP)

%% remove tags

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct43 = [
	1	0.00	0.00	0.00	0.02
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.10
	5	0.00	-.10	0.00	0.20
	6	0.00	-.15	0.00	0.15
	7	0.00	0.05	0.00	0.10
	8	0.00	0.00	0.00	0.03
	9	0.00	-.05	0.00	0.15
    ];

temp_error=0.05;
psal_error=0.1;




