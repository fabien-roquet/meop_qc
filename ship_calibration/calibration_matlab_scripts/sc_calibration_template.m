%% Data processing

load environment
addpath(scriptdir);
cd(expdir);



%% LOAD SRDL AND CTD DATA

%% SRDL profiles extraction
% output: tag=[numtag numctd P[dbar]   T[ITS90]  S[psu] up[0/1]];

path_in='raw_data';
list_tag=[10838  10839  11548  11614  11615  11617  11620  11628  11629  11632  11649]';
list_ptt=[199001 199002 103731 103726 103727 103729 103730 103725 103728 199003 199004]';
version_software=[1 1 2 2 2 2 2 2 2 3 3];

read_SRDLfile;
save tag tag

%% CTD data extraction
% ctd(:,1:7)=[numctd P T S up(=1 for upcast)]

path_in='raw_data';
files={ ...
        'bous002.cnv',
        'bous003.cnv',
        'bous004.cnv',
        'bous005.cnv',
        'bous006.cnv',
        'bous007.cnv',
        'bous008.cnv'};
up=1;
str_format='%f %f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %f %*f %*f';

read_SEABIRDfile;
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
        PTS=sortrows(tag(I,3:5),1);
        Pi=(ceil(PTS(1,1)):floor(PTS(end,1)))';
        PTSi=filtre_gauss(PTS,.5,1,Pi);
        tag2=[tag2;Pi*0+ltag(ii) Pi*0+lctd(jj) PTSi Pi*0+1];
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
lctd=2:8;
for kk=1:length(lctd),
    col=c(mod(kk,7)+1);
    I=find(tag(:,1)==ltag(4) & tag(:,2)==lctd(kk));
    PTS=tag(I,3:5);
    subplot(2,1,1),hold on,plot(PTS(:,2),-PTS(:,1),[col ':'])
    subplot(2,1,2),hold on,plot(PTS(:,3),-PTS(:,1),[col ':'])
end

%% set ctd index in tag_pbin
load tag_pbin
lctd_rm=1;
lctd_old=2:8;
lctd=1:7;
tag2=tag;
for kk=1:length(lctd_rm),
    tag2(tag(:,2)==lctd_rm(kk),:)=[];
end
tag=tag2;
for kk=1:length(lctd_old),
    tag(tag2(:,2)==lctd_old(kk),2)=lctd(kk);
