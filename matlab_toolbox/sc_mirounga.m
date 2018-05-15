%% sc_mirounga: front-end script to process seal data
% F. Roquet, B. Picard 2017

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

% % save state
% save('workspace');
%
% % load state
% cd /Users/roquet/GoogleDrive/MEOP-CTD/
% load('workspace.mat'); addpath(genpath(conf.matlabdir)); addpath(conf.datadir)



%% initialization
if ~exist('resume','var') || resume == 0
    
    clear all; close all
    
    conf=[];
    config = 'fabien';
    resume = 0;
    
    % machine-dependent settings
    conf.version     = 'MEOP-CTD_2018-04-10';
    conf.version_old = 'MEOP-CTD_2017-11-11';
    switch config,
        case 'fabien',
            conf.maindir = '/Users/roquet/GoogleDrive/MEOP-CTD/';
            conf.woddir  = '/Users/roquet/GoogleDrive/WOD_data/WOD_data/';
            conf.pdflatex= '/Library/TeX/texbin/pdflatex';
        case 'baptistelinux',
            conf.maindir = '/media/ubuntu/SPPHD/MEOP/MEOP-CTD/';
            conf.woddir  = '/media/ubuntu/SPPHD/MEOP/WOD_data/';
            conf.pdflatex= 'pdflatex';
        case 'baptistewindow',
            conf.maindir = 'D:\MEOP\MEOP-CTD\';
            conf.woddir  = 'L:\MEOP\DATA\WOD_data\';
            conf.pdflatex= 'pdflatex';
        otherwise
            conf.maindir = '/Users/roquet/GoogleDrive/MEOP-CTD/';
            conf.woddir  = '/Users/roquet/GoogleDrive/WOD_data/WOD_data/';
            conf.pdflatex= '/Library/TeX/texbin/pdflatex';
    end
    conf.update_input_data  = 0;   % input data are updated from SMUG_INPUT
    
    % init mirounga
    cd([conf.maindir 'matlab_toolbox']);
    init_mirounga;
    
    % Process all
    Itag0 = tags_processed(conf);

    % Process list
    list={
       'ct101'
       }';
    Itag0=tags_processed(conf,list);

    % % Process a given NATION
    % Itag0=tags_processed(conf,'AUSTRALIA');
    
    % % Process new deployments (not in previous release)
    % Itag0=tags_processed(conf,'new_tags');
    
    % % Process deployments not already done
    % Itag0=tags_processed(conf,'unprocessed_tags');
    
    if isempty(Itag0), error('List of tag Itag0 cannot be empty'); end
    Itag0 = unique(Itag0,'stable');
    ktag = Itag0(1);
    
end

%% options
conf.create_ncargo      = 1;   % process raw data
conf.create_fr0         = 1;   % process fully-resolved datasets
conf.update_metadata    = 1;   % set metadata in ncARGO files
conf.apply_adjustments  = 1;   % apply adjustments in ncARGO files
conf.apply_tlc          = 1;   % apply thermal lag correction
conf.generate_odv4      = 1;   % generate odv4 files (both normal and STD standard levels)
conf.generate_plot1     = 1;   % create adjustment plots
conf.generate_plot2     = 1;   % create diagnostic plots and pdfs
conf.global_diagnostics = 1;   % compute global maps
conf.update_public_data = 1;   % upload adjusted datasets on public ftp folder

%% Load data in netcdf Argo format
resume = max([resume 1]);
if conf.create_ncargo & resume==1
    
    disp('(1) create ncArgo files');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP=conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        disp(['(1)' EXP])
        
        % don't process it if no raw odv file
        if ~exist([conf.rawdir info_deployment.nomfic]),
            error(sprintf('%s: no raw file. not processed.',EXP));
        end
        
        % add deployment
        disp(EXP);
        delete([conf.logdir 'diary_' EXP '.txt'])
        diary([conf.logdir 'diary_' EXP '.txt'])
        
        %   1) create directory
        [s,mess,messid] = mkdir([conf.datadir,info_deployment.NATION,'/',info_deployment.EXP]);
        
        %   2) create ncARGO file lr0
        if ismember(info_deployment.EXP,{'ct3','ct7','ct11','wd3'})
            sc_load_KERold2prof;
        else
            sc_load_odv2prof;
        end
        
        %   3) init corrections/load build_fcell
        sc_create_build_fcell;
        if exist([conf.builddir 'build_fcell_' EXP '.m'],'file'),
            try; eval(['build_fcell_' EXP ';']); catch; error([EXP ': error in the build']); end
        end
        
        %   4) apply automated filters
        list_tag = info_deployment.list_tag;
        for index=1:length(list_tag),
            
            smru_name = list_tag(index).name(1:end-12);
            
            suffix = '_lr0';
            name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
            Mqc=ARGO_load_qc(name_prof,0);
            Mqc.PRES_QC(Mqc.PRES_QC==0) = 1;
            Mqc.TEMP_QC(Mqc.TEMP_QC==0) = 1;
            Mqc.PSAL_QC(Mqc.PSAL_QC==0) = 1;
            if isfield(Mqc,'CHLA_QC'), Mqc.CHLA_QC(Mqc.CHLA_QC==0) = 1; end
            if isfield(Mqc,'DOXY_QC'), Mqc.DOXY_QC(Mqc.DOXY_QC==0) = 1; end
            ARGO_save_qc(name_prof,Mqc,0);
            sc_filtre_seals_qc;
            
        end
        
        %   5) create ncARGO file hr0
        sc_create_hr0;
            
        diary off

    end
    ktag = Itag0(1);

