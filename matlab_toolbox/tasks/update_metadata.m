function update_metadata(conf,EXP)

info_deployment=load_info_deployment(conf,EXP);

% adjust metadata for lr0 and fr0
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = list_tag(index).name(1:end-12);
    name_prof = sprintf('%s%s_lr0_prof.nc',info_deployment.dir,smru_name);
    sc_write_global_attribute;
    
    name_prof = sprintf('%s%s_hr0_prof.nc',info_deployment.dir,smru_name);
    if ~exist(name_prof,'file'), continue; end
    sc_write_global_attribute;
    
end

info_deployment=load_info_deployment(conf,EXP);
suffix = '_lr0';        sc_adjust_locations;
suffix = '_hr0';        sc_adjust_locations;

% write METADATA txt file
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = list_tag(index).name(1:end-12);
    name_prof = sprintf('%s%s_lr0_prof.nc',info_deployment.dir,smru_name);
    attr      = ncloadatt_struct(name_prof);
    nattr     = fieldnames(attr);
    [s,mess,messid] = mkdir([conf.datadir_ODV , info_deployment.NATION,'/',EXP,'/']);
    metaname  = [conf.datadir_ODV , ...
        info_deployment.NATION,'/',EXP,'/', smru_name, '_METADATA.txt'];
    delete(metaname);
    if isempty(nattr), continue, end
    fid       = fopen(metaname,'w');
    for kk=1:length(nattr),
        fprintf(fid,'%32s : ''%s''\n',nattr{kk},strtrim(evalc('disp(getfield(attr,nattr{kk}))')));
    end
    fclose (fid);
    
end
    