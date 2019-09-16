
%% Creation du fichier nc timeseries
ficout = sprintf('%s/%s_traj.nc',info_deployment.dir,smru_name);
delete(ficout);
%     prof_pres_cor=P-(P*coef.p1+coef.p2);
%     prof_temp_cor=T-(prof_pres_cor*coef.t1+coef.t2);
%     prof_sal_cor=S-(prof_pres_cor*coef.s1+coef.s2);
prof_pres_cor=P;
prof_temp_cor=T;
prof_sal_cor=S;
prof_fluo_cor=F;
prof_oxy_cor=O;
latinterp=interp1(date(Ihead),lat,date);
loninterp=interp1(date(Ihead),lon,date);


nccreate(ficout,'TIME', 'Dimensions',...
    {'TIME' length(P)},'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'TIME','units','days since 1950-01-01 00:00:00 UTC');
nccreate(ficout,'LATITUDE', 'Dimensions',...
    {'TIME' },'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'LATITUDE','units','degree_north');
nccreate(ficout,'LONGITUDE', 'Dimensions',...
    {'TIME' },'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'LONGITUDE','units','degree_east');
nccreate(ficout,'PRES', 'Dimensions',...
    {'TIME' },'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'PRES','units','SEA PRESSURE');
nccreate(ficout,'TEMP', 'Dimensions',...
    {'TIME'},'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'TEMP','units','degree_Celsius');
nccreate(ficout,'PSAL', 'Dimensions',...
    {'TIME'},'Datatype','single','FillValue',single(99999));
ncwriteatt(ficout,'PSAL','units','PRACTICAL SALINITY');
ncwrite(ficout,'TIME',single(date-datenum(1950,1,1)));
ncwrite(ficout,'TEMP',single(prof_temp_cor));
ncwrite(ficout,'PSAL',single(prof_sal_cor));
ncwrite(ficout,'PRES',single(prof_pres_cor));
if isfluo
    nccreate(ficout,'CHLA', 'Dimensions',...
        {'TIME'},'Datatype','single','FillValue',single(99999));
    ncwriteatt(ficout,'CHLA','units','mg/m3');
    ncwrite(ficout,'CHLA',single(prof_fluo_cor));
end
if isoxy
    nccreate(ficout,'DOXY', 'Dimensions',...
        {'TIME'},'Datatype','single','FillValue',single(99999));
    ncwriteatt(ficout,'DOXY','units','micromole/kg');
    ncwrite(ficout,'DOXY',single(prof_oxy_cor));
end
ncwrite(ficout,'LATITUDE',single(latinterp));
ncwrite(ficout,'LONGITUDE',single(loninterp));


for ii=1:length(listatt),
    k=strfind(listatt{ii},'number');
    if length(k)==0
        ncwriteatt(ficout,'/',listatt{ii},getfield(data_att,listatt{ii}));
    end
end

%
ncwriteatt(ficout,'/','DATE_CREATION',datestr(now(),'yyyymmddHHMMSS'));

name_prof = ficout;
sc_write_global_attribute;


