function locs = load_crawl_data(conf,smru_name,ptt,jul)

if isempty(conf),
    conf = init_mirounga;
end

locs=[];

I = find(ismember(conf.crawl.ptt,ptt) & ismember(conf.crawl.smru_name,smru_name));
if isempty(I), 
    return
end

file_name = fullfile(conf.crawl.locdir,conf.crawl.list(I(1)).name);
opts = detectImportOptions(file_name,'delimiter',',','ReadVariableNames',1);
opts.SelectedVariableNames = {'GMT','mu_x','mu_y'};
data = readtable(file_name,opts);
data.Properties.VariableNames = {'date','lon','lat'};
data{data{:,'lon'}>180,'lon'}=data{data{:,'lon'}>180,'lon'}-360;

locs.jul = datenum(data{:,'date'});
locs.lat = data{:,'lat'};
locs.lon = data{:,'lon'};

