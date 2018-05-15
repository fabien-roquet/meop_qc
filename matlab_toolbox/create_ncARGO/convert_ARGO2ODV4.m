function convert_ARGO2ODV4(argo_data,path)


warning off

PRES=argo_data.PRES;
TEMP=argo_data.TEMP;
SALI=argo_data.PSAL;
Pmask=double(argo_data.PRES_QC==1);
Tmask=double(argo_data.TEMP_QC==1);
Smask=double(argo_data.PSAL_QC==1);
index=Tmask+Smask;
if isempty(index) || sum(index(:))==0, return, end

isfluo=0; if isfield(argo_data,'CHLA'), isfluo=1; end
isoxy=0;  if isfield(argo_data,'DOXY'), isoxy=1;  end
if isfluo
    CHLA=argo_data.CHLA;
    Fmask=double(argo_data.CHLA_QC==1);
    index=index+Fmask;
end
if isoxy
    DOXY=argo_data.DOXY;
    Omask=double(argo_data.DOXY_QC==1);
    index=index+Omask;
end
cruise=argo_data.smru_platform_code;
I=1:length(argo_data.JULD);%find(strcmp(argo_data.smru_name,cruise));

fid=fopen(path,'w');
fprintf(fid,'// created: %s\n',datestr(now));

mode=0;
if isfluo
    if isoxy,
        mode=1;
        fprintf(fid,'%s\n','Cruise	Station	Type	mon/day/yr	hh:mm	Longitude [degrees_east]	Latitude [degrees_north]	Depth [m]	QF	Temperature [°C]	QF	Salinity [psu]	QF  Chlorophyll-A [mg/m3]	QF	Oxygen [umol/l]	QF');
    else
        mode=2;
        fprintf(fid,'%s\n','Cruise	Station	Type	mon/day/yr	hh:mm	Longitude [degrees_east]	Latitude [degrees_north]	Depth [m]	QF	Temperature [°C]	QF	Salinity [psu]	QF  Chlorophyll-A [mg/m3]	QF');
    end
else
    if isoxy,
        mode=3;
        fprintf(fid,'%s\n','Cruise	Station	Type	mon/day/yr	hh:mm	Longitude [degrees_east]	Latitude [degrees_north]	Depth [m]	QF	Temperature [°C]	QF	Salinity [psu]	QF  Oxygen [umol/l]	QF');
    else
        mode=4;
        fprintf(fid,'%s\n','Cruise	Station	Type	mon/day/yr	hh:mm	Longitude [degrees_east]	Latitude [degrees_north]	Depth [m]	QF	Temperature [°C]	QF	Salinity [psu]	QF');
    end
end

for ii=1:length(I),
    if sum(Tmask(:,I(ii)))==0, continue, end
    station=sprintf('%04d',ii);
    date=datestr(argo_data.JULD(I(ii)),'mm/dd/yyyy\tHH:MM');
    lon=argo_data.LONGITUDE(I(ii));    lat=argo_data.LATITUDE(I(ii));
    for pp=1:argo_data.nr,
        if index(pp,I(ii))==0, continue, end;
        fprintf(fid,'%s\t%s\tC\t%s\t%6.3f\t%6.3f\t%4.1f\t0\t',cruise,station,date,lon,lat,PRES(pp,I(ii)));
        if Tmask(pp,I(ii)),
            fprintf(fid,'%8.4f\t0\t',TEMP(pp,I(ii)));
        else
            fprintf(fid,'\t1\t');
        end
        if Smask(pp,I(ii)),
            fprintf(fid,'%8.4f\t0\t',SALI(pp,I(ii)));
        else
            fprintf(fid,'\t1\t');
        end
        if isfluo
            if Fmask(pp,I(ii)),
                fprintf(fid,'%8.4f\t0\t',CHLA(pp,I(ii)));
            else
                fprintf(fid,'\t1\t');
            end
        end
        if isoxy
            if Omask(pp,I(ii)),
                fprintf(fid,'%8.4f\t0\t',DOXY(pp,I(ii)));
            else
                fprintf(fid,'\t1\t');
            end
        end
        fprintf(fid,'\n');
    end
end
fclose(fid);

