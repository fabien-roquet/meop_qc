%% initialization of the mirounga processing system

cd(conf.maindir)

conf.rawdir          = [conf.maindir 'original_datasets/'];
conf.locdir          = [conf.maindir 'original_datasets/original_cls_locations/'];
conf.rawdir_hr       = [conf.maindir 'original_datasets/original_hr_datasets/'];

conf.datadir         = [conf.maindir 'final_dataset_prof/'];
conf.datadir_traj    = [conf.maindir 'final_dataset_traj/'];
conf.datadir_ODV     = [conf.maindir 'final_dataset_csv/'];

conf.logdir          = [conf.maindir 'log/'];
conf.mapsdir         = [conf.maindir 'maps/'];
conf.texdir          = [conf.maindir 'doc_latex/'];
conf.plotdir         = [conf.maindir 'plots/'];
conf.calibplotdir    = [conf.maindir 'calibration_plots/'];

conf.builddir        = [conf.matlabdir 'config_scripts/build_fcell/'];
conf.confplot        = [conf.matlabdir 'config_scripts/config_plots/'];
conf.adjustment      = [conf.matlabdir 'config_scripts/compute_adjustments/'];
conf.json            = [conf.matlabdir 'config_scripts/json_files/'];
conf.csv_config      = [conf.matlabdir 'config_scripts/csv_config_files/'];

conf.temporary       = [conf.maindir 'temporary/'];
conf.temporary_tex   = [conf.maindir 'temporary/tex/'];
conf.temporary_fcell = [conf.maindir 'temporary/fcell/'];

[s,mess,messid] = mkdir(conf.logdir);
[s,mess,messid] = mkdir(conf.datadir);
[s,mess,messid] = mkdir(conf.datadir_traj);
[s,mess,messid] = mkdir(conf.datadir_ODV);
[s,mess,messid] = mkdir(conf.logdir);
[s,mess,messid] = mkdir(conf.mapsdir);
[s,mess,messid] = mkdir([conf.mapsdir 'deployments']);
[s,mess,messid] = mkdir([conf.mapsdir 'groups']);
[s,mess,messid] = mkdir([conf.mapsdir 'global']);
[s,mess,messid] = mkdir(conf.texdir);
[s,mess,messid] = mkdir(conf.plotdir);
[s,mess,messid] = mkdir(conf.calibplotdir);
[s,mess,messid] = mkdir(conf.matlabdir);
[s,mess,messid] = mkdir(conf.temporary);
[s,mess,messid] = mkdir(conf.temporary_tex);
[s,mess,messid] = mkdir(conf.temporary_fcell);

conf.create_ncargo      = 0;   % process raw data
conf.create_fr0         = 0;   % process fully-resolved datasets
conf.update_metadata    = 0;   % set metadata in ncARGO files
conf.apply_adjustments  = 0;   % apply adjustments in ncARGO files
conf.apply_tlc          = 0;   % apply thermal lag correction
conf.generate_odv4      = 0;   % generate odv4 files (both normal and STD standard levels)
conf.generate_plot1     = 0;   % create adjustment plots
conf.generate_plot2     = 0;   % create diagnostic plots and pdfs
conf.global_diagnostics = 0;   % compute global maps
conf.update_public_data = 0;   % upload adjusted datasets on public ftp folder

%% update matlab path
addpath(conf.datadir)

%% read list deployment
name_meta=[conf.csv_config 'list_deployment.csv'];
if exist(name_meta,'file')
    fid=fopen(name_meta);
    list_deployment=textscan(fid,'%s %s %d %d %s %d', ...
        'delimiter', ',',...
        'Headerlines',1);
    fclose(fid);
else
    disp('WARNING: the file list_deployment.txt was not found!')
    return
end

%% read list deploymet CTD HR
name_meta=[conf.csv_config 'list_deployment_hr.csv'];
if exist(name_meta,'file')
    fid=fopen(name_meta);
    list_deployment_hr=textscan(fid,'%s %s %d %s %d', ...
        'delimiter', ';',...
        'Headerlines',1);
    fclose(fid);
else
    disp('WARNING: the file list_deployment_hr.csv was not found!')
    return
end

