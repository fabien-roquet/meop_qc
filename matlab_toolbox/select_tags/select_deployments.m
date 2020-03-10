function EXPs = select_deployments(conf)

EXPs =[];
if isfield(conf.selection,'deployment') && ~isempty(conf.selection.deployment)
    EXPs = tags_processed(conf,conf.selection.deployment);
end
if conf.selection.nation
    EXPs_aux = tags_processed(conf,conf.selection.nation);
    if not(isempty(EXPs)) & not(isempty(EXPs_aux))
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.selection.new_tags
    EXPs_aux = tags_processed(conf,'newtags');
    if not(isempty(EXPs)) & not(isempty(EXPs_aux))
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.selection.unprocessed_tags
    EXPs_aux = tags_processed(conf,'unprocessed_tags');
    if not(isempty(EXPs)) & not(isempty(EXPs_aux))
        EXPs = union(EXPs_aux(~ismember(EXPs_aux,EXPs),:),EXPs);
    else
        EXPs = EXPs_aux;
    end
end
if conf.selection.all_tags
    EXPs = tags_processed(conf);
end

if isempty(EXPs), error('List of deployments to process cannot be empty'); end
EXPs = unique(EXPs,'stable');


