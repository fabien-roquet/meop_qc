%% script for adjustment of locations based on CLS post-processed data

%%
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_lr0');
    ptt = ncreadatt (name_prof,'/','ptt');
    I = find(ismember(conf.crawl.ptt,ptt) & ismember(conf.crawl.smru_name,smru_name));
    if isempty(I), continue, end
    disp(sprintf('CRAWL locations: PTT %8s, SMRU %s',ptt,smru_name))

    file_name = fullfile(conf.crawl.locdir,conf.crawl.list(I(1)).name);
    opts = detectImportOptions(file_name,'delimiter',',','ReadVariableNames',1);
    opts.SelectedVariableNames = {'GMT','mu_x','mu_y'};
    data = readtable(file_name,opts);
    data.Properties.VariableNames = {'date','lon','lat'};
    data{data{:,'lon'}>180,'lon'}=data{data{:,'lon'}>180,'lon'}-360;
    crawl_jul = datenum(data{:,'date'});
    
    list_suffix = {'_lr0','_hr0','_fr0'};
    figure('visible','off') ,clf
    plot(data{:,'lon'},data{:,'lat'}), hold on
    for ksuffix = 1:length(list_suffix),
    
        name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,list_suffix{ksuffix});
        if ~exist(name_prof,'file'), continue; end

        finfo = ncinfo(name_prof);
        dimNames = {finfo.Dimensions.Name};
        dimMatch = strcmp(dimNames,'N_PROF');
        Nprof = finfo.Dimensions(dimMatch).Length;
        lat = ncread(name_prof,'LATITUDE');
        lon = ncread(name_prof,'LONGITUDE');
        jul = ncread(name_prof,'JULD')+712224;
        datemin = min(jul);
        datemax = max(jul);
        ktag = find(ismember(conf.list_deployment_code,EXP));
        if strcmp(conf.platform_json(ktag).loc_algorithm,'K')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('K       ',Nprof,1)');
        end
        if strcmp(conf.platform_json(ktag).loc_algorithm,'L')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('LS      ',Nprof,1)');
        end
        if length(lat)<3, continue, end 
    
        newlat = interp1(crawl_jul,data{:,'lat'},jul,'linear','extrap');
        newlon = interp1(crawl_jul,data{:,'lon'},jul,'linear','extrap');
        Inan = find(jul < min(crawl_jul)-1 | jul > max(crawl_jul)+1);
        newlat(Inan) = lat(Inan);
        newlon(Inan) = lon(Inan);
        if length(Inan)~=0, 
            disp([smru_name ': missing data , ' num2str(length(Inan))]); 
        end
    
        ncwriteatt(name_prof,'/','loc_algorithm','S');
        ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('SK2     ',Nprof,1)');
        ncwrite   (name_prof,'LATITUDE' ,newlat);
        ncwrite   (name_prof,'LONGITUDE',newlon);

        if strcmp(list_suffix{ksuffix},'_lr0')
            plot(lon,lat,'x',newlon,newlat,'+')
        end

    end

    title(sprintf('CRAWL loc: %8s %s',ptt,smru_name))
    legend('crawl','old lr','new lr')
    format_figure_centred([15 15])
    plotdir = [conf.plotdir,info_deployment.EXP,'/'];
    [s,mess,messid] = mkdir(plotdir);
    print(sprintf('%slocation_crawl_%s_%08s',plotdir,smru_name,ptt),'-dpng','-r300')
    
end

