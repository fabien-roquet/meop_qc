%% remove tags

list_tag = {info_deployment.list_tag.name};
for kk=1:length(list_tag),
    Mqc=remove_Sprofiles(info_deployment,list_tag{kk}(1:end-8));
end

%% apply corrections
list_tag = dir([info_deployment.dir,'*_prof.nc']);
sc_init_corrections;

calib_coeff.ft17 = [
	1	0.00	0.00	0.00	0.00
	2	0.00	0.00	0.00	0.00
	3	0.00	0.00	0.00	0.00
	4	0.00	0.00	0.00	0.00
	5	0.00	0.00	0.00	0.00
	6	0.00	0.00	0.00	0.00
	7	0.00	0.00	0.00	0.00
	8	0.00	0.00	0.00	0.00
	9	0.00	0.00	0.00	0.00
	10	0.00	0.00	0.00	0.00
	11	0.00	0.00	0.00	0.00
	12	0.00	0.00	0.00	0.00
	13	0.00	0.00	0.00	0.00
	14	0.00	0.00	0.00	0.00
	15	0.00	0.00	0.00	0.00
	16	0.00	0.00	0.00	0.00
	17	0.00	0.00	0.00	0.00
	18	0.00	0.00	0.00	0.00
	19	0.00	0.00	0.00	0.00
    ];

temp_error=0.05;
psal_error=0.2;

minT=10; maxT=40; minS=0; maxS=40; min_Nprof=30;

