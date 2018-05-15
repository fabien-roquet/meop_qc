%% ct14

% EXP='AntP06';
% PI='Dan Costa';
% disp(EXP)


%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct14-105-06','P-S+',[20 34.35]);
Mqc=remove_Sprofiles(info_deployment,'ct14-111-06','P-S+',[20 34.5]);
Mqc=remove_tag(info_deployment,'ct14-113-06');
Mqc=remove_tag(info_deployment,'ct14-116-06');
Mqc=remove_tag(info_deployment,'ct14-117-06');
Mqc=remove_Sprofiles(info_deployment,'ct14-118-06');
Mqc=remove_tag(info_deployment,'ct14-177-06');

%% apply corrections
list_tag = dir([info_deployment.dir '*.nc']);
sc_init_corrections;

calib_coeff.ct14 = [
	 1	   0	   0	   0	-0.1
	 2	   0	   0	   0	 0.2
	 3	   0	   0	   0	 0.1
	 4	   0	   0	   0	0.12
	 5	   0	   0	   0	-0.05
	 6	   0	   0	   0	-.01
	 7	   0	   0	   0	 NaN
	 8	   0	   0	   0	 NaN
     9	0.00	0.00	0.00	-0.50
	10	0.00	0.00	0.00	0.00
	11	0.00	0.00	0.04	0.00
	12	0.00	0.00	0.00	0.00
    ];


temp_error=0.2;
psal_error=0.2;
