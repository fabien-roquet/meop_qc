function [Itag]=tags_processed(conf,varargin);
%% choose list tag to be processed
% [Itag]=tags_processed(conf,varargin);
% Arguments:
%   1) conf: required struct variable obtained when initializing sc_mirounga
%   2) if cell: list of deployments that need to be processed
%      if str: mode of selection ('unprocessed_tags' or 'new_tags' or a valid NATION)
% Output:
%   1) Itag: list of tags that must be processed
%

Itag=[];
if nargin==1
    
    for ii=1:length(conf.list_ficseals)
        if conf.list_ficseals{ii,3}==1
            Itag=[Itag ii];
        end
    end
    
    % sort deployments by start_date
    if isfield(conf,'start_date')
        [name_PI,Jtag]=sort({conf.start_date{Itag}});
        Itag=Itag(Jtag);
    end
    
    % sort deployments by nation
    if isfield(conf,'list_ficseals')
        [name_PI,Ktag]=sort({conf.list_ficseals{Itag,5}});
        Itag=Itag(Ktag);
    end
    
elseif nargin==2 && iscell(varargin{1})
    
    list = varargin{1};
    for ii=1:length(list)
        Itag=[Itag find(strcmp(conf.list_ficseals(:,1),list{ii}))];
    end
    
elseif nargin==2 && isstr(varargin{1})
    
    mode = varargin{1};
    switch mode
        case 'unprocessed_tags' % tags that have not been processed
            
            Itag_all=tags_processed(conf);
            for ktag = Itag_all,
                EXP=conf.lfic{ktag};
                info_deployment=load_info_deployment(conf,EXP);
                if ~exist([conf.datadir,info_deployment.NATION,'/',info_deployment.EXP]),
                    Itag0=[Itag0 ktag];
                end
            end
            
        case 'new_tags' % tags that were not previous in previous release
            
            name_info_deployments_old = [conf.public conf.version_old '/info_deployments.csv'];
            fid = fopen(name_info_deployments_old);
            info_deployments_old = textscan(fid,'%s %s %d %d %d %d', ...
                'delimiter', ',',...
                'Headerlines',1);
            fclose(fid);
            list_deployments_old = info_deployments_old{1};
            
            name_info_deployments_new = 'info_deployments.csv';
            fid = fopen(name_info_deployments_new);
            info_deployments_new = textscan(fid,'%s %s %d %d %d %d', ...
                'delimiter', ',',...
                'Headerlines',1);
            fclose(fid);
            list_deployments_new = info_deployments_new{1};
            
            list = setdiff(list_deployments_new,list_deployments_old);
            Itag0=tags_processed(conf,list);
            
        otherwise % valid nation
            
            Itag0 = conf.Itag_group{find(ismember(conf.list_group,mode))}';
            
    end
    
else
    
    error('Too many arguments in tag_processed');
    
end


