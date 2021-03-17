%% procedure to match tag and ctd data

ltag=unique(tag(:,1));
ii=0; iin=1; c='brmyg';
P0=input('set P0 [default=30m]'); if isempty(P0), P0=30; end
P1=input('set P1 [default=100m]'); if isempty(P1), P1=100; end
P2=input('set P2 [default=250m]'); if isempty(P2), P2=250; end
P3=input('set P3 [default=500m]'); if isempty(P3), P3=500; end
disp('begin matching...');
while iin~=0,
    iin=input(sprintf('ntag? [=0 out] [default: %d] [1-%d: ltag]: ',ii+1,length(ltag)));
    if isempty(iin),
        ii=ii+1; 
        iin=ii; if iin>length(ltag), break, end
    elseif iin==0
        continue
    else
        ii=iin;
    end
    load match
    dP0m=match(match(:,1)==ltag(ii),2);
    dP100m=match(match(:,1)==ltag(ii),3);
    dP250m=match(match(:,1)==ltag(ii),4);
    dP500m=match(match(:,1)==ltag(ii),5);
    a=interp1([0 100 250 500],[dP0m dP100m dP250m dP500m],[P0 P1 P2 P3],'linear','extrap');dP0=a(1); dP1=a(2); dP2=a(3);dP3=a(4);
    update=1;
    while update==1
        figure(3),clf,
        I=find(tag(:,1)==ltag(ii));
        lctd=unique(tag(I,2));
        for jj=1:length(lctd),
            Itag=find(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj));
            Ictd=find(ctd(:,1)==lctd(jj));
            Ptag=interp1([P0 P1 P2 P3],[P0+dP0 P1+dP1 P2+dP2 P3+dP3],tag(Itag,3),'linear','extrap');
            
            subplot(2,3,1),hold on,
            m=nanmean(tag(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj) & tag(:,3)>P0-10 & tag(:,3)<P0+10,4));
            plot(Ptag,tag(Itag,4)-m,'b'),  
            m=nanmean(ctd(ctd(:,1)==lctd(jj) & ctd(:,2)>P0-10 & ctd(:,2)<P0+10,3));
            plot(ctd(Ictd,2),ctd(Ictd,3)-m,'r'), 
            set(gca,'xlim',[P0-10 P0+10])
            
            subplot(2,3,4),hold on, 
            m=nanmean(tag(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj) & tag(:,3)>P0-10 & tag(:,3)<P0+10,5));
            plot(Ptag,tag(Itag,5)-m,'b'),  
            m=nanmean(ctd(ctd(:,1)==lctd(jj) & ctd(:,2)>P0-10 & ctd(:,2)<P0+10,4));
            plot(ctd(Ictd,2),ctd(Ictd,4)-m,'r'), 
            set(gca,'xlim',[P0-10 P0+10])
            
            subplot(2,3,2),hold on, 
            plot(Ptag,tag(Itag,4),'b'),  
            plot(ctd(Ictd,2),ctd(Ictd,3),'r')
            
            subplot(2,3,5),hold on, 
            plot(Ptag,tag(Itag,5),'b'),  
            plot(ctd(Ictd,2),ctd(Ictd,4),'r')
            
            subplot(2,3,3),hold on, 
            m=nanmean(tag(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj) & tag(:,3)>P1-10 & tag(:,3)<P1+10,4));
            plot(Ptag,tag(Itag,4)-m,'b'),  
            m=nanmean(ctd(ctd(:,1)==lctd(jj) & ctd(:,2)>P1-10 & ctd(:,2)<P1+10,3));
            plot(ctd(Ictd,2),ctd(Ictd,3)-m,'r'), 
            set(gca,'xlim',[P1-10 P1+10])
            
            subplot(2,3,6),hold on, 
            m=nanmean(tag(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj) & tag(:,3)>P1-10 & tag(:,3)<P1+10,5));
            plot(Ptag,tag(Itag,5)-m,'b'),  
            m=nanmean(ctd(ctd(:,1)==lctd(jj) & ctd(:,2)>P1-10 & ctd(:,2)<P1+10,4));
            plot(ctd(Ictd,2),ctd(Ictd,4)-m,'r'), 
            set(gca,'xlim',[P1-10 P1+10])
            
        end
        suptitle(sprintf('%d numtag=%d dP0(%d m)=%d dP1(%d m)=%d\n',ii,ltag(ii),P0,dP0,P1,dP1));
        update=input('update? [=1: yes]: ');
        if update==1,
            dP0=input(sprintf('dP0(%d m)? ',P0));
            dP1=input(sprintf('dP1(%d m)? ',P1));
            dP2=input(sprintf('dP2(%d m)? ',P2));
            dP3=input(sprintf('dP3(%d m)? ',P3));
            a=interp1([P0 P1 P2 P3],[dP0 dP1 dP2 dP3],[0 100 250 500],'linear','extrap');dP0m=a(1);dP100m=a(2);dP200m=a(3); dP500m=a(4);
            match(match(:,1)==ltag(ii),2:5)=[dP0m dP100m dP200m dP500m];
            save match match
        else
            update=0;
        end
    end
end
