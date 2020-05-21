%% script extracting date, P, T and S out of a SRDL calibration data file
% to work, need to set:
%   path_in='name_of_directory';
%   list_tag=[list_of_tag_numbers_appearing_on_file_names]';
%   version_software=[version_number_list];
%     = 1 old format CTD_GEN_07B
%     = 2 format for fluorometer loggers FTD_09A
%     = 3 new format bluetooth
%     = 4 format for fluorometer loggers FTD_07B
%
% output: tag=[numtag numctd P[dbar]   T[ITS90]  S[psu] up[0/1]];

% load tag data
tag=[];
for kk=1:length(list_tag),
    nctd=1;
    file = dir(sprintf('%s/%d*',path_in,list_tag(kk))); file=file.name;
    switch version_software(kk)
        case 1, % old format CTD_GEN_07B
            str_format='%f/%f/%f %f:%f:%f %*d %*d %*d %f %*f %f %*f %f'; % old
            fid=fopen(sprintf('%s/%s',path_in,file));
            Tf=textscan(fid,str_format,'headerlines',1);
            fclose(fid);
            Tf=[Tf{:}];
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7)-10; T=Tf(:,8); S=Tf(:,9); data=[P T S];
        case 2, % format for fluorometer loggers FTD_09A
            str_format='%f/%f/%f %f:%f:%f %*d %*d %*d %f %*f %f %*f %f %*f %*f %*f'; % fluo
            Tf=[];n=0;
            fid=fopen(sprintf('%s/%s',path_in,file));
            tline=fgetl(fid);
            while ~isempty(strfind(tline,'SEALOG')), tline=fgetl(fid); end
            while ~feof(fid),
                tline=fgetl(fid);
                if strfind(tline,'SEALOG'), continue, end
                n=n+1; Tf(n,:)=[sscanf(tline,str_format)];
            end
            fclose(fid); Tf=double([Tf]);
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7)-10; T=Tf(:,8); S=Tf(:,9); data=[P T S];
        case 3, % new bluetooth format
            str_format='%f/%f/%f %f:%f:%f %f %f %*f %f %*[^\n]'; % new
            Tf=[];n=0;
            fid=fopen(sprintf('%s/%s',path_in,file));
            while ~feof(fid),
                tline=fgetl(fid);
                if length(tline)<4 | ~strcmp(tline(1:2),'20'), continue, end
                n=n+1; Tf(n,:)=[sscanf(tline,str_format)];
            end
            fclose(fid);
            %Tf=[Tf{:}];
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7); T=Tf(:,8); S=Tf(:,9); data=[P T S];
        case 4, % format for fluorometer loggers FTD_07B
            str_format='%f/%f/%f %f:%f:%f %*d %*d %*d %f %*f %f %*f %f %*f %*f %*f %*[^\n]'; % fluo
            Tf=[];n=0;
            fid=fopen(sprintf('%s/%s',path_in,file));
            while ~feof(fid),
                tline=fgetl(fid);
                if length(tline)<100 | ~strcmp(tline(1:2),'20'), continue, end
                n=n+1; Tf(n,:)=[sscanf(tline,str_format)];
            end
            fclose(fid); Tf=double([Tf]);
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7)-10; T=Tf(:,8); S=Tf(:,9); data=[P T S];
        case 5, % format for oxy
            str_format='%f/%f/%f %f:%f:%f %*d %*d %*d %f %*f %f %*f %f %*f'; 
            Tf=[];n=0;
            fid=fopen(sprintf('%s/%s',path_in,file));
            while ~feof(fid),
                tline=fgetl(fid);
                if length(tline)<4 | ~strcmp(tline(1:2),'20'), continue, end
                n=n+1; Tf(n,:)=[sscanf(tline,str_format)];
            end
            fclose(fid); Tf=double([Tf]);
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7)-10; T=Tf(:,8); S=Tf(:,9); data=[P T S];
        case 6, % format for new tag with pressure is now measured by a separate Keller sensor. On doit enlever 990.27 à la profondeur
            
            str_format='%f/%f/%f %f:%f:%f %*d %*d %*d %f %*f %f %*f %f %*f %*f %*f %*[^\n]'; % fluo
            Tf=[];n=0;
            fid=fopen(sprintf('%s/%s',path_in,file));
            while ~feof(fid),
                tline=fgetl(fid);
                if length(tline)<100 | ~strcmp(tline(1:2),'20'), continue, end
                n=n+1; Tf(n,:)=[sscanf(tline,str_format)];
            end
            fclose(fid); Tf=double([Tf]);
            diff_surf=min(Tf(:,7)-990.27);
            jul_date=datenum(Tf(:,1:6)); P=Tf(:,7)-990.27-diff_surf; T=Tf(:,8); S=Tf(:,9); data=[P T S];
    end
    
    
   % I=find(abs(diff(jul_date))>0.02); I=[1;I;length(data)-1]; %% automatic separation of profiles with time
   J=find(P<5); 
   I=J(find(diff(J)>1)); I=[1;I;length(data)-1]; %% automatic separation of profiles with depth

    
    %time_sep=[.5 1.5 1.9 1.95 1.98 2.02 2.05]'+min(jul_date);
    %I=floor(interp1(jul_date,(1:length(jul_date))',time_sep)); I=[1;I;length(data)-1];
    
    for ii=1:length(I)-1,
        if I(ii+1)-I(ii)>190,
            J=(I(ii)+30:I(ii+1)-31)';
            % cut into upcast/downcast profiles
            pmax=max(P(J)');
            if pmax>10
                jj=floor(mean(find(pmax-P(J)<20)));
                Jdown=J(1:jj); Jup=J(jj+1:end);
                % select the last 30 seconds at surface for downcast
                pmin=min(P(Jdown)');
                jj=max(1,max(find(P(Jdown)-pmin<20))-30);
                Jdown=Jdown(jj:end);
                % select the last 30 seconds at surface for upcast
                if P(Jup(1))<100,
                    L=find(P(Jup)<100);
                    Jup(L<100)=[];
                end
                pmin=min(P(Jup)');
                jj=min(length(Jup),min(find(P(Jup)-pmin<20))+30);
                Jup=Jup(1:jj);
                % save profiles
                tag=[tag;ones(length(Jdown),1)*[list_tag(kk) nctd] data(Jdown,:) zeros(length(Jdown),1)];
                tag=[tag;ones(length(Jup),1)*[list_tag(kk) nctd] data(Jup,:) ones(length(Jup),1)];
                nctd=nctd+1;
            end
        end
    end
    
    fprintf('Tag %d : %d casts\n',list_tag(kk),nctd-1);
    
end


