%% script for adjustment of locations based on CLS post-processed data

%%
info_deployment = load_info_deployment(conf,EXP,one_smru_name);
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_lr0');
    ptt = ncreadatt (name_prof,'/','ptt');
    jul = ncread(name_prof,'JULD')+712224;
    locsystem = ncreadatt (name_prof,'/','loc_algorithm');
    plot_on=1; if strcmp(locsystem,'S'), plot_on=0; end
    locs = load_crawl_data(conf,smru_name,ptt,jul);
    if isempty(locs), 
        locs = load_cls_data(conf,smru_name,ptt,jul);
        if isempty(locs),
            return
        else
            type_loc='cls';
        end
    else
        type_loc='crawl';        
    end
    disp(sprintf('%s locations: PTT %8s, SMRU %s',type_loc,ptt,smru_name))
        
    list_suffix = {'_lr0','_hr0','_fr0'};
    
    if plot_on
        figure('visible','off') ,clf
        plot(locs.lon,locs.lat,'-'),hold on
        xlim(get(gca,'xlim'))
        ylim(get(gca,'ylim'))
    end
    
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
        ktag = find(ismember(conf.list_deployment_code,EXP));
        if strcmp(conf.platform_json(ktag).loc_algorithm,'K')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('K       ',Nprof,1)');
        end
        if strcmp(conf.platform_json(ktag).loc_algorithm,'L')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('LS      ',Nprof,1)');
        end
        if length(lat)<3, continue, end 
    
        newlat = interp1(locs.jul,locs.lat,jul,'linear','extrap');
        newlon = interp1(locs.jul,locs.lon,jul,'linear','extrap');
        Inan = find(jul < min(locs.jul)-1 | jul > max(locs.jul)+1);
        newlat(Inan) = lat(Inan);
        newlon(Inan) = lon(Inan);
        if length(Inan)~=0, 
            disp([smru_name ': missing data , ' num2str(length(Inan))]); 
        end
    
        % speed filter 3m/s
        dist = spheredist(newlat,newlon);
        velo = diff(dist)./diff(jul)/86.4; % in m/s
        I=find(velo>3); Ibad = intersect(I,I+1); Ibad=setdiff(Ibad,[1 length(dist)]);
        if length(Ibad)>0
            jul1=jul; jul1(Ibad)=[]; lat1=newlat; lat1(Ibad)=[]; lon1=newlon; lon1(Ibad)=[];
            newlat(Ibad) = interp1(jul1,lat1,jul(Ibad));
            newlon(Ibad) = interp1(jul1,lon1,jul(Ibad));
        end
    
        ncwriteatt(name_prof,'/','loc_algorithm','S');
        ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('SK      ',Nprof,1)');
        ncwrite   (name_prof,'LATITUDE' ,newlat);
        ncwrite   (name_prof,'LONGITUDE',newlon);

        if plot_on & strcmp(list_suffix{ksuffix},'_lr0')
            plot(lon,lat,'x',newlon,newlat,'+')
        end

    end

    if plot_on
        title(sprintf('%s loc: %8s %s',type_loc,ptt,smru_name))
        legend(type_loc,'old lr','new lr')
        format_figure_centred([15 15])
        plotdir = [conf.plotdir,info_deployment.EXP,'/'];
        [s,mess,messid] = mkdir(plotdir);
        print(sprintf('%slocation_%s_%08s',plotdir,smru_name,ptt),'-dpng','-r300')
    end
    
end

