%% ct107

%% remove tags
Mqc=remove_Sprofiles(info_deployment,'ct107-938-13','date_max',220);
Mqc=remove_Sprofiles(info_deployment,'ct107-941-13','date_max',160);
Mqc=remove_Sprofiles(info_deployment,'ct107-950-13','date_max',160);
Mqc=remove_Sprofiles(info_deployment,'ct107-950-13','date_max',200);

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ct107 = [
	1	0.00	0.00	0.00	-0.03
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.06
	4	0.00	0.00	0.00	-0.02
	5	0.00	0.00	0.00	0.09
	6	0.00	0.00	0.00	0.03
	7	0.00	0.00	0.00	-0.01
    8	0.00	0.00	0.00	0.03
	9	0.00	0.00	0.00	0.06
	10	0.00	0.00	0.00	0.07
	11	0.00	0.00	0.00	0.04
	12	0.00	0.00	0.00	0.00
	13	0.00	0.00	0.00	-0.02
	14	0.00	0.00	0.00	-0.01
    15	0.00	0.00	0.00	0.03
    ];


temp_error=0.05;
psal_error=0.05;