function conf = init_config_realtime(new_processdir)
% set up matlab environment and initialize it if first time it is used
% The first time you want to install a config:
%  1) copy files from the folder scripts_for_new_config in the folder
%       where you want to process data,
%  2) set folder paths in the json file configs.json. 
%       Run the command config_id to obtain the config name you must
%       use for your computer. Enter absolute path for:
%           "processdir":"xxx", % path where to run processing.
%           "datadir":"xxx", % raw data
%           "matlabdir":"?/GitHub/meop_qc/matlab_toolbox/",
%           "inputdir":"?/", % SMRU input data
%           "refdir":"?/", % folder with reference climatologies
%           "public":"?/", % folder to write public data
%           "pdflatex":"pdflatex" %command to run the pdflatex compiler
% IMPORTANT: To install the new config, go to the folder scripts_for_new_config,
%  set configs.json and provide in particular the path to intended processdir folder.
%  Once run, move to the processdir folder and from there run the process scripts.

%% initialization of the mirounga processing system
d = jsondecode(fileread('configs_realtime.json'));
if isempty(d.config),
    d.config = config_id();    
end
try
    conf = getfield(d.configs,d.config);
catch
    error([d.config ' is not a supported config. modify configs.json']);
end
conf.version     = d.version.CTDnew;

% set up matlab path
p=genpath(conf.matlabdir);
Ibeg=[1 strfind(p,':')+1]; Ibeg(end)=[];
Iend=[strfind(p,':')-1];
if length(Ibeg),
    p2=[];
    for ii=1:length(Ibeg),
        name=p(Ibeg(ii):Iend(ii));
        if ~length(strfind(name,'/.AppleDouble'))
            p2=[p2 ':' name ];
        end
    end
    p2(1)=[]; p2(end+1)=':';
end
addpath(p2)

conf.datadir         = [conf.processdir 'final_dataset_prof/'];
conf.plotdir         = [conf.processdir 'final_dataset_prof/'];
conf.temporary       = [conf.processdir 'temporary/'];
conf.temporary_fcell = [conf.processdir 'temporary/'];
conf.json            = conf.processdir;

% create process_dir if not already existing
if ~exist(conf.processdir,'dir'),
    try,
        [s,mess,messid] = mkdir(conf.processdir);
        [s,mess,messid] = mkdir(conf.datadir);
        [s,mess,messid] = mkdir(conf.temporary);
        disp(['Processing done in: ' conf.processdir])
        cd(conf.processdir);
    end
else
    cd(conf.processdir);
end



