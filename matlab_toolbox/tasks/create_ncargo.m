function create_ncargo(conf,EXP,smru_name)

info_deployment=load_info_deployment(conf,EXP,smru_name);

% don't process it if no raw odv file
if ~exist([conf.rawdir info_deployment.nomfic]),
    error(sprintf('%s: no raw file. not processed.',EXP));
end

if ~exist('smru_name','var') % all tags from EXP deployment
    smru_name = info_deployment.list_smru_name;
    disp(['(1)' EXP])
    delete([conf.logdir 'diary_' EXP '.txt'])
    diary([conf.logdir 'diary_' EXP '.txt'])
else  % tag smru_tag only
    disp(['(1)' smru_name])
    diary([conf.logdir 'diary_' EXP '.txt'])
end

% add deployment

%   1) create directory
[s,mess,messid] = mkdir([conf.datadir,info_deployment.NATION,'/',info_deployment.EXP]);

%   2) create ncARGO file lr0
if ismember(info_deployment.EXP,{'ct3','ct7','ct11','wd3'})
    sc_load_KERold2prof;
else
    sc_load_odv2prof;
end

%   3) init corrections/load adjustment coefficients
info_deployment=load_info_deployment(conf,EXP,smru_name);
list_tag = info_deployment.list_smru_name;

if ~any(startsWith(conf.table_coeff.Properties.RowNames,EXP)),
    
    for ktag = 1:length(list_tag),
        conf.table_coeff{list_tag{ktag},:}=zeros(1,6);
    end
    name_file=[conf.csv_config 'table_coeff.csv'];
    writetable(conf.table_coeff,name_file,'WriteRowNames',1,'Delimiter',',');
    
end

if ~any(strcmp(conf.table_param.Properties.RowNames,EXP)),
    
    temp_error=0.1; psal_error=0.2; minT=-3; maxT=32; minS= 4; maxS=40; min_Nprof= 30;
    conf.table_param(EXP,:)={temp_error psal_error minT maxT minS maxS min_Nprof [NaN NaN NaN NaN] [NaN NaN] [NaN NaN] 1000 200 0 [] []};
    name_file=[conf.csv_config 'table_param.csv'];
    writetable(conf.table_param,name_file,'WriteRowNames',1,'Delimiter',',');
    
end

%   4) apply filters
for ktag=1:length(info_deployment.list_smru_name),
    
    smru_name = info_deployment.list_smru_name{ktag};
    
    suffix = '_lr0';
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
    Mqc=ARGO_load_qc(name_prof,0);
    Mqc.PRES_QC(Mqc.PRES_QC==0) = 1;
    Mqc.TEMP_QC(Mqc.TEMP_QC==0) = 1;
    Mqc.PSAL_QC(Mqc.PSAL_QC==0) = 1;
    if isfield(Mqc,'CHLA_QC'), Mqc.CHLA_QC(Mqc.CHLA_QC==0) = 1; end
    if isfield(Mqc,'DOXY_QC'), Mqc.DOXY_QC(Mqc.DOXY_QC==0) = 1; end
    if isfield(Mqc,'LIGHT_QC'), Mqc.LIGHT_QC(Mqc.LIGHT_QC==0) = 1; end
    
    ARGO_save_qc(name_prof,Mqc,0);
    sc_filtre_seals_qc;
    sc_write_global_attribute;
    
    if conf.table_coeff{smru_name,'remove'},
        Mqc=remove_tag(info_deployment,smru_name);
    end
    
    if conf.table_coeff{smru_name,'Sremove'},
        Mqc=remove_Sprofiles(info_deployment,smru_name);
    end
    
    filters1=[];
    if any(strcmp(EXP, conf.table_filter.smru_platform_name)),
        filters1 = conf.table_filter(strcmp(EXP, conf.table_filter.smru_platform_name),:);
    end
    
    filters2=[];
    if any(strcmp(smru_name, conf.table_filter.smru_platform_name)),
        filters2 = conf.table_filter(strcmp(smru_name, conf.table_filter.smru_platform_name),:);
    end
    
    filters = [filters1; filters2];
    if ~isempty(filters),
        for kk=1:length(filters.smru_platform_name),
            if filters{kk,'Sonly'},
                Mqc=remove_Sprofiles(info_deployment,smru_name,...
                    filters{kk,'filter'}{1},filters{kk,{'x1','x2'}});
            else
                Mqc=remove_profiles(info_deployment,smru_name,...
                    filters{kk,'filter'}{1},filters{kk,{'x1','x2'}});
            end
        end
    end
    
end

%   5) create ncARGO file hr0
sc_create_hr0;

diary off