end

%% create FR data files (fr0)
resume = max([resume 1.1]);
if conf.create_fr0 && resume==1.1
    
    disp('(1b) create ncArgo file fr0');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP=conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        disp(['(1b)' EXP])
        
        % don't process it if no raw odv file
        if ~exist([conf.rawdir info_deployment.nomfic]),
            disp(sprintf('%s: no raw file. not processed.',EXP));
            continue
        end
        
        % create netcdf HR traj and prof if FR data exist
        sc_load_ctdhr2prof;
        
        %   4) apply automated filters
        list_tag = info_deployment.list_tag;
        for index=1:length(list_tag),
            
            smru_name = list_tag(index).name(1:end-12);
            
            suffix = '_fr0';
            name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
            if ~exist(name_prof,'file'), continue; end
            Mqc=ARGO_load_qc(name_prof,0);
            Mqc.PRES_QC(Mqc.PRES_QC==0) = 1;
            Mqc.TEMP_QC(Mqc.TEMP_QC==0) = 1;
            Mqc.PSAL_QC(Mqc.PSAL_QC==0) = 1;
            if isfield(Mqc,'CHLA_QC'), Mqc.CHLA_QC(Mqc.CHLA_QC==0) = 1; end
            if isfield(Mqc,'DOXY_QC'), Mqc.DOXY_QC(Mqc.DOXY_QC==0) = 1; end
            ARGO_save_qc(name_prof,Mqc,0);
            sc_filtre_seals_qc;
            
            sc_write_global_attribute;
            
            
        end
        
        % adjust locations
        info_deployment=load_info_deployment(conf,EXP);
        suffix = '_fr0';        sc_adjust_locations;
        
    end
    ktag = Itag0(1);
    
end


%% update metadata
resume = max([resume 2]);
if conf.update_metadata && resume==2
    
    disp('(2) set metadata and locations');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP = conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        disp(['(2)' EXP])
        
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
        
        % adjust locations
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
    end
    ktag = Itag0(1);
    
end


%% Apply adjustments
resume = max([resume 3]);
if conf.apply_adjustments && resume==3
    
    disp('(3) apply offset adjustments');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP=conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        if ~exist(info_deployment.dir), continue, end
        disp(['(3)' EXP])
        
        sc_apply_offset;
        
    end
    ktag = Itag0(1);
    
end


