%% wd04
% EXP='wd4';
% PI='Mark Hindell';

%% remove tags
Mqc = remove_tag( info_deployment , 'wd04-882-11');
Mqc = remove_profiles( info_deployment , 'wd04-883-11' , 'Tmin', -2.2 );
Mqc = remove_profiles( info_deployment , 'wd04-884-11' , 'Tmin', -2.2 );
Mqc = remove_profiles( info_deployment , 'wd04-898-11' , 'Tmin', -2.1 );
Mqc = remove_profiles( info_deployment , 'wd04-907-11' , 'Tmin', -2.1 );
Mqc = remove_profiles( info_deployment , 'wd04-908-11' , 'Tmin', -2.1 );
Mqc = remove_profiles( info_deployment , 'wd04-911-11' , 'Tmin', -1.3 );

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.wd04 = [
	1	0.00	0.01	0.00	0.00
	2	0.00	-0.07	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.26	0.00	0.00
	5	0.00	0.26	0.00	0.00
	6	0.00	1.78	0.00	0.00
	7	0.00	-0.08	0.00	0.00
	8	0.00	0.15	0.00	0.00
	9	0.00	0.02	0.00	0.00
	10	0.00	0.03	0.00	0.00
	11	0.00	0.06	0.00	0.00
	12	0.00	0.06	0.00	0.00
	13	0.00	-0.60	0.00	0.00
	14	0.00	0.4 	0.00	0.00
	15	0.00	0.4 	0.00	0.00
	16	0.00	0.00	0.00	0.00
	17	0.00	0.10	0.00	0.00
	18	0.00	0.06	0.00	0.00
	19	0.00	0.8 	0.00	0.00
    ];

temp_error=0.1;
psal_error=0.1;




