%% conf.update_input_data=1

clear all; close all;

%config = 'fabien';
config = 'fabienlinux';
%config = 'baptistelinux';
%config = 'baptistewindow';

name_json = ['../python_toolbox/config.json'];
filetext = fileread(name_json);
d = jsondecode(filetext);

conf = getfield(d.config,config);
tasks = fieldnames(d.tasks);
for kk=1:length(tasks),
    conf = setfield(conf,tasks{kk},getfield(d.tasks,tasks{kk}));
end
conf.version     = d.version.CTDnew;
conf.version_old = d.version.CTDold;
conf.version_SMS = d.version.SMSnew;

addpath(genpath(conf.matlabdir))
addpath(genpath(conf.pythondir))

conf.json            = [conf.pythondir 'config_scripts/json_files/'];

% update deployment.json
fic = dir([conf.json 'deployment2.json']); datefic = fic.datenum;
copyfile([conf.json 'deployment2.json'],[conf.json 'deployment2_' datestr(datefic,'yyyymmdd') '.json']);
copyfile([conf.inputdir '../deployment2.json'],[conf.json 'deployment2.json']);

% update platform.json
fic = dir([conf.json 'platform2.json']); datefic = fic.datenum;
copyfile([conf.json 'platform2.json'],[conf.json 'platform2_' datestr(datefic,'yyyymmdd') '.json']);
copyfile([conf.inputdir '../platform2.json'],[conf.json 'platform2.json']);

ldir = dir(conf.inputdir);
for kk=1:length(ldir),
    prefix = sprintf('%s%s/%s_ODV',conf.inputdir,ldir(kk).name,ldir(kk).name);
    if exist([prefix '.zip']),
        if exist([prefix '.txt']),
            copyfile([prefix '.txt'],[prefix '_' datestr(now,'yyyymmdd') '.txt']);
            unzip([prefix '.zip'],sprintf('%s%s',conf.inputdir,ldir(kk).name));
            fic1 = dir([prefix '.txt']);
            fic2 = dir([prefix '_' datestr(now,'yyyymmdd') '.txt']);
            if fic1.bytes == fic2.bytes
                delete([prefix '_' datestr(now,'yyyymmdd') '.txt']);
            else
                prefix2 = sprintf('%s%s_ODV',conf.rawdir,ldir(kk).name);
                if exist([prefix2 '.txt'])
                    fic3 = dir([prefix2 '.txt']);
                    if fic1.bytes ~= fic3.bytes
                        copyfile([prefix2 '.txt'],[prefix2 '_' datestr(now,'yyyymmdd') '.txt']);
                    end
                end
                copyfile([prefix '.txt'],conf.rawdir)
                disp([ldir(kk).name 'raw ODV file updated']);
            end
        else
            unzip([prefix '.zip'],sprintf('%s%s',conf.inputdir,ldir(kk).name));
            fic1 = dir([prefix '.txt']);
            prefix2 = sprintf('%s%s_ODV',conf.rawdir,ldir(kk).name);
            if exist([prefix2 '.txt'])
                fic3 = dir([prefix2 '.txt']);
                if fic1.bytes ~= fic3.bytes
                    copyfile([prefix2 '.txt'],[prefix2 '_' datestr(now,'yyyymmdd') '.txt']);
                    copyfile([prefix '.txt'],conf.rawdir)
                    disp([ldir(kk).name 'raw ODV file updated']);
                end
            else
                copyfile([prefix '.txt'],conf.rawdir)
                disp([ldir(kk).name 'raw ODV file updated']);
            end
        end
    end
end
