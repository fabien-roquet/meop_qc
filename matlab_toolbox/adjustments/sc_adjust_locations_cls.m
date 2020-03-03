%% script for adjustment of locations based on CLS post-processed data

%%
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_lr0');
    ptt = ncreadatt (name_prof,'/','ptt');
    jul = ncread(name_prof,'JULD')+712224;
    datemin = min(jul);
    datemax = max(jul);
    I = find(ismember(conf.cls.ptt,ptt));
    if isempty(I), continue, end
    J=[];
    for ii=1:length(I),
        if datemin > conf.cls.datemin_jul(I(ii))-300 ...
                && datemax < conf.cls.datemax_jul(I(ii))+300
            J=I(ii);
        end
    end
    if isempty(J), continue, end
    I=J;
    disp(sprintf('CLS locations: PTT %8s, SMRU %s',ptt,smru_name))

    cls_file_name = conf.cls.list(I).name;
    fid = fopen([conf.cls.locdir,cls_file_name]);
    data = textscan(fid,...
        '%*s%f%f%f%f%s%s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s',...
        'delimiter',';','headerlines',1);
    fclose(fid);
    clslat = data{1};
    clslon = data{2}; clslon(clslon>180)=clslon(clslon>180)-360;
    clslat2= data{3};
    clslon2= data{4}; clslon2(clslon2>180)=clslon2(clslon2>180)-360;
    clsqua = data{5};
    clsjul = datenum(data{6});
    [a,J]  = sort(clsjul);
    [c,ia,ic] = unique(clsjul(J)); J=J(ia);
    ia = find(~strcmp(clsqua(J),'Z')); J=J(ia);
    diff1 = abs(clslon2-clslon)+abs(clslat2-clslat);
    I=find(diff1~=0); I(I==1)=[];
    dist1= abs(clslon(I)-clslon(I-1))+abs(clslat(I)-clslat(I-1));
    dist2= abs(clslon2(I)-clslon2(I-1))+abs(clslat2(I)-clslat2(I-1));
    for ii=1:length(I),
        if dist2(ii)<dist1(ii)
            clslon(I(ii))=clslon2(I(ii));
            clslat(I(ii))=clslat2(I(ii));
        end
    end
    %figure(2),clf,plot(clslon,clslat,'+-',clslon2,clslat2,'+-')
    
    list_suffix = {'_lr0','_hr0','_fr0'};
    figure('visible','off') ,clf
    plot(clslon,clslat,'-'),hold on
    xlim(get(gca,'xlim'))
    ylim(get(gca,'ylim'))
    plot(clslon2,clslat2,':')
    for ksuffix = 1:length(list_suffix),
    
        name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
        if ~exist(name_prof,'file'), continue; end
    
        finfo = ncinfo(name_prof);
        dimNames = {finfo.Dimensions.Name};
        dimMatch = strcmp(dimNames,'N_PROF');
        Nprof = finfo.Dimensions(dimMatch).Length;
        lat = ncread(name_prof,'LATITUDE');
        lon = ncread(name_prof,'LONGITUDE');
        ktag = find(ismember(conf.list_deployment_code,EXP));
        if strcmp(conf.platform_json(ktag).loc_algorithm,'K')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('K       ',Nprof,1)');
        end
        if strcmp(conf.platform_json(ktag).loc_algorithm,'L')
            ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('LS      ',Nprof,1)');
        end
        if length(lat)<3, continue, end
        
        I=find(diff(clsjul)>0);
        newlat = interp1(clsjul(I),clslat(I),jul,'linear','extrap');
        newlon = interp1(clsjul(I),clslon(I),jul,'linear','extrap');
        Inan = find(jul < min(clsjul)-1 | jul > max(clsjul)+1);
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

        if strcmp(list_suffix{ksuffix},'_lr0')
            plot(lon,lat,'x',newlon,newlat,'+')
        end

    end

    title(sprintf('CLS loc: %8s %s',ptt,smru_name))
    legend('cls data','cls data 2','old lr','new lr')
    format_figure_centred([15 15])
    plotdir = [conf.plotdir,info_deployment.EXP,'/'];
    [s,mess,messid] = mkdir(plotdir);
    print(sprintf('%slocation_cls_%s_%08s',plotdir,smru_name,ptt),'-dpng','-r300')
        
end