%% for early deployments with two ODV version, concatenate files keeping only highest resolution data
list_ex={'ct10','ct12','ct17'};
for ii=1:length(list_ex)
    if ~exist([conf.rawdir list_ex{1,ii} 'r' '_ODV.txt'],'file'),
        continue,
    end
    fid = fopen([conf.rawdir list_ex{1,ii} 'r' '_ODV.txt']);
    tline = fgetl(fid);
    tline = fgetl(fid);
    fclose(fid);
    J=find(strcmp([list_ex{1,ii}],list_deployment{:,1}));
    [tagr,numProfr,typer,dater,lonr,latr,Dr,Pr,Tr,Sr,Fr,Or,Cr] = ...
        textread([conf.rawdir list_ex{1,ii} 'r' '_ODV.txt'],'%s%s%s%s%s%s%s%f%f%f%f%f%f',...
        'delimiter',';','headerlines',2);
    copyfile([conf.rawdir list_ex{1,ii} 'r' '_ODV.txt'],[conf.rawdir list_ex{1,ii} 'r' 'save_ODV.txt'],'f');
    [tag,numProf,type,date,lon,lat,D,P,T,S,F,O,C] = ...
        textread([conf.rawdir list_deployment{1,1}{J} '_ODV.txt'],'%s%s%s%s%s%s%s%f%f%f%f%f%f',...
        'delimiter',';','headerlines',2);
    copyfile([conf.rawdir list_deployment{1,1}{J} '_ODV.txt'],[conf.rawdir list_deployment{1,1}{J} 'save_ODV.txt'],'f');
    tagr=regexprep(tagr,'r','');
    indr=unique(tagr(~strcmp(tagr,'')));
    ind=unique(tag(~strcmp(tag,'')));
    U=intersect(indr,ind);
    fileID = fopen([conf.rawdir list_ex{1,ii} 'temp_ODV.txt'],'w');
    tline2='Cruise;Station;Type;yyyy-mm-dd hh:mm;Longitude [degrees_east];Latitude [degrees_north];Bot. Depth [m];Pressure [dbar];Temperature [C];Salinity [PSU];Fluorescence;Oxygen [umol/l]';
    fprintf(fileID,'%s\n','// Generic ODV file');
    fprintf(fileID,'%s\n',tline2);
    Tr2=Tr; Tr2(Tr2<-3|Tr2>40)=NaN;
    Cr2=Cr; Cr2(Cr2<10|Cr2>50)=NaN;
    Sr=sw_salt_from_cond(Cr2,Tr2,Pr); Sr(isnan(Sr))=999;
    for jj=1:length(U)
        I=find(strcmp(U(jj),tagr));
        fin=I(end)+1;
        while fin <=length(Tr) & strcmp(tagr(fin),'')
            fin=fin+1;
        end
        for kk=I(1):fin-1
            fprintf(fileID,'%s;%s;%s;%s;%s;%s;%s;%3.4f;%3.4f;%3.4f;%3.4f;%3.4f\n',...
                tagr{kk},numProfr{kk},typer{kk},dater{kk}...
                ,lonr{kk},latr{kk},Dr{kk},Pr(kk),Tr(kk)...
                ,Sr(kk),Fr(kk),Or(kk));
        end
    end
    U=setdiff(ind,indr);
    T2=T; T2(T2<-3|T2>40)=NaN;
    C2=C; C2(C2<10|C2>50)=NaN;
    S=sw_salt_from_cond(C2,T2,P); S(isnan(S))=999;
    for jj=1:length(U)
        I=find(strcmp(U(jj),tag));
        fin=I(end)+1;
        while fin <=length(T) & strcmp(tag(fin),'')
            fin=fin+1;
        end
        for kk=I(1):fin-1
            fprintf(fileID,'%s;%s;%s;%s;%s;%s;%s;%3.4f;%3.4f;%3.4f;%3.4f;%3.4f\n',...
                tag{kk},numProf{kk},type{kk},date{kk}...
                ,lon{kk},lat{kk},D{kk},P(kk),T(kk)...
                ,S(kk),F(kk),O(kk));
        end
    end
    fclose(fileID);
    copyfile([conf.rawdir list_deployment{1,1}{J} 'temp_ODV.txt'],[conf.rawdir list_deployment{1,1}{J} '_ODV.txt'],'f');
    delete([conf.rawdir list_deployment{1,1}{J} 'temp_ODV.txt']);
    delete([conf.rawdir list_deployment{1,1}{J} 'r_ODV.txt']);
    
