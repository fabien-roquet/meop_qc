%% script for adjustment of locations based on CLS post-processed data

% adjust locations
conf.list_cls_locations    = dir([conf.locdir,'*.smoothing.csv']);
conf.ptt_cls_locations     = {};
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
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = info_deployment.list_smru_name{index};
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
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
    
    ptt = ncreadatt (name_prof,'/','ptt');
    I = find(ismember(conf.cls_locations_ptt,ptt)); J=[];
    if isempty(I), continue, end
    for ii=1:length(I),
        if datemin > conf.cls_locations_datemin_jul(I(ii))-300 ...
                && datemax < conf.cls_locations_datemax_jul(I(ii))+300
            J=I(ii);
        end
    end
    I=J;
    if isempty(I), continue, end
    disp(sprintf('%8s %s',ptt,smru_name))
    
    cls_file_name = conf.list_cls_locations(I).name;
    fid = fopen([conf.locdir,cls_file_name]);
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
    
    newlat = interp1(clsjul(J),clslat(J),jul,'linear','extrap');
    newlon = interp1(clsjul(J),clslon(J),jul,'linear','extrap');
    Inan = find(jul < min(clsjul(J))-1 | jul > max(clsjul(J))+1);
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
    
    figure(1),clf,plot(newlon,newlat,'+-',lon,lat)
    if length(Inan)~=0, title(sprintf('%8s %s : with missing data',ptt,smru_name))
    else, title(sprintf('%8s %s',ptt,smru_name))
    end
    legend('new','old')
    format_figure_centred([12 12])
    plotdir = [conf.plotdir,info_deployment.NATION,'/',info_deployment.EXP,'/'];
    [s,mess,messid] = mkdir(plotdir);
    print(sprintf('%slocation_%s%s_%08s',plotdir,smru_name,suffix,ptt),'-dpng','-r300')
    
    ncwriteatt(name_prof,'/','loc_algorithm','S');
    ncwrite   (name_prof,'POSITIONING_SYSTEM',repmat('SK      ',Nprof,1)');
    ncwrite   (name_prof,'LATITUDE' ,newlat);
    ncwrite   (name_prof,'LONGITUDE',newlon);

end

