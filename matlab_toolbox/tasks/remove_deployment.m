function remove_deployment(conf,EXP,one_smru_name)


if isempty(conf),
    conf = init_mirounga;
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
elseif isempty(EXP),
    EXP=EXP_from_smru_name(one_smru_name);
end



% don't process it if no raw odv file
info_deployment=load_info_deployment(conf,EXP,one_smru_name);
if ~exist([conf.rawdir info_deployment.nomfic]),
    error(sprintf('%s: no raw file. not processed.',EXP));
end

list = info_deployment.list_tag_lr1;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_lr0;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_hr0;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_hr1;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_hr2;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_fr0;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

list = info_deployment.list_tag_fr1;
if ~isempty(list),
    for kk=1:length(list),
        delete([info_deployment.dir list(kk).name]);
    end
end

