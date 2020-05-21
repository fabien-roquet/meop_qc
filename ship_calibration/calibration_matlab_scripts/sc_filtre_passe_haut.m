clear
load environment
addpath(scriptdir);
cd(expdir);
load('tag_pbin.mat');
load('cal_data.mat');
load('ctd.mat');
ltag=unique(tag_ctd(:,1));
lctd=unique(ctd(:,1));

for ii=1:length(ltag),

    for jj=1:length(lctd)
        
        Itagraw=find(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj));
        Itag=find(tag_ctd(:,1)==ltag(ii) & tag_ctd(:,2)==lctd(jj));
        Ictd=find(ctd(:,1)==lctd(jj));
        
        if length(Itag)
            figure(1),clf,
            [b,a]=butter(3,0.05,'high');
            
            I=find(~isnan(tag_ctd(Itag,4)));
            cond_tag=interp1(tag_ctd(Itag(I),3),tag_ctd(Itag(I),5),1:800);
            
            I=find(~isnan(tag(Itagraw,4)));
            cond_tag_raw=interp1(tag(Itagraw(I),3),tag(Itagraw(I),5),1:800);
            
            prof_ctd=tag_ctd(Itag,3);
            I=find(~isnan(cond_tag));
            if length(I)>20
                prof_raw=find(~isnan(cond_tag_raw));
                prof_cal=find(~isnan(cond_tag));
                
                ST_filtre_tag_raw=filtfilt(b,a,cond_tag_raw(~isnan(cond_tag_raw)));
                ST_filtre_tag_cal=filtfilt(b,a,cond_tag(~isnan(cond_tag)));
                ST_filtre_ctd=filtfilt(b,a,tag_ctd(Itag,7));
                
                subplot(2,1,1)
                hold on
                plot(prof_raw,ST_filtre_tag_raw)
                plot(ctd(Ictd,2),ST_filtre_ctd,'r')
                legend('tag','ctd');
                title('raw data');
                xlabel('depth')
                xlim([0 800]);
                ylabel('filtre passe haut');
                subplot(2,1,2)
                hold on
                plot(prof_cal,ST_filtre_tag_cal)
                plot(ctd(Ictd,2),ST_filtre_ctd,'r')
                title('Depth corrected');
                xlabel('depth')
                xlim([0 800]);
                ylabel('filtre passe haut');
                cd([expdir '\calibration_plots\Filtre']);
                filename=sprintf('filtre_passe_haut_%d_profil_%d.png',ltag(ii),lctd(jj));
                format_figure_centred([15 15]);
                print('-dpng','-r300',filename);
                cd(expdir);
            end
        end
    end
    
end
