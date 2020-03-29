function EXPs = tags_processed(conf,varargin);
%% choose list tag to be processed
% [Itag]=tags_processed(conf,varargin);
% Arguments:
%   1) conf: required struct variable obtained when initializing sc_mirounga
%   2) if cell: list of deployments that need to be processed
%      if str: mode of selection ('unprocessed_tags' or 'new_tags' or a valid NATION)
% Output:
%   1) EXPs: list of deployments that must be processed
%

Itag=[];
if nargin==0
    conf = init_mirounga;
    EXPs = conf.list_deployment(conf.list_deployment.process==1,:);
    EXPs = sortrows(EXPs,{'country','pi_code','start_date_jul'});
    
elseif nargin==1
    if isempty(conf),
        conf = init_mirounga;
    end
    EXPs = conf.list_deployment(conf.list_deployment.process==1,:);
    EXPs = sortrows(EXPs,{'country','pi_code','start_date_jul'});
    
elseif nargin==2 && iscell(varargin{1})
    list = varargin{1};
    EXPs = conf.list_deployment(list,:);
    
elseif nargin==2 && isstr(varargin{1})
    mode = varargin{1};
    switch mode
        case 'unprocessed_tags' % tags that have not been processed
            
            EXPs = tags_processed(conf);
            count = 0;
            list = {};
            for kEXP = 1:length(EXPs.deployment_code),
                EXP = EXPs.deployment_code{kEXP};
                info_deployment = load_info_deployment(conf,EXP);
                if exist([conf.datadir,info_deployment.NATION,'/',info_deployment.EXP],'file'),
                    count = count+1;
                    list{count} = EXP;
                end
            end
            EXPs(list,:)=[];
            
        case 'new_tags' % tags that were not present in previous release
            
            EXPs = conf.list_deployment(conf.list_deployment.process==1 & ...
                strcmp(conf.list_deployment.last_version,''),:);

        otherwise % valid nation
            
            EXPs = conf.list_deployment(conf.list_deployment.process==1 & ...
                strcmp(conf.list_deployment.country,mode),:);
            
    end
    EXPs=sortrows(EXPs,{'country','pi_code','start_date_jul'});

else
    error('Too many arguments in tag_processed');
    
end



