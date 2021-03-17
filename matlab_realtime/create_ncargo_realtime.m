function create_ncargo_realtime(conf,EXP,one_smru_name,table)


if isempty(conf),
    conf = init_mirounga;
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
elseif isempty(EXP),
    EXP=EXP_from_smru_name(one_smru_name);
end

info_deployment=load_info_deployment(conf,EXP);


%  create directory
[s,mess,messid] = mkdir(info_deployment.dir);

%  open diary file
diary_file = [info_deployment.dir EXP '_diary.txt'];
if ~exist('one_smru_name','var') | isempty(one_smru_name) % all tags from EXP deployment
    one_smru_name = '';
    if exist(diary_file,'file'), delete(diary_file); end
    diary(diary_file)
    disp(['Process EXP=' EXP])
else  % tag smru_tag only
    info_deployment=load_info_deployment(conf,EXP,one_smru_name);
    diary(diary_file)
    disp(['Process smru_name=' one_smru_name])
end


sc_load_table2prof;


%  write global attributes
info_deployment=load_info_deployment(conf,EXP,one_smru_name);
for ktag=1:length(info_deployment.list_smru_name),
    smru_name = info_deployment.list_smru_name{ktag};
    name_prof = sprintf('%s%s_lr0_prof.nc',info_deployment.dir,smru_name);
    sc_write_global_attribute;
end


%  apply filters
info_deployment=load_info_deployment(conf,EXP,one_smru_name);
for ktag=1:length(info_deployment.list_smru_name),    
    smru_name = info_deployment.list_smru_name{ktag};
    suffix = '_lr0';
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
    sc_filtre_seals_qc;    
end


% %  adjust locations
% sc_adjust_locations;


%  create ncARGO file hr0
sc_create_hr0;


diary off

