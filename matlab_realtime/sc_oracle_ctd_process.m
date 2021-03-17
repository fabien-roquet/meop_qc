%% set up environment
cd("/Users/roquet/GitHub/meop_qc/matlab_realtime")
conf.matlabdir = '../matlab_toolbox/';
p=genpath(conf.matlabdir);
Ibeg=[1 strfind(p,':')+1]; Ibeg(end)=[];
Iend=[strfind(p,':')-1];
if length(Ibeg),
    p2=[];
    for ii=1:length(Ibeg),
        name=p(Ibeg(ii):Iend(ii));
        if ~length(strfind(name,'/.AppleDouble'))
            p2=[p2 ':' name ];
        end
    end
    p2(1)=[]; p2(end+1)=':';
end
addpath(p2)

conf = init_mirounga_realtime;


%% load data
data = load("Recent_CTD_Casts_20191004173731.mat");
data = data.recent_ctd_table;
data.smru_name = data.GREF;
for k=1:length(data.smru_name),
    data.smru_name{k} = sprintf('%s-%s-%02d',data.GREF{k},data.NAME{k},...
        data.YEAR(k)-fix(data.YEAR(k)/100)*100);
end
data = data(~isnan(data.LAT.*data.LON.*data.N_TEMP),:);
list_smru_name = unique(data.smru_name);

%% 

for ktag = 1:length(list_smru_name),
    
    one_smru_name = list_smru_name{ktag};
    EXP = EXP_from_smru_name(one_smru_name);
    info_deployment=load_info_deployment(conf,EXP,one_smru_name);
    Iprof = find( strcmp(one_smru_name,data.smru_name) );
    table = data(Iprof,:);
    
    create_ncargo_realtime(conf,EXP,one_smru_name,table);
    update_metadata(conf,EXP,one_smru_name);
    apply_adjustments(conf,EXP,one_smru_name);
    apply_tlc(conf,EXP,one_smru_name);
    
    do_figure='on';
    plot_conf=[];
    if ~any(strcmp(conf.table_param.Properties.RowNames,EXP)),
        plot_conf.temp_error=0.1;
        plot_conf.psal_error=0.2;
    else
        for field = conf.table_param.Properties.VariableNames
            plot_conf = setfield(plot_conf,field{1},conf.table_param{EXP,field{1}});
        end
    end
    suffix = '_lr0'; mode = 'raw'; sc_plot_data_tags;
    suffix = '_hr1'; mode = 'adj'; sc_plot_data_tags;
    
    nameprof = [info_deployment.dir one_smru_name '_hr1_prof.nc'];
    if exist(nameprof,'file')
        Mqc = ARGO_load_qc(nameprof,1);
        for kk=1:length(Iprof),
            data_adj(Iprof(kk)).smru_code = one_smru_name;
            data_adj(Iprof(kk)).PRES_ADJ = Mqc.PRES(:,kk);
            data_adj(Iprof(kk)).TEMP_ADJ = Mqc.TEMP(:,kk);
            data_adj(Iprof(kk)).PSAL_ADJ = Mqc.PSAL(:,kk);
        end
    end
    
end



