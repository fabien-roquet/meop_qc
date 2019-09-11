function generate_plot2(conf,EXP,smru_name)

if isempty(conf),
    conf = init_mirounga;
end
close all

info_deployment=load_info_deployment(conf,EXP);
if ~exist('smru_name','var') % all tags from EXP deployment
    smru_name = info_deployment.list_smru_name;
    Itag = 1:length(info_deployment.list_tag);
    [s,mess,messid] = mkdir(sprintf('%s%s',conf.calibplotdir,info_deployment.EXP));
    delete(sprintf('%s%s/*.png',conf.calibplotdir,info_deployment.EXP))
else  % tag smru_tag only
    Itag = find(strcmp(smru_name,info_deployment.list_smru_name));
    if isempty(Itag),
        return
    end
    [s,mess,messid] = mkdir(sprintf('%s%s',conf.calibplotdir,info_deployment.EXP));
    delete(sprintf('%s%s/calibration_%s_*.png',conf.calibplotdir,info_deployment.EXP,smru_name))
end


do_figure='on';
info_deployment=load_info_deployment(conf,EXP);

plot_conf=[];
if ~any(strcmp(conf.table_param.Properties.RowNames,EXP)),
    plot_conf.temp_error=0.1;
    plot_conf.psal_error=0.2;
else
    for field = conf.table_param.Properties.VariableNames
        plot_conf = setfield(plot_conf,field{1},conf.table_param{EXP,field{1}});
    end
end

if isfield(plot_conf,'Tcontour') 
    if isempty(plot_conf.Tcontour{1})
        plot_conf = rmfield(plot_conf,'Tcontour');
    else
        plot_conf.Tcontour = eval(plot_conf.Tcontour{1});
    end
end

if isfield(plot_conf,'Scontour') 
    if isempty(plot_conf.Scontour{1})
        plot_conf = rmfield(plot_conf,'Scontour');
    else
        plot_conf.Scontour = eval(plot_conf.Scontour{1});
    end
end

fields = fieldnames(plot_conf)';
for field = fields
    if any(isnan(getfield(plot_conf,field{1})))
        plot_conf = rmfield(plot_conf,field{1});
    end
end

if length(info_deployment.list_tag_lr0)
    suffix = '_lr0'; mode = 'raw';
    disp(['plot diag ' EXP ': ' suffix(2:end) ', ' mode]);
    sc_plot_data_tags;
    sc_plot_data_deploy;
    sc_build_latex;
end

if length(info_deployment.list_tag_lr1)
    suffix = '_lr1'; mode = 'adj';
    disp(['plot diag ' EXP ': ' suffix(2:end) ', ' mode]);
    sc_plot_data_tags;
    sc_plot_data_deploy;
    sc_build_latex;
end

if length(info_deployment.list_tag_hr2)
    suffix = '_hr2'; mode = 'adj';
    disp(['plot diag ' EXP ': ' suffix(2:end) ', ' mode]);
    sc_plot_data_tags;
    sc_plot_data_deploy;
    sc_build_latex;
end

if length(info_deployment.list_tag_fr1)
    suffix = '_fr1'; mode = 'adj';
    disp(['plot diag ' EXP ': ' suffix(2:end) ', ' mode]);
    sc_plot_data_tags;
    sc_plot_data_deploy;
    sc_build_latex;
end