%% apply thermal lag adjustments
resume = max([resume 4]);
if conf.apply_tlc && resume==4
    
    disp('(4a) apply thermal lag adjustments');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP=conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        if ~exist(info_deployment.dir), continue, end
        disp(['(4a)' EXP])
        
        list_tag_hr0 = info_deployment.list_tag_hr0;
        for ll=1:length(list_tag_hr0),
            
            % compute hr1 from hr0
            name_prof_hr0 = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag_hr0(ll).name);
            name_prof_hr1 = strrep(name_prof_hr0,'_hr0_','_hr1_');
            if exist(name_prof_hr1,'file'), delete(name_prof_hr1); end
            copyfile(name_prof_hr0, name_prof_hr1);
            Mqc = ARGO_load_qc(name_prof_hr0,1);
            
            % thermal cell correction
            Scorr1 = thermal_cell_correction(.03,.03,1,Mqc.PSAL,Mqc.TEMP,Mqc.PRES);
            
            % density inversion
            c = gsw_SSO/35;
            CT = gsw_CT_from_t(Scorr1*c,Mqc.TEMP,Mqc.PRES);
            Scorr2 = gsw_stabilise_SA_const_t(Scorr1*c,CT,Mqc.PRES)/c;
            
            % filter S
            X0 = Scorr2; [nr np] = size(X0);
            X1 = filter([1 4 6 4 1]/16,1,[nan(2,np); X0; nan(2,np)]);
            X2 = X1(5:end,:);
            X2(isnan(X2) & ~isnan(X0)) = X0(isnan(X2) & ~isnan(X0));
            Mqc.PSAL_ADJUSTED = X2;
            
            % filter T
            X0 = Mqc.TEMP; [nr np] = size(X0);
            X1 = filter([1 4 6 4 1]/16,1,[nan(2,np); X0; nan(2,np)]);
            X2 = X1(5:end,:);
            X2(isnan(X2) & ~isnan(X0)) = X0(isnan(X2) & ~isnan(X0));
            Mqc.TEMP_ADJUSTED = X2;
            
            ncwrite(name_prof_hr1,'TEMP_ADJUSTED',Mqc.TEMP_ADJUSTED);
            ncwrite(name_prof_hr1,'PSAL_ADJUSTED',Mqc.PSAL_ADJUSTED);
            ncwriteatt(name_prof_hr1,'/','thermal_lag_adjustment','yes');
            
            % compute lr1 from hr1
            name_prof_hr0 = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag_hr0(ll).name);
            name_prof_hr1 = strrep(name_prof_hr0,'_hr0_','_hr1_');
            name_prof_lr0 = strrep(name_prof_hr0,'_hr0_','_lr0_');
            name_prof_lr1 = strrep(name_prof_hr0,'_hr0_','_lr1_');
            if exist(name_prof_lr1,'file'), delete(name_prof_lr1); end
            copyfile(name_prof_lr0, name_prof_lr1);
            Mqc_hr = ARGO_load_qc(name_prof_hr1,1);
            Mqc_lr = ARGO_load_qc(name_prof_lr1,1);
            Mqc_lr0 = ARGO_load_qc(name_prof_lr0,1);
            
            P_lr = Mqc_lr.PRES;
            T_lr = P_lr*NaN;
            S_lr = P_lr*NaN;
            [nr np] = size(P_lr);
            
            P_hr = Mqc_hr.PRES;
            T_hr = Mqc_hr.TEMP;
            S_hr = Mqc_hr.PSAL;
            
            for kk=1:np,

                I = find(~isnan(P_hr(:,kk).*T_hr(:,kk))); Ti = P_lr(:,kk)*NaN;
                if length(I), Ti = interp1(P_hr(I,kk),T_hr(I,kk),P_lr(:,kk),'nearest',NaN); end
                T_lr(:,kk) = Ti;

                I = find(~isnan(P_hr(:,kk).*S_hr(:,kk))); Si = P_lr(:,kk)*NaN;
                if length(I), Si = interp1(P_hr(I,kk),S_hr(I,kk),P_lr(:,kk),'nearest',NaN); end
                S_lr(:,kk) = Si;

            end
            
            T_lr(isnan(T_lr)) = Mqc_lr.TEMP(isnan(T_lr));
            S_lr(isnan(S_lr)) = Mqc_lr.PSAL(isnan(S_lr));
            
            ncwrite(name_prof_lr1,'TEMP_ADJUSTED',T_lr);
            ncwrite(name_prof_lr1,'PSAL_ADJUSTED',S_lr);
            ncwriteatt(name_prof_lr1,'/','thermal_lag_adjustment','yes');
            
        end
        
    end
    ktag = Itag0(1);
    
end


%% process fully-resolved datasets
resume = max([resume 4.1]);
if conf.apply_tlc && resume==4.1
    
    disp('(4b) apply thermal lag adjustments for full-resolution data');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP=conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        if ~exist(info_deployment.dir), continue, end
        disp(['(4b)' EXP])
        
        list_tag_fr0 = info_deployment.list_tag_fr0;
        for ll=1:length(list_tag_fr0),
            
            % compute fr1 from fr0
            name_prof_fr0 = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag_fr0(ll).name);
            name_prof_fr1 = strrep(name_prof_fr0,'_fr0_','_fr1_');
            if exist(name_prof_fr1,'file'), delete(name_prof_fr1); end
            copyfile(name_prof_fr0, name_prof_fr1);
            Mqc = ARGO_load_qc(name_prof_fr0,1);
            
            % thermal cell correction
            Scorr1 = thermal_cell_correction(.03,.03,1,Mqc.PSAL,Mqc.TEMP,Mqc.PRES);
            
            % density inversion
            c = gsw_SSO/35;
            CT = gsw_CT_from_t(Scorr1*c,Mqc.TEMP,Mqc.PRES);
            Scorr2 = gsw_stabilise_SA_const_t(Scorr1*c,CT,Mqc.PRES)/c;
            
            % filter S
            X0 = Scorr2; [nr np] = size(X0);
            X1 = filter([1 4 6 4 1]/16,1,[nan(2,np); X0; nan(2,np)]);
            X2 = X1(5:end,:);
            X2(isnan(X2) & ~isnan(X0)) = X0(isnan(X2) & ~isnan(X0));
            Mqc.PSAL_ADJUSTED = X2;
            
            % filter T
            X0 = Mqc.TEMP; [nr np] = size(X0);
            X1 = filter([1 4 6 4 1]/16,1,[nan(2,np); X0; nan(2,np)]);
            X2 = X1(5:end,:);
            X2(isnan(X2) & ~isnan(X0)) = X0(isnan(X2) & ~isnan(X0));
            Mqc.TEMP_ADJUSTED = X2;
            
            ncwrite(name_prof_fr1,'TEMP_ADJUSTED',Mqc.TEMP_ADJUSTED);
            ncwrite(name_prof_fr1,'PSAL_ADJUSTED',Mqc.PSAL_ADJUSTED);
            ncwriteatt(name_prof_fr1,'/','thermal_lag_adjustment','yes');
            
        end
        
    end
    ktag = Itag0(1);
    