end

%% for early deployment ct1, merge temperature and salinity profiles
list_ex={'ct1','ct6'};
for ii=1:length(list_ex)
    if ~exist([conf.rawdir list_ex{1,ii} '_ODV.txt'],'file') | exist([conf.rawdir list_ex{1,ii} 'save_ODV.txt'],'file'),
        continue,
    end
    fid = fopen([conf.rawdir list_ex{1,ii} '_ODV.txt']);
    tline = fgetl(fid);
    tline = fgetl(fid);
    fclose(fid);
    [tag,numProf,date,lon,lat,P,T,S] = ...
        textread([conf.rawdir list_ex{1,ii} '_ODV.txt'],'%s%s%*s%s%f%f%*s%f%f%f%*f%*f',...
        'delimiter',';','headerlines',2);
    copyfile([conf.rawdir list_ex{1,ii} '_ODV.txt'],[conf.rawdir list_ex{1,ii} 'save_ODV.txt'],'f');
    fileID = fopen([conf.rawdir list_ex{1,ii} '_ODV.txt'],'w');
    fprintf(fileID,'%s\n','// Generic ODV file');
    fprintf(fileID,'%s\n',tline);
    nheadline=[find(~strcmp(tag,''));length(tag)+1];
    jj=1; nprof=1;
    while jj<length(nheadline)-1
        if strcmp(date(nheadline(jj)),date(nheadline(jj+1))),
            I1=nheadline(jj):nheadline(jj+1)-1;
            I2=nheadline(jj+1):nheadline(jj+2)-1;
            [Psort1,Isort1]=sort(P(I1));
            [Psort2,Isort2]=sort(P(I2));
            [Pinters,K1,K2]=intersect(Psort1,Psort2);
            T(I1(K1))=T(I2(K2));
            Itot=setdiff([I1 I2],I2(K2));
            [Psort,Itot2]=sort(P(Itot));
            Itot=Itot(Itot2);
            fprintf(fileID,'%s;%d;B;%s;%3.4f;%3.4f;0;%3.4f;%3.4f;%3.4f;999.0000;999.0000\n',...
                tag{nheadline(jj)},nprof,date{nheadline(jj)},lon(nheadline(jj)),lat(nheadline(jj)),P(Itot(1)),T(Itot(1)),S(Itot(1)));
            for kk=2:length(Itot)
                fprintf(fileID,';;;;;;;%3.4f;%3.4f;%3.4f;999.0000;999.0000\n',P(Itot(kk)),T(Itot(kk)),S(Itot(kk)));
            end
            jj=jj+2; nprof=nprof+1;
        else
            Itot=nheadline(jj):nheadline(jj+1)-1;
            fprintf(fileID,'%s;%d;B;%s;%3.4f;%3.4f;0;%3.4f;%3.4f;%3.4f;999.0000;999.0000\n',...
                tag{nheadline(jj)},nprof,date{nheadline(jj)},lon(nheadline(jj)),lat(nheadline(jj)),P(Itot(1)),T(Itot(1)),S(Itot(1)));
            for kk=2:length(Itot)
                fprintf(fileID,';;;;;;;%3.4f;%3.4f;%3.4f;999.0000;999.0000\n',P(Itot(kk)),T(Itot(kk)),S(Itot(kk)));
            end
            jj=jj+1; nprof=nprof+1;
        end
    end
    fclose(fileID);
end

%% update json and ODV files

if conf.update_input_data
    
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
end

%% load metadata
deployment=loadjson([conf.json 'deployment2.json']);

deployment_code={};
for kk=1:length(deployment),
    deployment_code{kk} = deployment{kk}.deployment_code;
end

deployment_patch=loadjson([conf.json 'deployment2_patch.json']);
for kk=1:length(deployment_patch),
    if ~ismember(deployment_patch{kk}.deployment_code,deployment_code),
        deployment={deployment{:},deployment_patch{kk}};
    end
end
conf.deployment=deployment;

