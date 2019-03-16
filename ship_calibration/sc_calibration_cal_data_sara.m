%% Data processing
clear
load environment
addpath(scriptdir);
cd(expdir);



%% LOAD SRDL AND CTD DATA

%% SRDL profiles extraction
% output: tag=[numtag numctd P[dbar]   T[ITS90]  S[psu] up[0/1]];

path_in='raw_data';
list_tag=[11700 12246  12261 14408  14411 14412 14413  14414]';
% list_ptt=[199001 199002 103731 103726]';
% version_software=[4 3 3 3];
% read_SRDLfile;
tag=[];
for kk=1:length(list_tag)
    P=[];
    T=[];
    S=[];
    CTD=[];
   nctd=1;
   list_file=dir([path_in '/*' num2str(list_tag(kk)) '*.mat']);
    for jj=1:length(list_file)
       load([path_in '/' list_file(jj).name]);
       P=[P;Tag.ssdbar];
       T=[T;Tag.mTempC];
       S=[S;Tag.CondmSc];
       nctd=str2num(list_file(jj).name(end-4));
       CTD=[CTD;Tag.ssdbar*0+nctd];
    end
    data=[P T S];
    J=find(P<15); 
   I=J(find(diff(J)>1)); I=[1;I;length(data)-1];
   for ii=1:length(I)-1,
        if I(ii+1)-I(ii)>190,
            J=(I(ii)+30:I(ii+1)-31)';
            % cut into upcast/downcast profiles
            pmax=max(P(J)');
            jj=floor(mean(find(pmax-P(J)<20)));
            Jdown=J(1:jj); Jup=J(jj+1:end);
            % select the last 30 seconds at surface for downcast
            pmin=min(P(Jdown)');
            jj=max(1,max(find(P(Jdown)-pmin<20))-30);
            Jdown=Jdown(jj:end);
            % select the last 30 seconds at surface for upcast
            if P(Jup(1))<100,
                I=find(P(Jup)<100);
                Jup(I<100)=[];
            end
            pmin=min(P(Jup)');
            jj=min(length(Jup),min(find(P(Jup)-pmin<20))+30);
            Jup=Jup(1:jj);
            % save profiles
            tag=[tag;ones(length(Jdown),1)*[list_tag(kk)] CTD(Jdown) data(Jdown,:) zeros(length(Jdown),1)];
            tag=[tag;ones(length(Jup),1)*[list_tag(kk)] CTD(Jup) data(Jup,:) ones(length(Jup),1)];
            
        end
   end
    
end

save tag tag

%% CTD data extraction
% ctd(:,1:7)=[numctd P T S up(=1 for upcast)]

path_in='raw_data';
files={ ...
        'jr16004_1.cnv'
        'jr16004_2.cnv',
        'jr16004_3.cnv',
        'jr16004_4.cnv',
        'jr16004_5.cnv',
        'jr16004_6.cnv'};
up=1;
str_format='%f %f %*f %f %*f %*f %*f %*f %*f %*f %*f %*f %*[^\n]';

read_SEABIRDfile;
ctd(:,4)=ctd(:,4)*10;
save ctd ctd


%% PUT SRDL AND CTD PROFILE DATA ON THE SAME PRESSURE GRID

%% plot profiles tag
load tag
c='brmygkc';
figure(1),clf
lctd=unique(tag(:,2));
for kk=1:length(lctd),
    col=c(mod(kk,7)+1);
    PTS=tag(:,3:6);
    PTS(tag(:,2)~=lctd(kk)|~tag(:,6),:)=NaN;
    subplot(4,1,1),hold on,plot(PTS(:,1),col)
    subplot(4,1,2),hold on,plot(PTS(:,2),col)
    subplot(4,1,3),hold on,plot(PTS(:,3),col)
    subplot(4,1,4),hold on,plot(PTS(:,4),col)
end
PTS=tag(:,3:6);PTS(tag(:,6)==1,:)=NaN;
subplot(4,1,1),hold on,plot(PTS(:,1),'k')

%% bin average every 1dbar
load tag
tag2=[];
ltag=unique(tag(:,1));
for ii=1:length(ltag),
    lctd=unique(tag(:,2));
    for jj=1:length(lctd),
        I=find( tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj) & tag(:,6) );
        if length(I)>0
            PTS=sortrows(tag(I,3:5),1);
            Pi=(ceil(PTS(1,1)):floor(PTS(end,1)))';
            PTSi=filtre_gauss(PTS,.5,1,Pi);
            tag2=[tag2;Pi*0+ltag(ii) Pi*0+lctd(jj) PTSi Pi*0+1];
        end
    end
end
tag=tag2; tag(:,6)=[];
save tag_pbin tag


%% plot profiles tag_pbin
load tag_pbin
c='brmygkc';
figure(1),clf
lctd=unique(tag(:,2));
for kk=1:length(lctd),
    col=c(mod(kk,7)+1);
    PTS=tag(:,3:5);
    PTS(tag(:,2)~=lctd(kk),:)=NaN;
    subplot(3,1,1),hold on,plot(PTS(:,1),col)
    subplot(3,1,2),hold on,plot(PTS(:,2),col)
    subplot(3,1,3),hold on,plot(PTS(:,3),col)
end


%% plot profiles ctd
load ctd
c='brmygkc';
figure(2),clf
lctd=unique(ctd(:,1));
for kk=1:length(lctd),
    col=c(mod(kk,7)+1);
    I=find(ctd(:,1)==lctd(kk));
    PTS=ctd(I,2:4);
    subplot(2,1,1),hold on,plot(PTS(:,2),-PTS(:,1),col)
    subplot(2,1,2),hold on,plot(PTS(:,3),-PTS(:,1),col)
end

load tag_pbin
ltag=unique(tag(:,1));
lctd=unique(tag(:,2));
for kk=1:length(ltag),
    col=c(mod(kk,7)+1);
    for ii=1:length(lctd)
        I=find(tag(:,1)==ltag(kk) & tag(:,2)==lctd(ii));
        PTS=tag(I,3:5);
        subplot(2,1,1),hold on,plot(PTS(:,2),-PTS(:,1),[col ':'])
        subplot(2,1,2),hold on,plot(PTS(:,3),-PTS(:,1),[col ':'])
    end
end

%% set ctd index in tag_pbin
load tag_pbin
% lctd_rm=1;
% lctd_old=2:8;
% lctd=1:7;
% tag2=tag;
% for kk=1:length(lctd_rm),
%     tag2(tag(:,2)==lctd_rm(kk),:)=[];
% end
% tag=tag2;
% for kk=1:length(lctd_old),
%     tag(tag2(:,2)==lctd_old(kk),2)=lctd(kk);
% end
save tag_fin tag

%% plot profiles ctd fin
load ctd
load tag_fin
c='brmygkc';
figure(2),clf
ltag=unique(tag(:,1));
for ii=1:length(ltag),
    lctd=unique(tag(:,2));
    for kk=1:length(lctd),
        col=c(mod(kk,7)+1);
        I=find(tag(:,1)==ltag(ii) );
        PTS=tag(I,3:5);
        PTS(tag(I,2)~=lctd(kk),:)=NaN;
        subplot(5,1,1),hold on,plot((1:length(I))',-PTS(:,1),col),axis([0 length(I) -2000 0]);
        subplot(5,1,2),hold on,plot((1:length(I))',PTS(:,2),col),axis([0 length(I) -1 2]);
        subplot(5,1,3),hold on,plot((1:length(I))',PTS(:,3),col),axis([0 length(I) 27 30]);
        I=find(ctd(:,1)==lctd(kk));
        PTS=ctd(I,2:4);
        subplot(5,1,4),hold on,plot(PTS(:,2),-PTS(:,1),col),axis([-1 2 -2000 0]);
        subplot(5,1,5),hold on,plot(PTS(:,3),-PTS(:,1),col),axis([27 30 -2000 0]);
        I=find(tag(:,1)==ltag(ii) & tag(:,2)==lctd(kk) );
        PTS=tag(I,3:5);
        subplot(5,1,4),hold on,plot(PTS(:,2),-PTS(:,1),[col ':'])
        subplot(5,1,5),hold on,plot(PTS(:,3),-PTS(:,1),[col ':'])
    end
    suptitle(sprintf('TAG: %d',ltag(ii)));
    filename=sprintf('calibration_plots/data_%d.png',ltag(ii));
    format_figure_centred([15 18]);
    print('-dpng','-r300',filename);
end




%% ESTIMATE PRESSURE CORRECTION FOR SRDL DATA

%% init matching correction
% matching matrix = numtag dP0 dP500
load tag_fin
ltag=unique(tag(:,1));
match= [ ltag ltag*0 ltag*0];
save match match

%% CTD-TAG matching
load tag_fin
load ctd
matching_procedure

load match
disp('match matrix: numTag dP0 dP500')
match

%% merge tag and ctd datasets
% tag_ctd: [numtag numctd P Ttag Stag Tctd Sctd]

load tag_fin
load ctd
load match match
disp('match matrix: numTag dP0 dP500')
match

ltag=unique(tag(:,1));
tag_ctd=[];
for ii=1:length(ltag),
    dP0=match(match(:,1)==ltag(ii),2);
    dP100=match(match(:,1)==ltag(ii),3);
    dP250=match(match(:,1)==ltag(ii),4);
    dP500=match(match(:,1)==ltag(ii),5);

    lctd=unique(tag(:,2));
    for jj=1:length(lctd),
        Itag=find(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj));
        Ictd=find(ctd(:,1)==lctd(jj));
        if length(Itag)
            Ptag=interp1([0 100 250 500],[dP0 100+dP100 250+dP250 500+dP500],tag(Itag,3),'linear','extrap');
            Pctd=ctd(Ictd,2);
            Ttag=interp1(Ptag,tag(Itag,4),Pctd,'linear',NaN);
            Stag=interp1(Ptag,tag(Itag,5),Pctd,'linear',NaN);
            Tctd=ctd(Ictd,3);
            Sctd=ctd(Ictd,4);
            tag_ctd=[tag_ctd;Pctd*0+ltag(ii) Pctd*0+lctd(jj) Pctd Ttag Stag Tctd Sctd];
        end
    end
end
save cal_data tag_ctd

%% plot profiles ctd and tag together
load cal_data
figure(2),clf
ltag=unique(tag_ctd(:,1));
for ii=1:length(ltag),
    I=find(tag_ctd(:,1)==ltag(ii));
    PTStag=tag_ctd(I,3:5);
    PTSctd=tag_ctd(I,[3 6 7]);
    subplot(3,1,1),hold on,plot(I,PTStag(:,1),I,PTSctd(:,1))
    subplot(3,1,2),hold on,plot(I,PTStag(:,2),I,PTSctd(:,2))
    subplot(3,1,3),hold on,plot(I,PTStag(:,3),I,PTSctd(:,3))
end


%% init linear fit correction
% linearfit matrix = numtag aT bT aS bS
load cal_data
ltag=unique(tag_ctd(:,1));
linearfit= [ ltag ltag*0 ltag*0 ltag*0 ltag*0];
save linearfit linearfit

%% bias fitting
load linearfit
load cal_data
ltag=unique(tag_ctd(:,1));
for ii=1:length(ltag),
    lctd=unique(tag_ctd(:,2));
    Pbin=(20:20:max(tag_ctd(tag_ctd(:,1)==ltag(ii),3)))';
    edges=[0;Pbin(1:end)]+10;
    dPT=[]; dPS=[];
    figure(2),clf,
    for jj=1:length(lctd),
        I=find(tag_ctd(:,1)==ltag(ii) & tag_ctd(:,2)==lctd(jj) & tag_ctd(:,6)<13.6);
        P=tag_ctd(I,3);
        dT=tag_ctd(I,4)-tag_ctd(I,6);
        dS=tag_ctd(I,5)-tag_ctd(I,7);
        [n,bin] = histc(P,edges);
        dTbin=Pbin*NaN; dSbin=Pbin*NaN;
        for kk=1:length(n)-1,
            J=find(bin==kk);
            if nanstd(dT(J))<0.01, dTbin(kk)=nanmean(dT(J)); end
            if nanstd(dS(J))<0.01, dSbin(kk)=nanmean(dS(J)); end
        end
        dPT=[dPT;Pbin,dTbin];
        dPS=[dPS;Pbin,dSbin];
        subplot(2,1,1),hold on,plot(P,dT,Pbin,dTbin),
        subplot(2,1,2),hold on,plot(P,dS,Pbin,dSbin),
    end
    dPT(isnan(dPT(:,2)),:)=[]; plin_t=polyfit(dPT(:,1),dPT(:,2),1);
    dPS(isnan(dPS(:,2)),:)=[]; plin_s=polyfit(dPS(:,1),dPS(:,2),1);
    linearfit(linearfit(:,1)==ltag(ii),2:3)=plin_t;
    linearfit(linearfit(:,1)==ltag(ii),4:5)=plin_s;
    save linearfit linearfit
    
    subplot(2,1,1),hold on,h=plot(Pbin,polyval(plin_t,Pbin),'k');set(h,'linewidth',1)
    title(sprintf('Temperature: plin=[%8.4g %5.3g]',plin_t))
    subplot(2,1,2),hold on,h=plot(Pbin,polyval(plin_s,Pbin),'k');set(h,'linewidth',1)
    title(sprintf('Salinity: plin=[%8.4g %5.3g]',plin_s))
    suptitle(sprintf('TAG: %d',ltag(ii)));
    cd([expdir '\calibration_plots\']);
    filename=sprintf('calibration_%d.png',ltag(ii));
    %if tag_ctd(I(1),1)==11632, filename=sprintf('calibration_%d_recalibrated.png',ltag(ii)); end
    format_figure_centred([15 15]);
    print('-dpng','-r300',filename);
     cd(expdir);
    
end


