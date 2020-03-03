function update_metadata(conf,EXP,one_smru_name)


if isempty(conf),
    conf = init_mirounga;
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
end
info_deployment=load_info_deployment(conf,EXP,one_smru_name);

% adjust metadata for lr0 and fr0
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s_lr0_prof.nc',info_deployment.dir,smru_name);
    sc_write_global_attribute;
    
    name_prof = sprintf('%s%s_hr0_prof.nc',info_deployment.dir,smru_name);
    if ~exist(name_prof,'file'), continue; end
    sc_write_global_attribute;
    
end

% adjust locations using crawl data
info_deployment = load_info_deployment(conf,EXP,one_smru_name);
conf.crawl.locdir          = [conf.rawdir 'original_crawl_locations/'];
conf.crawl.list    = dir([conf.crawl.locdir,'*_argos_crawl.csv']);
conf.crawl.ptt     = {};
conf.crawl.smru_name     = {};
for kk=1:length(conf.crawl.list)
    c = strsplit(conf.crawl.list(kk).name,{'_','.'});
    conf.crawl.smru_name{kk} = c{2};
    conf.crawl.ptt{kk} = c{3};
end
sc_adjust_locations_crawl;


% adjust locations using cls delayed mode data
info_deployment = load_info_deployment(conf,EXP,one_smru_name);
conf.cls.locdir          = [conf.rawdir 'original_cls_locations/'];
conf.cls.list    = dir([conf.cls.locdir,'*.smoothing.csv']);
conf.cls.ptt     = {};
conf.cls.datemin = {};
conf.cls.datemax = {};
for kk=1:length(conf.cls.list)
    c = strsplit(conf.cls.list(kk).name,{'_','.'});
    conf.cls.ptt{kk} = c{1};
    conf.cls.datemin{kk} = c{2};
    conf.cls.datemax{kk} = c{3};
end
conf.cls.datemin_jul = datenum(conf.cls.datemin);
conf.cls.datemax_jul = datenum(conf.cls.datemax);
sc_adjust_locations_cls;


% write METADATA txt file
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s_lr0_prof.nc',info_deployment.dir,smru_name);
    info = ncinfo(name_prof);
    str = jsonencode(info.Attributes);
    metaname  = [info_deployment.dir, smru_name, '_METADATA.json'];
    fid       = fopen(metaname,'w');
    fprintf(fid,'%s',str);
    fclose (fid);

    metaname  = [info_deployment.dir, smru_name, '_METADATA.txt'];
    attr      = ncloadatt_struct(name_prof);
    nattr     = fieldnames(attr);
    if isempty(nattr), continue, end
    fid       = fopen(metaname,'w');
    for kk=1:length(nattr),
        fprintf(fid,'%32s : ''%s''\n',nattr{kk},strtrim(evalc('disp(getfield(attr,nattr{kk}))')));
    end
    fclose (fid);
    
end
    