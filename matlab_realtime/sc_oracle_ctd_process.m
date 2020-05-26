%% set up environment
cd("/Users/roquet/pc207_home/GitHub/meop_qc/matlab_realtime")
conf.matlabdir = '../matlab_toolbox/';
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

%% load data
data = load("Recent_CTD_Casts_20191004173731.mat");
data = data.recent_ctd_table;
data.smru_name = data.GREF;
for k=1:length(data.smru_name),
    data.smru_name{k} = sprintf('%s-%s-%02d',data.GREF{k},data.NAME{k},...
        data.YEAR(k)-fix(data.YEAR(k)/100)*100);
end

%% PLATFORM_CODE taken as PTT
[conf.list_smru_platform_code,I] = unique(data.smru_name);
for kk=1:length(conf.list_smru_platform_code),
    conf.platform_json(kk).platform_code = num2str(data.PTT(I(kk)));
end
conf.datadir = './';

ktag = 2;
one_smru_name = conf.list_smru_platform_code{ktag};
table = data(strcmp(one_smru_name,data.smru_name),:);

EXP=table.GREF{1};
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(sprintf('%s%s',conf.datadir,EXP));
sc_load_table2prof;

%%
info_deployment.EXP      = EXP;
info_deployment.dir      = ['./' EXP '/'];
conf.table_param = [];

smru_name = one_smru_name;
suffix = '_lr0';
name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
sc_filtre_seals_qc;    

%%




