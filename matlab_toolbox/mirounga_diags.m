function mirounga_diags(mode,nation)
%% mirounga: front-end script to process seal data
% F. Roquet, B. Picard 2019
%
% function mirounga_diags(mode)
%  mode: by default, mode=''. 
%  mode={'generate_plot1','generate_plot2','global_diagnostics','update_public_CTD','update_public_SMS'} to perform only one task.
% if the processing fails, resume by simply calling again 'mirounga_diags'
% set the file config_diags.json to select the system configuration
% mirounga must be run from the directory matlab_toolbox
%
% Important: to update the system, first copy in the SMUG_INPUT directory data
%  from SMUG using ftp (VPN connection must be first opened).
% run update_input_data prior to sc_mirounga when you want to update raw data


%% initialization

conf = init_mirounga;

if not(exist('mode','var')), 
    checkpoint_file = [conf.processdir 'checkpoint_diags' mode '.mat'];
    mode='';
    nation='';
elseif not(exist('nation','var')), 
    checkpoint_file = [conf.processdir 'checkpoint_diags_' mode '.mat'];
    nation='';
else
    checkpoint_file = [conf.processdir 'checkpoint_diags_' mode '_' nation '.mat'];
end


%% Select tags : choose mode of selection in config_diags.json
conf.selection = conf.selection_diags;
if not(isempty(nation)),
    conf.selection.all_tags = 0;
    conf.selection.unprocessed_tags = 0;
    conf.selection.new_tags = 0;
    conf.selection.deployment = [];
    conf.selection.nation = nation;
end
EXPs = select_deployments(conf);

%% options : choose options in config_diags.json or provide a mode in argument
% conf.generate_plot1     = 0;   % create adjustment plots
% conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
% conf.global_diagnostics = 0;   % compute global maps
% conf.update_public_CTD  = 0;   % upload adjusted datasets on public ftp folder
% conf.update_public_SMS  = 0;   % upload adjusted datasets on public ftp folder
switch mode,
    case 'generate_plot1',
        conf.generate_plot1     = 1;   % create adjustment plots
        conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
        conf.global_diagnostics = 0;   % compute global maps
        conf.update_public_CTD  = 0;   % upload adjusted datasets on public ftp folder
        conf.update_public_SMS  = 0;   % upload adjusted datasets on public ftp folder
    case 'generate_plot2',
        conf.generate_plot1     = 0;   % create adjustment plots
        conf.generate_plot2     = 1;   % create diagnostic plots and pdfs
        conf.global_diagnostics = 0;   % compute global maps
        conf.update_public_CTD  = 0;   % upload adjusted datasets on public ftp folder
        conf.update_public_SMS  = 0;   % upload adjusted datasets on public ftp folder
    case 'global_diagnostics',
        conf.generate_plot1     = 0;   % create adjustment plots
        conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
        conf.global_diagnostics = 1;   % compute global maps
        conf.update_public_CTD  = 0;   % upload adjusted datasets on public ftp folder
        conf.update_public_SMS  = 0;   % upload adjusted datasets on public ftp folder
    case 'update_public_CTD',
        conf.generate_plot1     = 0;   % create adjustment plots
        conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
        conf.global_diagnostics = 0;   % compute global maps
        conf.update_public_CTD  = 1;   % upload adjusted datasets on public ftp folder
        conf.update_public_SMS  = 0;   % upload adjusted datasets on public ftp folder
    case 'update_public_SMS',
        conf.generate_plot1     = 0;   % create adjustment plots
        conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
        conf.global_diagnostics = 0;   % compute global maps
        conf.update_public_CTD  = 0;   % upload adjusted datasets on public ftp folder
        conf.update_public_SMS  = 1;   % upload adjusted datasets on public ftp folder
    otherwise,
end
    

%% Resume
if exist(checkpoint_file,'file'),
    load(checkpoint_file);
    kEXP0 = kEXP;
else
    checkpoint = 'none';
    kEXP0 = 1;
end

%% Produce the plots 1
if conf.generate_plot1 && any(strcmp(checkpoint,{'none','generate_plots1'})),
    checkpoint = 'generate_plots1';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        save(checkpoint_file,'checkpoint','kEXP');
        EXP = EXPs.deployment_code{kEXP};
        generate_plot1(conf,EXP);
    end
    delete(checkpoint_file);
end

%% Produce the plots 2
if conf.generate_plot2 && any(strcmp(checkpoint,{'none','generate_plots2'})),
    checkpoint = 'generate_plots2';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        save(checkpoint_file,'checkpoint','kEXP');
        EXP = EXPs.deployment_code{kEXP};
        conf.plot1_mode='detailed';
        generate_plot2(conf,EXP);
    end
    delete(checkpoint_file);
end
%     % comparaison CTD LR/CTD HR
%     plot_all_profil=1;
%     for ii=1:length(conf.list_deployment_hr{1,1})
%         compare_ctd_resolution(list_deployment_hr{1,1}{ii},conf,plot_all_profil);
%     end


%% global pdf
if conf.global_diagnostics
    
    disp('Generate global diagnostics');
    
    plot_global_dataset(conf);
    plot_global_dataset_SMS(conf);
    % sc_build_latex_global;
    
end


%% load data on public folder
if conf.update_public_CTD
    
    disp('Transfer MEOP-CTD to public ftp');
    sc_load_data_to_public_folder;

end

%% load data on public folder
if conf.update_public_SMS
    
    disp('Transfer MEOP-SMS to public ftp');
    sc_load_data_to_public_folder_SMS;
    
end


