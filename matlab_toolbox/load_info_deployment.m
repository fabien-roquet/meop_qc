function info_deployment=load_info_deployment(conf,EXP,one_smru_name)

%% load metadata deployment :
% EXP, PI, ODV name and directory name 

if isempty(conf),
    init_mirounga;
end

if iscell(EXP) && length(EXP)==1,
    EXP = EXP{1};
end

if ~ismember(EXP,conf.list_deployment_code)
    info_deployment.EXP      = EXP;
    info_deployment.list_tag = [];
    return
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
end


info_deployment.EXP      = EXP;
info_deployment.PI       = conf.list_deployment{EXP,'pi_code'}{1};
info_deployment.PI       = info_deployment.PI(info_deployment.PI~=' ');
info_deployment.NATION   = conf.list_deployment{EXP,'country'}{1};
info_deployment.nomfic   = [EXP '_ODV.txt'];
if ismember(EXP,{'ct3','ct7','ct11','wd3'}),  
    info_deployment.nomfic   = [EXP '_fcell.mat']; 
end
info_deployment.dir      = [conf.datadir,info_deployment.NATION,'/',EXP,'/'];

info_deployment.process   = conf.list_deployment{EXP,'process'};
info_deployment.public    = conf.list_deployment{EXP,'public'};
info_deployment.task_done = conf.list_deployment{EXP,'task_done'};


info_deployment.list_tag = dir([info_deployment.dir one_smru_name '*_lr0_prof.nc']);
info_deployment.list_tag_lr0 =dir([info_deployment.dir one_smru_name '*_lr0_prof.nc']);
info_deployment.list_tag_lr1 =dir([info_deployment.dir one_smru_name '*_lr1_prof.nc']);
info_deployment.list_tag_hr0 =dir([info_deployment.dir one_smru_name '*_hr0_prof.nc']);
info_deployment.list_tag_hr1 =dir([info_deployment.dir one_smru_name '*_hr1_prof.nc']);
info_deployment.list_tag_hr2 =dir([info_deployment.dir one_smru_name '*_hr2_prof.nc']);
info_deployment.list_tag_fr0 =dir([info_deployment.dir one_smru_name '*_fr0_prof.nc']);
info_deployment.list_tag_fr1 =dir([info_deployment.dir one_smru_name '*_fr1_prof.nc']);

info_deployment.list_smru_name = {info_deployment.list_tag.name};
count = 0;
for a = info_deployment.list_smru_name,
    count = count+1;
    info_deployment.list_smru_name{count} = a{1}(1:end-12);
end


