%% ct70WS

% EXP='ct70WS';
% PI='Lars Boehme';
% nomfic='ct70_ODV.txt';
% disp(EXP)

%% remove tags
Mqc=remove_profiles(info_deployment,'ct70-501-11','Pmax',700);
Mqc=remove_Sprofiles(info_deployment,'ct70-503-11','date_max',50);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct70 = [
	1	0.00	0.04	0.00	-.02
	2	0.00	0.00	0.00	0.1
	3	0.00	0.00	0.00	0.02
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.05
	7	0.00	-.05	0.00	0.15
	8	0.00	0.00	0.00	0.10
	9	0.00	0.05	0.00	0.15
	10	0.00	0.00	0.00	0.10
	11	0.00	-.15	0.00	0.25
	12	0.00	0.00	0.00	0.05
	13	0.00	0.00	0.00	0.10
	14	0.00	0.00	0.00	0.05
	15	0.00	0.00	0.00	0.15
	16	0.00	0.00	0.00	0.10
	17	0.00	0.00	0.00	0.10
	18	0.00	0.00	0.00	0.03
	19	0.00	0.00	0.00	0.08
    ];


temp_error=0.05;
psal_error=0.1;