list=[];
list_ex={'ct10r','ct12r','ct17r'};
ind=1;
for ii=1:length(deployment)
    I=find(strcmp(deployment{1,ii}.deployment_code,list_deployment{:,1}));
    if length(I)==0 & sum(strcmp(deployment{1,ii}.deployment_code,list_ex(1,:)))==0
        disp(sprintf('%s must be added in list_deployment.csv',deployment{1,ii}.deployment_code));    
    elseif sum(strcmp(deployment{1,ii}.deployment_code,list_ex(1,:)))==0
        list{ind,1}=list_deployment{1,1}{I};
        list{ind,2}=list_deployment{1,2}{I};
        list{ind,3}=list_deployment{1,3}(I);
        list{ind,4}=list_deployment{1,4}(I);
        list{ind,5}=list_deployment{1,5}{I};
        list{ind,6}=list_deployment{1,6}(I);
        ind=ind+1;
    end
end
warning off
conf.list_ficseals=list;

%% build deployment list
platform=loadjson([conf.json 'platform2.json']);
deployment_code={};
for kk=1:length(platform),
    deployment_code{kk} = platform{kk}.deployment_code;
end

platform_patch=loadjson([conf.json 'platform2_patch.json']);
for kk=1:length(platform_patch),
    if ismember(platform_patch{kk}.deployment_code,{conf.list_ficseals{:,1}}) ...
            && ~ismember(platform_patch{kk}.deployment_code,deployment_code),
        platform={platform{:},platform_patch{kk}};
    end
end
conf.platform=platform;

%% add platform information
N_platform = length(conf.platform);
conf.lfic={conf.list_ficseals{:,1}}';
conf.calib_coeff = [];

%% add platform information based on deployment.json
list_deployment_code = {};
for ii=1:length(deployment),
    list_deployment_code{ii} = deployment{ii}.deployment_code;
end

for kk=1:length(platform),
    deployment_code = conf.platform{kk}.deployment_code;
    Idep = find(strcmp(deployment_code,list_deployment_code));
    if length(Idep)>0
        conf.platform{kk}.description = deployment{Idep}.description;
        conf.platform{kk}.gts = deployment{Idep}.gts;
    else
        conf.platform{kk}.description ='unknown';
        conf.platform{kk}.gts ='unknown';
    end
end

%% build group list
conf.list_group=unique(conf.list_ficseals(:,5));
conf.list_color= linspecer(length(conf.list_group));
conf.Itag_group={};
for kk=1:length(conf.list_group),
    conf.Itag_group{kk}=find(strcmp(conf.list_group{kk},conf.list_ficseals(:,5)));
end

%% extract start_date
conf.start_date=cell(length(conf.lfic),1);
start_date=cell(length(conf.platform),1);
deployment_code=cell(length(conf.platform),1);
for kk=1:length(conf.platform)
    start_date{kk}=conf.platform{kk}.time_coverage_start;
    deployment_code{kk}=conf.platform{kk}.deployment_code;
end
[deployment_code,Idep]=unique(deployment_code,'stable');
start_date=start_date(Idep);
for kk=1:length(deployment_code)
    index = find(strcmp(conf.lfic,deployment_code{kk}));
    if length(index)>0
        conf.start_date{index(1)}=start_date{kk};
    end
end

%% create a list of smru_platform_code
list_smru_platform_code={};
for ii=1:length(conf.platform)
    list_smru_platform_code{ii}=conf.platform{1,ii}.smru_platform_code;
end

%% read metata updates
conf.table_tag_updates = readtable([conf.csv_config 'metadata_update_table.csv'],'delimiter',',');

%% create list of ptt vs location files from conf.locdir
conf.list_cls_locations    = dir([conf.locdir,'*.smoothing.csv']);
conf.ptt_cls_locations     = {};
conf.cls_locations_ptt     = {};
conf.cls_locations_datemin = {};
conf.cls_locations_datemax = {};
for kk=1:length(conf.list_cls_locations)
    c = strsplit(conf.list_cls_locations(kk).name,{'_','.'});
    conf.cls_locations_ptt{kk} = c{1};
    conf.cls_locations_datemin{kk} = c{2};
    conf.cls_locations_datemax{kk} = c{3};
end
conf.cls_locations_datemin_jul = datenum(conf.cls_locations_datemin);
conf.cls_locations_datemax_jul = datenum(conf.cls_locations_datemax);

%%


