function locs = load_cls_data(conf,smru_name,ptt,jul)

if isempty(conf),
    conf = init_mirounga;
end

locs=[];

datemin = min(jul);
datemax = max(jul);
I = find(ismember(conf.cls.ptt,ptt));
if isempty(I),
    return
end

J=[];
for ii=1:length(I),
    if datemin > conf.cls.datemin_jul(I(ii))-300 ...
            && datemax < conf.cls.datemax_jul(I(ii))+300
        J=I(ii);
    end
end
if isempty(J), 
    return
end
I=J;

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

I=find(diff(clsjul)>0);
locs.jul = clsjul(I);
locs.lat = clslat(I);
locs.lon = clslon(I);

