%% ct58SG

% EXP='ct58SG';
% PI='Mike Fedak';
% nomfic='ct58_ODV.txt';
% disp(EXP)

Mqc=remove_Sprofiles(info_deployment,'ct58-10440-09');
Mqc=remove_Sprofiles(info_deployment,'ct58-10446-09');
Mqc=remove_Sprofiles(info_deployment,'ct58-11315-09');

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;


calib_coeff.ct58 = [
	 1	   0	   0	   0	 NaN
	 2	   0	   0	   0	 NaN
	 3	   0	   0	   0	-0.09
	 4	   0	   0	 .05	0.05
	 5	   0	   0	   0	  -0
	 6	   0	   0	   0	 0.2
	 7	   0	   0	   0	0.25
	 8	   0	   0	   0	 NaN
	 9	   0	   0	   0	0.05
	10	   0	   0	   0	0.10
	11	   0	   0	   0	 0.1
	12	   0	   0	   0	0.05
	13	   0	   0	   0	0.10
    ];


temp_error=0.05;
psal_error=0.05;

