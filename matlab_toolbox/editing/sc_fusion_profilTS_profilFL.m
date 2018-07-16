  

fid = fopen('ct139_ODV.txt');
tline = fgetl(fid);
tline = fgetl(fid);
fclose(fid);

clear F O C BD;

[tag,numProf,type,date,lon,lat,bot,P,T,S,C] = ...
        textread('ct139_ODV.txt','%s%d%s%s%f%f%d%f%f%f%f',...
        'delimiter',';','headerlines',2);
   
  
    
    fid = fopen('ct139_FL_ODV.txt');
tline = fgetl(fid);
tline = fgetl(fid);
fclose(fid);

clear F O C BD;

[tagfl,numProffl,datefl,lonfl,latfl,Pfl,F,L,O] = ...
        textread('ct139_FL_ODV.txt','%s%d%*s%s%f%f%*d%f%f%f%f%*f',...
        'delimiter',';','headerlines',2);

Fbis=[];
Lbis=[];
tagbis=[];
numProfbis=[];
datebis=[];
lonbis=[];
latbis=[];
Pbis=[];
Tbis=[];
Sbis=[];
profil=unique(numProf);

for ii=2:length(profil)
    Ideb=find(numProf==profil(ii));
    Ifin=find(numProf(Ideb+1:end)~=0);
    if Ifin
        Ifin=Ideb+Ifin(1)-1;
    else
        Ifin=length(numProf);
    end
    Jdeb=find(numProffl==profil(ii));
    if Jdeb
        Jfin=find(numProffl(Jdeb+1:end)~=0);
        if Jfin
            Jfin=Jdeb+Jfin(1)-1;
        else
            Jfin=length(numProffl);
        end
        tagbis=[tagbis;tag(Ideb:Ifin)];
        numProfbis=[numProfbis;numProf(Ideb:Ifin)];
        datebis=[datebis;date(Ideb:Ifin)];
        lonbis=[lonbis;lon(Ideb:Ifin)];
        latbis=[latbis;lat(Ideb:Ifin)];
        Pbis=[Pbis;P(Ideb:Ifin)];
        Tbis=[Tbis;T(Ideb:Ifin)];
        Sbis=[Sbis;S(Ideb:Ifin)];
        Fprof=interp1(Pfl(Jdeb:Jfin),F(Jdeb:Jfin),P(Ideb:Ifin));
        Fbis=[Fbis;Fprof];
        Lprof=interp1(Pfl(Jdeb:Jfin),L(Jdeb:Jfin),P(Ideb:Ifin));
        Lbis=[Lbis;Lprof];

      
    else
        Fbis=[Fbis;T(Ideb:Ifin)*0+999];
        Lbis=[Lbis;T(Ideb:Ifin)*0+999];
        tagbis=[tagbis;tag(Ideb:Ifin)];
        numProfbis=[numProfbis;numProf(Ideb:Ifin)];
        datebis=[datebis;date(Ideb:Ifin)];
        lonbis=[lonbis;lon(Ideb:Ifin)];
        latbis=[latbis;lat(Ideb:Ifin)];
        Pbis=[Pbis;P(Ideb:Ifin)];
        Tbis=[Tbis;T(Ideb:Ifin)];
        Sbis=[Sbis;S(Ideb:Ifin)];
        
    end
   
end

fid=fopen('ct139_ODV_All.txt','w');
fprintf(fid,'// Generic ODV file \n');
fprintf(fid,'Cruise;Station;Type;yyyy-mm-dd hh:mm;Longitude [degrees_east];Latitude [degrees_north];Bot. Depth [m];Pressure [dbar];Temperature [C];Salinity [PSU];Fluorescence [mg/l];Light [ln(PPFD)] \n');

for ii=1:length(tagbis)
    
    fprintf(fid,'%s;%d;%s;%s;%f;%f;%d;%f;%f;%f;%f;%f \n',tagbis{ii},numProfbis(ii),type{ii},datestr(datebis{ii},'yyyy-mm-dd HH:MM'),lonbis(ii),latbis(ii),bot(ii),Pbis(ii),Tbis(ii),Sbis(ii),Fbis(ii),Lbis(ii));
end
fclose(fid);
