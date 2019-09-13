function generate_odv4(conf,EXP,one_smru_name)

if isempty(conf),
    conf = init_mirounga;
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
end

info_deployment = load_info_deployment(conf,EXP,one_smru_name);
list_tag = info_deployment.list_tag_hr1;

for ii=1:length(list_tag)
    
    name_prof = sprintf('%s%s',info_deployment.dir,list_tag(ii).name);
    name_prof_hr2 = strrep(name_prof,'_hr1_','_hr2_');
    if exist(name_prof_hr2,'file'), name_prof=name_prof_hr2; end
    if ~exist(name_prof,'file'), continue; disp([name_prof ' does not exist']); end
    disp(['generate ODV4: ' list_tag(ii).name(1:end-12)]);
    [s,mess,messid] = mkdir([conf.datadir_ODV,info_deployment.NATION,'/',info_deployment.EXP]);
    Mqc=ARGO_load_qc(name_prof,0);
    odvname = sprintf('%s%s/%s/%s_ODV.txt',conf.datadir_ODV,info_deployment.NATION,EXP,list_tag(ii).name(1:end-12));
    convert_ARGO2ODV4(Mqc,odvname);
    
end

