function mirounga_processing(mode)
%% mirounga: front-end script to process seal data
% F. Roquet, B. Picard 2019
%
% function mirounga_processing([mode])
%  mode: by default, mode='resume'. Start over from the checkpoint, if there is one.
%  mode='restart all': fresh start. All computations are re-done.
% if the processing fails, resume by simply calling again 'mirounga_processing'
% set the file config_processing.json to select the system configuration
% mirounga must be run from the directory matlab_toolbox
%
% Important: to update the system, first copy in the SMUG_INPUT directory data
%  from SMUG using ftp (VPN connection must be first opened).
% run update_input_data prior to sc_mirounga when you want to update raw data


%% initialization
conf = init_mirounga;
checkpoint_file = [conf.processdir 'checkpoint_processing.mat'];

%% Select tags : choose mode of selection in config_processing.json
EXPs = select_deployments(conf);
if exist('mode','var') & strcmp(mode,'restart all')
    for kEXP = 1:length(EXPs.deployment_code),
        EXP = EXPs.deployment_code{kEXP};
        conf.list_deployment{EXP,'task_done'} = 0;
    end
    writetable(conf.list_deployment,[conf.csv_config 'list_deployment.csv'],'WriteRowNames',true);
end

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

%% Resume
if exist(checkpoint_file,'file'),
    load(checkpoint_file);
    kEXP0 = kEXP;
else
    checkpoint = 'none';
    kEXP0 = 1;
end

%% Execute the tasks
if conf.process_tags & any(strcmp(checkpoint,{'none','process_tags'})),
        
    checkpoint = 'process_tags';
    for kEXP = kEXP0:length(EXPs.deployment_code),
        
        save(checkpoint_file,'checkpoint','kEXP');

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
    delete(checkpoint_file);
    
end

%% store a copy of the csv_config files
copyfile([conf.csv_config '*.csv'],conf.processdir);

