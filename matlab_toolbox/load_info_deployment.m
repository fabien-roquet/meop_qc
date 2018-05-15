function info_deployment=load_info_deployment(conf,EXP)
%% load metadata deployment :
% EXP, PI, ODV name and directory name 


I=find(strcmp(conf.list_ficseals(:,1),EXP));
info_deployment.EXP      =EXP;
info_deployment.PI       =conf.list_ficseals{I,2};
info_deployment.PI       =info_deployment.PI(info_deployment.PI~=' ');
info_deployment.NATION   =conf.list_ficseals{I,5};
info_deployment.nomfic   =[EXP '_ODV.txt'];
if ismember(EXP,{'ct3','ct7','ct11','wd3'}),  info_deployment.nomfic   = [EXP '_fcell.mat']; end
info_deployment.dir      =[conf.datadir,info_deployment.NATION,'/',EXP,'/'];
info_deployment.list_tag =dir([info_deployment.dir '*_lr0_prof.nc']);
info_deployment.list_tag_lr0 =dir([info_deployment.dir '*_lr0_prof.nc']);
info_deployment.list_tag_lr1 =dir([info_deployment.dir '*_lr1_prof.nc']);
info_deployment.list_tag_hr0 =dir([info_deployment.dir '*_hr0_prof.nc']);
info_deployment.list_tag_hr1 =dir([info_deployment.dir '*_hr1_prof.nc']);
info_deployment.list_tag_fr0 =dir([info_deployment.dir '*_fr0_prof.nc']);
info_deployment.list_tag_fr1 =dir([info_deployment.dir '*_fr1_prof.nc']);
info_deployment.isdone   =conf.list_ficseals{I,3};
info_deployment.ispublic =conf.list_ficseals{I,4};
info_deployment.isupdated=conf.list_ficseals{I,6};

