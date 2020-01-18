function conf = init_mirounga()


%% initialization of the mirounga processing system
d = jsondecode(fileread('configs.json'));
if isempty(d.config),
    if ispc, name = getenv('COMPUTERNAME');
    elseif ismac, name = [getenv('USER') '_mac'];
    else name = [getenv('USER') '_linux'];
    end
    d.config = strtrim(lower(name));
    d.config = strrep(d.config,'.','_');    
end
try
    conf = getfield(d.configs,d.config);
catch
    error([d.config ' is not a supported config. modify configs.json']);
end
conf.version     = d.version.CTDnew;
conf.version_old = d.version.CTDold;
conf.version_SMS = d.version.SMSnew;
addpath(genpath(conf.matlabdir))

d = jsondecode(fileread('config_processing.json'));
tasks = fieldnames(d.tasks);
for kk=1:length(tasks),
    conf = setfield(conf,tasks{kk},getfield(d.tasks,tasks{kk}));
end
conf.selection   = d.selection;
conf.list_tasks  = d.list_tasks;

d = jsondecode(fileread('config_diags.json'));
tasks = fieldnames(d.tasks_diags);
for kk=1:length(tasks),
    conf = setfield(conf,tasks{kk},getfield(d.tasks_diags,tasks{kk}));
end
conf.selection_diags      = d.selection_diags;

%%

conf.locdir          = [conf.rawdir 'original_cls_locations/'];
conf.rawdir_hr       = [conf.rawdir 'original_hr_datasets/'];

conf.datadir         = [conf.processdir 'final_dataset_prof/'];
conf.mapsdir         = [conf.processdir 'maps/'];
conf.texdir          = [conf.processdir 'doc_latex/'];
conf.plotdir         = [conf.processdir 'plots/'];
conf.calibplotdir    = [conf.processdir 'calibration_plots/'];

conf.json            = [conf.matlabdir 'config_files/'];
conf.csv_config      = [conf.matlabdir 'config_files/'];

conf.temporary       = [conf.processdir 'temporary/'];
conf.temporary_tex   = [conf.processdir 'temporary/tex/'];
conf.temporary_fcell = [conf.processdir 'temporary/fcell/'];

%%
[s,mess,messid] = mkdir(conf.datadir);
[s,mess,messid] = mkdir(conf.mapsdir);
[s,mess,messid] = mkdir([conf.mapsdir 'deployments']);
[s,mess,messid] = mkdir([conf.mapsdir 'groups']);
[s,mess,messid] = mkdir([conf.mapsdir 'global']);
[s,mess,messid] = mkdir(conf.texdir);
[s,mess,messid] = mkdir(conf.plotdir);
[s,mess,messid] = mkdir(conf.calibplotdir);
[s,mess,messid] = mkdir(conf.matlabdir);
[s,mess,messid] = mkdir(conf.temporary);
[s,mess,messid] = mkdir(conf.temporary_tex);
[s,mess,messid] = mkdir(conf.temporary_fcell);


%% read list deployment

name_list=[conf.csv_config 'list_deployment.csv'];
if ~exist(name_list,'file')
    disp('WARNING: the file list_deployment.csv was not found!')
    disp(['path: ' name_list])
    return
end
list_deployment = readtable(name_list,'ReadRowNames',1,'Delimiter',',');
list_deployment_code = list_deployment.deployment_code;

% remove old repeated deployments
for depl = {'ct10r','ct12r','ct17r'},
    if any(strcmp(depl{1},list_deployment_code)),
        list_deployment(depl,:)=[];
    end
end

conf.list_deployment = list_deployment;
conf.list_deployment_code = list_deployment.deployment_code;


%% pre-process old deployments (done once and for all)
if 1==0,
    preprocessing_old_deployments;
end

%% load deployment information
name_json = [conf.json 'deployment2.json'];
filetext = fileread(name_json);
deployment_json = jsondecode(filetext);

name_json = [conf.json 'deployment2_patch.json'];
filetext = fileread(name_json);
deployment_patch_json = jsondecode(filetext);
deployment_code_json={deployment_json(:).deployment_code};
deployment_code_patch_json={deployment_patch_json(:).deployment_code};
for kk=1:length(deployment_code_patch_json),
    if ~ismember(deployment_code_patch_json{kk},deployment_code_json)
        deployment_json=[deployment_json;deployment_patch_json(kk)];
    end
end

% for ii=1:length(deployment_json)
%     if ~any(strcmp(deployment_json(ii).deployment_code,conf.list_deployment.deployment_code)),
%         disp(sprintf('%s must be added in list_deployment.csv',deployment_json(ii).deployment_code));
%     end
% end

conf.deployment_json = deployment_json;
conf.list_deployment_json = {deployment_json(:).deployment_code};


