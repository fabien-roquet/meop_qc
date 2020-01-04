function mirounga_diags()
%% mirounga: front-end script to process seal data
% F. Roquet, B. Picard 2019
%
% function mirounga_diags()
%  mode: by default, mode='resume'. Start over from the checkpoint, if there is one.
%  mode='restart all': fresh start. All computations are re-done.
% if the processing fails, resume by simply calling again 'mirounga_diags'
% set the file config_diags.json to select the system configuration
% mirounga must be run from the directory matlab_toolbox
%
% Important: to update the system, first copy in the SMUG_INPUT directory data
%  from SMUG using ftp (VPN connection must be first opened).
% run update_input_data prior to sc_mirounga when you want to update raw data


%% initialization
conf = init_mirounga;
checkpoint_file = [conf.processdir 'checkpoint_diags.mat'];

%% Select tags : choose mode of selection in config_diags.json
conf.selection = conf.selection_diags;
EXPs = select_deployments(conf);

%% options : choose options in config_diags.json
% conf.generate_plot1     = 1;   % create adjustment plots
% conf.generate_plot2     = 1;   % create diagnostic plots and pdfs
% conf.global_diagnostics = 0;   % compute global maps
% conf.update_public_data = 0;   % upload adjusted datasets on public ftp folder

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
if conf.update_public_data
    
    disp('Transfer to public ftp');
    
    sc_load_data_to_public_folder;
    sc_load_data_to_public_folder_SMS;
    folder_output = sprintf('%s%s/',conf.public,version);
    for kk = 1:length(list_NATION)
        NATION = list_NATION{kk};
        zip(sprintf('%s%s_%s.zip',conf.public,version,NATION),sprintf('%s%s/%s',conf.public,version,NATION));
    end
    zip(sprintf('%s%s_ALL.zip',conf.public,version),sprintf('%s%s',conf.public,version));
    
end


