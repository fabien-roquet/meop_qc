function mirounga(varargin)
%% sc_mirounga: front-end script to process seal data
% F. Roquet, B. Picard 2019

% Important: to update the system, first copy in the SMUG_INPUT directory data
%  from SMUG using ftp (VPN connection must be first opened).
%
% if the processing fails, resume by simply calling again sc_mirounga
% for a fresh start, delete variable 'resume' or set it to 'resume=0'
% set Itag0 list to select the list of tag to be processed
% set config to select the system configuration
% set options in the conf struct variable to select processing blocks that must be executed
% modify resume variable to start at a given processing block
% modify ktag to set where to start in Itag0 list
%
% run update_input_data prior to sc_mirounga when you want to update raw data
% sc_mirounga must be run from the directory matlab_toolbox

%% initialization
conf = init_mirounga;

%% Select tags : choose mode of selection in config.json
EXPs = select_deployments(conf);

%% options : choose options in config.json
% conf.process_tags = 0 --> do not process tags
% conf.process_tags = 1 --> create_ncargo     % process raw data
% conf.process_tags = 2 --> create_fr0        % process fully-resolved datasets
% conf.process_tags = 3 --> update_metadata   % set metadata in ncARGO files
% conf.process_tags = 4 --> apply_adjustments % apply adjustments in ncARGO files
% conf.process_tags = 5 --> apply_tlc         % apply thermal lag correction
% conf.process_tags = 6 --> apply_tlc_fr      % apply thermal lag correction on full resolution data
% conf.process_tags = 7 --> create_hr2        % create hr2 files for high-resolution data
% conf.process_tags = 8 --> generate_odv4     % generate odv4 files (both normal and STD standard levels)
% conf.process_mode       = 'resume';   % restart, resume, onestep
% conf.generate_plot1     = 1;   % create adjustment plots
% conf.generate_plot2     = 1;   % create diagnostic plots and pdfs
% conf.global_diagnostics = 0;   % compute global maps
% conf.update_public_data = 0;   % upload adjusted datasets on public ftp folder

%% Resume
if exist('checkpoint.mat','file'),
    load('checkpoint.mat');
    kEXP0 = kEXP;
else
    checkpoint = 'none';
    kEXP0 = 1;
end

%% Execute the tasks
if conf.process_tags & any(strcmp(checkpoint,{'none','process_tags'})),

    checkpoint = 'process_tags';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        
        save('checkpoint.mat','checkpoint','kEXP');

        EXP = EXPs.deployment_code{kEXP};
        info_deployment=load_info_deployment(conf,EXP);
        info_deployment.task_done = conf.list_deployment{EXP,'task_done'};
        
        switch conf.process_mode,
            case 'restart',
                info_deployment.task_done = 0;
            case 'onestep',
                info_deployment.task_done = min([info_deployment.task_done conf.process_tags-1]);
        end
        
        while info_deployment.task_done < conf.process_tags,
            
            ktask = info_deployment.task_done+1;
            task = conf.list_tasks{ktask};
            fprintf('(%d) %s on %s\n',ktask,task,EXP);
            feval(task,conf,EXP);
            conf.list_deployment{EXP,'task_done'}=ktask;
            writetable(conf.list_deployment,[conf.csv_config 'list_deployment.csv'],'WriteRowNames',true);
            info_deployment.task_done = ktask;

        end
        
        
    end
    delete('checkpoint.mat');
    
end

%% Produce the plots 1
if conf.generate_plot1 && any(strcmp(checkpoint,{'none','generate_plots1'})),
    checkpoint = 'generate_plots1';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        save('checkpoint.mat','checkpoint','kEXP');
        EXP = EXPs.deployment_code{kEXP};
        generate_plot1(conf,EXP);
    end
    delete('checkpoint.mat');
end

%% Produce the plots 2
if conf.generate_plot2 && any(strcmp(checkpoint,{'none','generate_plots2'})),
    checkpoint = 'generate_plots2';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        save('checkpoint.mat','checkpoint','kEXP');
        EXP = EXPs.deployment_code{kEXP};
        generate_plot2(conf,EXP);
    end
    delete('checkpoint.mat');
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


