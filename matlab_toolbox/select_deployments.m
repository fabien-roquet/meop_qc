function EXPs = select_deployments(conf)

if isfield(conf.select,'deployment') && ~isempty(conf.select.deployment)
    EXPs = tags_processed(conf,conf.select.deployment);
end
if conf.select.nation
    EXPs_aux = tags_processed(conf,conf.select.nation);
    if EXPs & EXP_aux
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.select.new_tags
    EXPs_aux = tags_processed(conf,'newtags');
    if EXPs & EXP_aux
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.select.unprocessed_tags
    EXPs_aux = tags_processed(conf,'unprocessed_tags');
    if EXPs & EXP_aux
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.select.all_tags
    EXPs = tags_processed(conf);
end

if isempty(EXPs), error('List of deployments to process cannot be empty'); end
EXPs = unique(EXPs,'stable');