end


%% format ODV4
resume = max([resume 5]);
if conf.generate_odv4 && resume==5
    
    disp('(5) create ODV4 files');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP = conf.lfic{ktag};
        info_deployment = load_info_deployment(conf,EXP);
        list_tag = info_deployment.list_tag_hr1;
        
        for ii=1:length(list_tag)
            
            name_prof = sprintf('%s%s',info_deployment.dir,list_tag(ii).name);
            name_prof_fr1 = strrep(name_prof,'_hr1_','_fr1_');
            if exist(name_prof_fr1,'file'), name_prof=name_prof_fr1; end
            if ~exist(name_prof,'file'), continue; disp([name_prof ' does not exist']); end
            disp(['generate ODV4: ' list_tag(ii).name(1:end-12)]);
            [s,mess,messid] = mkdir([conf.datadir_ODV,info_deployment.NATION,'/',info_deployment.EXP]);
            Mqc=ARGO_load_qc(name_prof,0);
            odvname = sprintf('%s%s/%s/%s_ODV.txt',conf.datadir_ODV,info_deployment.NATION,EXP,list_tag(ii).name(1:end-12));
            convert_ARGO2ODV4(Mqc,odvname);
            
        end
        
    end
    ktag = Itag0(1);
    
end


%% generate plots for adjustments
resume = max([resume 6]);
if conf.generate_plot1 && resume==6
    
    disp('(6a) create adjustment plots');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        
        EXP = conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        
        sc_compute_adjustments;
        %sc_compute_adjustments_fr;
        
    end
    ktag = Itag0(1);
    
end


%% generate plots and latex data
resume = max([resume 6.1]);
if conf.generate_plot2 && resume==6.1
    
    disp('(6b) generate diagnostic plots and pdf document for each deployments');
    Itag = Itag0(find(Itag0==ktag):end);
    for ktag=Itag,
        do_figure='on';
        clear plot_conf;
        EXP = conf.lfic{ktag};
        info_deployment=load_info_deployment(conf,EXP);
        
        plot_conf=[];
        if exist([conf.confplot 'config_plots_' EXP '.m'],'file'),
            eval(['config_plots_' EXP ';']);
        end
        
        if length(info_deployment.list_tag_lr0)
            suffix = '_lr0'; mode = 'raw';
            disp(['plot diag ' EXP ': ' suffix(2:end) ', ' mode]);
            sc_plot_data_tags;
            sc_plot_data_deploy;
            sc_build_latex;
        end
        
        if length(info_deployment.list_tag_hr1)
            suffix = '_lr1'; mode = 'adj';
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
        
    end
    ktag = Itag0(1);
    
    %     % comparaison CTD LR/CTD HR
    %     plot_all_profil=1;
    %     for ii=1:length(list_deployment_hr{1,1})
    %         compare_ctd_resolution(list_deployment_hr{1,1}{ii},conf,plot_all_profil);
    %     end
    
end


%% global pdf
resume = max([resume 7]);
if conf.global_diagnostics && resume==7
    disp('(7) generate global diagnostics');
    sc_plot_global_dataset;
    % sc_build_latex_global;
end


%% load data on public folder
resume = max([resume 8]);
if conf.update_public_data && resume==8
    disp('(8) transfer to public ftp');
    sc_load_data_to_public_folder;
    folder_output = sprintf('%s%s/',conf.public,conf.version);
    for kk = 1:length(list_NATION)
        NATION = list_NATION{kk};
        zip(sprintf('%s%s_%s.zip',conf.public,conf.version,NATION),sprintf('%s%s/%s',conf.public,conf.version,NATION));
    end
    zip(sprintf('%s%s_ALL.zip',conf.public,conf.version),sprintf('%s%s',conf.public,conf.version));
end

resume = max([resume 9]);