end
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
        subplot(5,1,1),hold on,plot((1:length(I))',-PTS(:,1),col),axis([0 2700 -450 0]);
        subplot(5,1,2),hold on,plot((1:length(I))',PTS(:,2),col),axis([0 2700 13 19]);
        subplot(5,1,3),hold on,plot((1:length(I))',PTS(:,3),col),axis([0 2700 37.8 38.7]);
        I=find(ctd(:,1)==lctd(kk));
        PTS=ctd(I,2:4);
        subplot(5,1,4),hold on,plot(PTS(:,2),-PTS(:,1),col),axis([13 19 -450 0]);
        subplot(5,1,5),hold on,plot(PTS(:,3),-PTS(:,1),col),axis([37.8 38.7 -450 0]);
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
    dP500=match(match(:,1)==ltag(ii),3);
    lctd=unique(tag(:,2));
    for jj=1:length(lctd),
        Itag=find(tag(:,1)==ltag(ii) & tag(:,2)==lctd(jj));
        Ictd=find(ctd(:,1)==lctd(jj));
        Ptag=interp1([0 500],[dP0 500+dP500],tag(Itag,3),'linear','extrap');
        Pctd=ctd(Ictd,2);
        Ttag=interp1(Ptag,tag(Itag,4),Pctd,'linear',NaN);
        Stag=interp1(Ptag,tag(Itag,5),Pctd,'linear',NaN);
        Tctd=ctd(Ictd,3);
        Sctd=ctd(Ictd,4);
        tag_ctd=[tag_ctd;Pctd*0+ltag(ii) Pctd*0+lctd(jj) Pctd Ttag Stag Tctd Sctd];
    end
end
save tag_ctd tag_ctd

%% plot profiles ctd and tag together
load tag_ctd
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
load tag_ctd
ltag=unique(tag_ctd(:,1));
linearfit= [ ltag ltag*0 ltag*0 ltag*0 ltag*0];
save linearfit linearfit

%% bias fitting
load linearfit
load tag_ctd_11632corr
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
    filename=sprintf('calibration_plots/calibration_%d.png',ltag(ii));
    if tag_ctd(I(1),1)==11632, filename=sprintf('calibration_plots/calibration_%d_recalibrated.png',ltag(ii)); end
    format_figure_centred([15 15]);
    print('-dpng','-r300',filename);
    
end


%% apply correction
datafile='seal_dataset/mir2009_ct47.mat';
datafile_calibrated='seal_dataset/mir2009_ct47_cal_fcell.mat';
load(datafile)

tag_number={
    121   90071   10884      'ct47-A-09'
    122   90072   10982      'ct47-B-09'
    123   90073   11029      'ct47-C-09'
    124   90074   11037      'ct47-D-09'
    125   90075   11045      'ct47-E-09'
    126   90076   11046      'ct47-F-09'
    127   90077   11056      'ct47-G-09'
    129   90079   11043      'ct47-I-09'};

ltag_datafile=[tag_number{:,1}]';
ltag=[tag_number{:,3}]';

load linearfit
for kk=1:length(ltag),
    I=find(hi(:,10)==ltag_datafile(kk));
    for ii=1:length(I),
        PTi{I(ii)}(:,2)=...
            PTi{I(ii)}(:,2)-polyval(linearfit(linearfit(:,1)==ltag(kk),2:3),PTi{I(ii)}(:,1));
        if ~isempty(PSi{I(ii)})
            PSi{I(ii)}(:,2)=...
                PSi{I(ii)}(:,2)-polyval(linearfit(linearfit(:,1)==ltag(kk),4:5),PSi{I(ii)}(:,1));
        end
    end
end

% add comment
for kk=1:length(hi),
    hs{kk}='ADEL09';
end
EXP='ADEL09';
PI='JB CHARRASSIN';

% filtre data
I=find(hi(:,9));hi=hi(I,:);PTi=PTi(I);PSi=PSi(I);
hi(hi(:,4)<1e5,4)=hi(hi(:,4)<1e5,4)+693962;
sc_filtre_seals

% save
save(datafile_calibrated,'hi','hs','PTi','PSi','EXP','PI');


%% Conversion of data in MITprof format and basic plots
datafile='seal_dataset/mir2009_ct47_cal_fcell.mat';
data_ODV='seal_dataset/mir2009_ct47_cal_ODV.txt';
data_prof='seal_dataset/mir2009_ct47_cal_prof.nc';
data_MITprof='seal_dataset/mir2009_ct47_cal_MITprof.nc';
data_suffix='seal_dataset/mir2009_ct47_cal';
load(datafile);

convert_fcell2ODV4(hi,hs,PTi,PSi,data_ODV);
convert_fcell2ARGO(datafile,data_prof);

% convert to MITprof format
copyfile(data_prof,'/Users/roquet/Documents/data_process/mirounga/final_dataset/ADEL09_prof.nc');
datasetname='seals'; % wod05, argo
subset='ADEL09';
dataset=profiles_prep_select(datasetname,subset,1);
profiles_prep_main;
copyfile('/Users/roquet/Documents/data_process/mirounga/final_dataset/ADEL09_MITprof.nc',data_MITprof);


% plot PMP
clear all
savedir='dataset_plots';
lfic={data_suffix};

for kk=1:length(lfic),
    
    close all
    disp(lfic{kk});
    M=MITprof_load([lfic{kk} '_MITprof.nc']);
    lim=[floor(min(M.prof_lat)/10)*10 ceil(max(M.prof_lat)/10)*10 floor(min(M.prof_lon)/10)*10 ceil(max(M.prof_lon)/10)*10];
    Tlim=[max(-2,floor(min(M.prof_T(:)))) min(10,ceil(max(M.prof_T(:))))];
    Slim=[max(32.5,floor(min(M.prof_S(:)))) min(35.5,ceil(max(M.prof_S(:))))];
    D=sw_dens(M.prof_S,M.prof_T,0)-1000; Dlim=[max(24,floor(min(D(:)))) min(30,ceil(max(D(:))))];
    index=zeros(M.np,1);
    for ii=1:length(M.list_descr),
        index(strcmp(M.prof_descr,M.list_descr{ii}))=ii;
    end
    Z=index; Ncol=length(index); mZ=min(Z); MZ=max(Z); edges=mZ:(MZ-mZ)/(Ncol-1):MZ;
    EXP=M.prof_descr{1}(1:6);
    printname=[savedir '/recapPMP_' EXP '.png'];
    str=sprintf('%s: %d profiles',EXP,M.np);
    TS_diags_MITprof(M,Z,edges,str,lim,Tlim,Slim,Dlim,10,printname);
    
    % histogram
    nfile=sprintf('%s/histoMIT_%s.png',savedir,EXP);
    histogram_MITprof(M,11,nfile)
    
    for ii=1:length(M.list_descr),
        
        descr=M.list_descr{ii};
        Mi=MITprof_subset(M,'descr',descr);
        
        % fiches
        Z=Mi.prof_date-min(Mi.prof_date);
        mZ=min(Z)-1; MZ=max(Z)+1; dZ=ceil((MZ-mZ)/10);
        edges=mZ:dZ:(MZ+dZ);
        str={descr,' ', ...
            sprintf('%d profiles',Mi.np), ...
            sprintf('%d days',floor(max(Z)))};
        nfile=sprintf('%s/diags_TS_%s.png',savedir,descr);
        TS_diags_MITprof(Mi,Z,edges,str,lim,Tlim,Slim,Dlim,10,nfile);
        
        % transect
        Tcontour=[-2:.1:0 0:.5:5 6:10];
        Scontour=[33.3:.1:34.6 34.65:.05:34.9]; %south
        if Mi.prof_lat(1)>0, Scontour=[32:.5:34 34.1:.1:36]; end %Nordic
        nfile=sprintf('%s/transect_%s.png',savedir,descr);
        transect_time_MITprof(Mi,Tcontour,Scontour,edges,12,nfile);
        
        % salinity diag
        Mi=MITprof_subset(M,'list',find(~isnan(M.prof_S(:,10))),'descr',descr);
        Tcontour=-2:.25:10;  Scontour=[20 34:.03:34.8 40];
        Tlim2=[-2 10];   Slim2=[34 34.8];
        if Mi.np & Mi.prof_lat(1)>0, Scontour=[20 34.3:.03:35.5 40]; Slim2=[34 35.5]; end % Nordic
        str={descr};
        nfile=sprintf('%s/diagSALI_%s.png',savedir,descr);
        salinity_diags_MITprof(Mi,Tcontour,Scontour,Tlim2,Slim2,str,13,nfile);
        
    end
    
end

%% Same plots before calibration
datafile='seal_dataset/mir2009_ct47.mat';
data_prof='seal_dataset/mir2009_ct47_prof.nc';
data_MITprof='seal_dataset/mir2009_ct47_MITprof.nc';
data_suffix='seal_dataset/mir2009_ct47';

% reformat initial file
load(datafile);
for kk=1:length(hi),
    hs{kk}='ADEL09';
end
ltag=unique(hi(:,10));  for ntag=1:length(ltag),  hi(hi(:,10)==ltag(ntag),10)=ntag;  end
EXP='ADEL09';
PI='JB CHARRASSIN';
hi(hi(:,4)<1e5,4)=hi(hi(:,4)<1e5,4)+693962;
save(datafile,'hi','hs','PTi','PSi','EXP','PI');

% convert to ARGOprof format
convert_fcell2ARGO(datafile,data_prof);

% convert to MITprof format
copyfile(data_prof,'/Users/roquet/Documents/data_process/mirounga/final_dataset/ADEL09_prof.nc');
datasetname='seals'; % wod05, argo
subset='ADEL09';
dataset=profiles_prep_select(datasetname,subset,1);
profiles_prep_main;
copyfile('/Users/roquet/Documents/data_process/mirounga/final_dataset/ADEL09_MITprof.nc',data_MITprof);

% plot PMP
close all
savedir='dataset_plots_nocal';
lfic={data_suffix};

for kk=1:length(lfic),
    
    close all
    disp(lfic{kk});
    M=MITprof_load([lfic{kk} '_MITprof.nc']);
    lim=[floor(min(M.prof_lat)/10)*10 ceil(max(M.prof_lat)/10)*10 floor(min(M.prof_lon)/10)*10 ceil(max(M.prof_lon)/10)*10];
    Tlim=[max(-2,floor(min(M.prof_T(:)))) min(10,ceil(max(M.prof_T(:))))];
    Slim=[max(32.5,floor(min(M.prof_S(:)))) min(35.5,ceil(max(M.prof_S(:))))];
    D=sw_dens(M.prof_S,M.prof_T,0)-1000; Dlim=[max(24,floor(min(D(:)))) min(30,ceil(max(D(:))))];
    index=zeros(M.np,1);
    for ii=1:length(M.list_descr),
        index(strcmp(M.prof_descr,M.list_descr{ii}))=ii;
    end
    Z=index; Ncol=length(index); mZ=min(Z); MZ=max(Z); edges=mZ:(MZ-mZ)/(Ncol-1):MZ;
    EXP=M.prof_descr{1}(1:6);
    printname=[savedir '/recapPMP_' EXP '.png'];
    str=sprintf('%s: %d profiles',EXP,M.np);
    TS_diags_MITprof(M,Z,edges,str,lim,Tlim,Slim,Dlim,10,printname);
    
    % histogram
    nfile=sprintf('%s/histoMIT_%s.png',savedir,EXP);
    histogram_MITprof(M,11,nfile)
    
    for ii=1:length(M.list_descr),
        
        descr=M.list_descr{ii};
        Mi=MITprof_subset(M,'descr',descr);
        
        % fiches
        Z=Mi.prof_date-min(Mi.prof_date);
        mZ=min(Z)-1; MZ=max(Z)+1; dZ=ceil((MZ-mZ)/10);
        edges=mZ:dZ:(MZ+dZ);
        str={descr,' ', ...
            sprintf('%d profiles',Mi.np), ...
            sprintf('%d days',floor(max(Z)))};
        nfile=sprintf('%s/diags_TS_%s.png',savedir,descr);
        TS_diags_MITprof(Mi,Z,edges,str,lim,Tlim,Slim,Dlim,10,nfile);
        
        % transect
        Tcontour=[-2:.1:0 0:.5:5 6:10];
        Scontour=[33.3:.1:34.6 34.65:.05:34.9]; %south
        if Mi.prof_lat(1)>0, Scontour=[32:.5:34 34.1:.1:36]; end %Nordic
        nfile=sprintf('%s/transect_%s.png',savedir,descr);
        transect_time_MITprof(Mi,Tcontour,Scontour,edges,12,nfile);
        
        % salinity diag
        Mi=MITprof_subset(M,'list',find(~isnan(M.prof_S(:,10))),'descr',descr);
        Tcontour=-2:.25:10;  Scontour=[20 34:.03:34.8 40];
        Tlim2=[-2 10];   Slim2=[34 34.8];
        if Mi.np & Mi.prof_lat(1)>0, Scontour=[20 34.3:.03:35.5 40]; Slim2=[34 35.5]; end % Nordic
        str={descr};
        nfile=sprintf('%s/diagSALI_%s.png',savedir,descr);
        salinity_diags_MITprof(Mi,Tcontour,Scontour,Tlim2,Slim2,str,13,nfile);
        
    end
    
end


%% generation of latex file for pdf document
lfic={'ADEL09'};

fid=fopen('pdf_documents/ADEL09.tex','w');
fprintf(fid,...
    ['\\documentclass[twocolumn]{article}\n' ...
    '\\usepackage{graphicx}\n' ...
    '\\usepackage[landscape,top=1cm, bottom=1.5cm, left=1cm, right=1cm]{geometry}\n\n' ...
    '\\begin{document}\n\n']);
for kk=1:length(lfic),
    a=dir(sprintf('./dataset_plots/diags_TS_%s*.png',lfic{kk}));
    lfic2={a.name};for kk=1:length(lfic2),lfic2{kk}=lfic2{kk}(10:end-4);end
    for ii=1:length(lfic2),
        str=lfic2{ii};
        fprintf(fid,...
            ['\\begin{figure}[htb!]\n', ...
            '\\begin{centering}\n', ...
            '\\includegraphics[height=10cm,angle=0]{../dataset_plots/diags_TS_' str '.png}\n', ...
            '\\includegraphics[height=10cm,angle=0]{../dataset_plots/transect_' str '.png}\n', ...
            '\\par\\end{centering}\n', ...
            '\\end{figure}\n', ...
            '\\begin{figure}[htb!]\n', ...
            '\\begin{centering}\n', ...
            '\\includegraphics[height=21cm,angle=0]{../dataset_plots/diagSALI_' str '.png}\n', ...
            '\\par\\end{centering}\n', ...
            '\\end{figure}\n\n', ...
            '\\clearpage\n\n' ]);
    end
end
fprintf(fid,'\\end{document}\n\n');
fclose(fid);

% doc2
fid=fopen('pdf_documents/ADEL09_header.tex','w');
fprintf(fid,...
    ['\\documentclass[10pt]{article}\n' ...
    '\\usepackage{graphicx}\n' ...
    '\\usepackage[top=2cm, bottom=1.5cm, left=1cm, right=1cm]{geometry}\n\n' ...
    '\\begin{document}\n\n']);
for kk=1:length(lfic),
    str=lfic{kk};
    fprintf(fid,...
        ['\\begin{figure}[htb!]\n', ...
        '\\begin{centering}\n', ...
        '\\includegraphics[width=14cm,angle=0]{../dataset_plots/recapPMP_' str '.png}\n', ...
        '\\includegraphics[width=14cm,angle=0]{../dataset_plots/histoMIT_' str '.png}\n', ...
        '\\par\\end{centering}\n', ...
        '\\end{figure}\n', ...
        '\\clearpage\n\n' ]);
end
fprintf(fid,'\\end{document}\n\n');
fclose(fid);