%% load platform information
name_json = [conf.json 'platform2.json'];
filetext = fileread(name_json);
platform_json = jsondecode(filetext);
deployment_code_json=unique({platform_json(:).deployment_code});

name_json = [conf.json 'platform2_patch.json'];
filetext = fileread(name_json);
platform_patch_json = jsondecode(filetext);
for kk=1:length(platform_patch_json),
    if ismember(platform_patch_json(kk).deployment_code,conf.list_deployment_code) ...
            && ~ismember(platform_patch_json(kk).deployment_code,deployment_code_json),
        platform_json=[platform_json;platform_patch_json(kk)];
    end
end

conf.platform_json = platform_json;
conf.list_smru_platform_code = {conf.platform_json(:).smru_platform_code};


%% add platform information based on deployment.json
for kk=1:length(conf.platform_json),
    deployment_code = conf.platform_json(kk).deployment_code;
    I = find(strcmp(deployment_code,conf.list_deployment_json));
    if I,
        conf.platform_json(kk).description = conf.deployment_json(I).description;
        conf.platform_json(kk).gts = conf.deployment_json(I).gts;
    else
        conf.platform_json(kk).description ='';
        conf.platform_json(kk).gts ='';
    end
end


%% build group list
conf.list_group=unique(conf.list_deployment.country);
conf.list_color= linspecer(length(conf.list_group));
conf.Itag_group={};
for kk=1:length(conf.list_group),
    conf.Itag_group{kk}=find(strcmp(conf.list_group{kk},conf.list_deployment.country));
end


%% conf.start_date for each deployment
aux = {conf.platform_json.deployment_code;
    conf.platform_json.time_coverage_start;
    conf.platform_json.time_coverage_end};
for kEXP = 1:length(conf.list_deployment_code),
    EXP = conf.list_deployment_code{kEXP};
    I = find(strcmp(aux(1,:),EXP));
    if I & isempty(conf.list_deployment{EXP,'end_date'}),
        if aux{2,I(1)}, conf.list_deployment{EXP,'start_date'} = {aux{2,I(1)}(1:10)}; end
        if aux{3,I(1)}, conf.list_deployment{EXP,'end_date'}   = {aux{3,I(1)}(1:10)}; end
    end
end

% trim pi_code
pi_code = conf.list_deployment.pi_code;
for kk = 1:length(pi_code),
    pi_code{kk} = strtrim(pi_code{kk});
end
conf.list_deployment.pi_code = pi_code;

name_list=[conf.csv_config 'list_deployment.csv'];
writetable(conf.list_deployment,name_list,'WriteRowNames',1,'Delimiter',',');

% add jul_date of start_date
date = conf.list_deployment.start_date;
juldate = zeros(size(date));
for kk = 1:length(juldate),
    if ~isempty(date(kk)), juldate(kk) = datenum(date(kk)); end
end
conf.list_deployment.start_date_jul = juldate;


%% read list deployment CTD HR
name_list=[conf.csv_config 'list_deployment_hr.csv'];
if ~exist(name_list,'file')
    disp('WARNING: the file list_deployment_hr.csv was not found!')
    disp(['path: ' name_list])
    conf.list_deployment_hr = [];
else
    conf.list_deployment_hr = readtable(name_list,'ReadRowNames',1,'Delimiter',',');
end
conf.list_deployment_hr = readtable([conf.csv_config 'list_deployment_hr.csv'],'ReadRowNames',1,'Delimiter',',');
conf.hr_smru_name = conf.list_deployment_hr.smru_platform_code;
conf.hr_continuous = conf.list_deployment_hr.continuous;

%% load config files
name_file=[conf.csv_config 'table_coeff.csv'];
if ~exist(name_file,'file')
    error(['WARNING: the file ' name_file ' was not found!'])
end
conf.table_coeff = readtable(name_file,'ReadRowNames',1,'Delimiter',',');

name_file=[conf.csv_config 'table_param.csv'];
if ~exist(name_file,'file')
    error(['WARNING: the file ' name_file ' was not found!'])
end
conf.table_param = readtable(name_file,'ReadRowNames',1,'Delimiter',',');

name_file=[conf.csv_config 'table_salinity_offsets.csv'];
if ~exist(name_file,'file')
    error(['WARNING: the file ' name_file ' was not found!'])
end
conf.table_salinity_offsets = readtable(name_file,'ReadRowNames',1,'Delimiter',',');

name_file=[conf.csv_config 'table_meta.csv'];
if ~exist(name_file,'file')
    error(['WARNING: the file ' name_file ' was not found!'])
end
conf.table_meta = readtable(name_file,'ReadRowNames',1,'Delimiter',',');

name_file=[conf.csv_config 'table_filter.csv'];
if ~exist(name_file,'file')
    error(['WARNING: the file ' name_file ' was not found!'])
end
conf.table_filter = readtable(name_file,'ReadRowNames',0,'Delimiter',',');

end




