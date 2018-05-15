function conf=TSdiags_comparison(conf)
% function TSdiags_ARGO
%   plot TS plot diagnostics for a set of profiles
%
% INPUT:
%
% conf: structure with configuration parameters
%   argo_qc: struct variable obtained using the function ARGO_load_qc
%   Z: vector of size (np,1) used to color lines.
%   edges: edges used in function histc to determine colors. (if NaN, unique color)
%   str: descriptive string used in the caption
%   lim=[south, north, west, east] used to set limits of spatial map.
%   Tlim=[minT maxT] used to set limits of potential temperature maps.
%   Slim=[minS maxS] used to set limits of salinity maps.
%   hfig: figure handle number. if 0, a new figure is opened.
%   nomfig: print name. no print if empty string. suffix indicates the print
%       format.
%
% OUTPUT
% H: vector list of graphical handles

if conf.argo_qc.np==0
    return
end
warning off

if ~isfield(conf,'list_tag'),
    conf.list_tag = conf.argo_qc.list_descr;
end

Iqc=find(ismember(conf.argo_qc.platform_number,conf.list_tag) & sum(conf.argo_qc.PSAL_QC==1)'>1);
if isempty(Iqc),
    %disp(['no valid profile: ' conf.nomfig]);
    return
end

if ~isfield(conf,'lim')
    lon=conf.argo_qc.LONGITUDE(Iqc);
    lon(lon>180)=lon(lon>180)-360;
    zone1=any(lon>-180&lon<-90);
    zone2=any(lon> -90&lon<  0);
    zone3=any(lon>   0&lon< 90);
    zone4=any(lon>  90&lon<180);
    if ~ (zone1 & zone4) | (zone2 & zone3),
        mlon=floor(min(lon)/10)*10; Mlon=ceil(max(lon)/10)*10; is_lon_center_180=0;
    else
        lon(lon<0)=lon(lon<0)+360;
        mlon=floor(min(lon)/10)*10; Mlon=ceil(max(lon)/10)*10; is_lon_center_180=1;
    end
    conf.lim=[floor(min(conf.argo_qc.LATITUDE(Iqc))/2)*2-2 ceil(max(conf.argo_qc.LATITUDE(Iqc))/2)*2+2 mlon Mlon];
else
    conf.lim(conf.lim>180)=conf.lim(conf.lim>180)-360;
end



H=[];

P_clim=conf.argo_clim.PRES;
T_clim=conf.argo_clim.TEMP;
S_clim=conf.argo_clim.PSAL;
Np_clim=conf.argo_clim.nr+1;

N=conf.argo_qc.np;
Ntag=conf.argo_qc.ntag;
Np=conf.argo_qc.nr+1;

P = conf.argo_qc.PRES;
T = conf.argo_qc.TEMP;
S = conf.argo_qc.PSAL;
T(conf.argo_qc.TEMP_QC>2)=NaN;
S(conf.argo_qc.PSAL_QC>2)=NaN;

P_raw = P;
T_raw = T*NaN;
S_raw = S*NaN;
T1=0*(1:Ntag)';T2=T1;S1=T1;S2=T1;
if isfield(conf,'calib_coeff')
    for ktag=1:Ntag,
        I=find(conf.argo_qc.index_tag==ktag);
        if isempty(I), continue, end
        T1(ktag)=conf.calib_coeff(ktag,2);
        T2(ktag)=conf.calib_coeff(ktag,3);
        S1(ktag)=conf.calib_coeff(ktag,4);
        S2(ktag)=conf.calib_coeff(ktag,5);
        T_raw(:,I) = T(:,I) + T1*1e-3.* P_raw(:,I) + T2;
        S_raw(:,I) = S(:,I) + S1*1e-3.* P_raw(:,I) + S2;
    end
end

if isfield(conf,'offset')
    for ktag=1:Ntag,
        I=find(conf.argo_qc.index_tag==ktag);
        S_raw(:,I) = S_raw(:,I) - repmat(conf.offset(I),size(S,1),1);
        S2(ktag) = S2(ktag) + mean(conf.offset(I));
    end
end

if ~isfield(conf,'Z')
    conf.Z=conf.argo_qc.index_tag;
    conf.edges=1:max(conf.Z);
end

if ~isfield(conf,'str'),
    conf.str ={};
end

Ncol=length(conf.edges);

if Ncol<2, % no coloring case
    n=length(Ntag);
    bin = ones(Ntag,1);
    col=[0 0 1];
else % general case
    [n,bin] = histc(conf.Z,conf.edges);
    col=jet(Ncol);
end

if ~isfield(conf,'Tlim') | length(conf.Tlim)~=2
    conf.Tlim=[-2 6];
end
if ~isfield(conf,'Slim') | length(conf.Slim)~=2
    conf.Slim=[33.5 35];
end

if isfield(conf,'hfig') & conf.hfig~=0
    figure(conf.hfig); clf
else
    figure;conf.hfig=gcf;
end

noclim=1;
if isfield(conf,'argo_clim') & ~isempty(conf.argo_clim)
    noclim=0;
end
if isfield(conf,'noclim') & conf.noclim
    noclim=1;
end

%% initialisation

ax1=axes('position',[0 .55 .25 .4]);axis off

ax2=axes('position',[.05 .55 .4 .4]);
set(gca,'fontsize',7);
xlabel('THETA-S RAW PROFILES','fontsize',8);
hold on
set_tsdiag(conf.Slim,conf.Tlim,0,27:.2:28);
if ~noclim,
    % plot clim TS data
    if conf.lim(3)<conf.lim(4)
        J=find( ...
            conf.argo_clim.LATITUDE>=conf.lim(1) & conf.argo_clim.LATITUDE<=conf.lim(2) & ...
            conf.argo_clim.LONGITUDE>=conf.lim(3) & conf.argo_clim.LONGITUDE<=conf.lim(4) ...
            );
    else
        aux = conf.argo_clim.LONGITUDE;
        aux(aux<0)=aux(aux<0)+360;
        J=find( ...
            conf.argo_clim.LATITUDE>=conf.lim(1) & conf.argo_clim.LATITUDE<=conf.lim(2) & ...
            aux>=conf.lim(4) & aux<=conf.lim(3) ...
            );
    end
    if length(J)==0
        disp(['no profile wod: ' conf.nomfig]);
        return;
    end
    positions = [conf.argo_clim.LONGITUDE(J),conf.argo_clim.LATITUDE(J)] ;
    [positions,ia,ic] = unique(positions,'rows'); J=J(ia);
    if exist('delaunayTriangulation')
        DT = delaunayTriangulation(positions);
    else
        DT = DelaunayTri(positions);
    end
    if ~isempty(DT.ConnectivityList)
        vi = nearestNeighbor(DT,[conf.argo_qc.LONGITUDE(Iqc),conf.argo_qc.LATITUDE(Iqc)]);
        J=J(unique(vi));
        nn=length(J);
    else
        nn=0;
    end
    if nn
        Pts=[P_clim(:,J);zeros(1,nn)*NaN]; Pts=Pts(:);
        Tts=[T_clim(:,J);zeros(1,nn)*NaN];  Tts=Tts(:);
        Sts=[S_clim(:,J);zeros(1,nn)*NaN];  Sts=Sts(:);
        It=find(~isnan(Tts));It=union(It,Np_clim:Np_clim:length(Tts));
        Is=find(~isnan(Sts));Is=union(Is,Np_clim:Np_clim:length(Sts));
        Pt=Pts(It);Tt=Tts(It);Ps=Pts(Is);Ts=Tts(Is);Ss=Sts(Is);
        Ts_pot=sw_ptmp(Ss,Ts,Ps,0);
        plot(Ss,Ts_pot,'-','color','k','linewidth',.3);
    end
end
for ss=[34.6:.05:34.8]
    plot([ss ss],[conf.Tlim(1) conf.Tlim(2)],'k','linewidth',.3)
end

ax3=axes('position',[.55 .55 .4 .4]);
set(gca,'fontsize',7);
xlabel('THETA-S COR PROFILES','fontsize',8);
hold on
set_tsdiag(conf.Slim,conf.Tlim,0,27:.2:28);
if ~noclim & nn,
    plot(Ss,Ts_pot,'-','color','k','linewidth',.3);
end
for ss=[34.6:.05:34.8]
    plot([ss ss],[conf.Tlim(1) conf.Tlim(2)],'k','linewidth',.3)
end

ax4=axes('position',[.05 .05 .4 .42]);
axis(conf.lim([3:4 1:2]));
hold on
if ~noclim & nn,
    plot(conf.argo_clim.LONGITUDE(J),conf.argo_clim.LATITUDE(J),'.',...
        'color','k','markersize',10)
end

descr_str = conf.str;
base_descr_str = descr_str;
H2=[];

if isfield(conf,'pause') & conf.pause
    pause
end

for jj=1:length(conf.list_tag),
    
    if conf.lim(3)<conf.lim(4)
        J=find(bin==jj & sum(conf.argo_qc.PSAL_QC==1)'>1 & ...
            conf.argo_qc.LATITUDE>=conf.lim(1) & conf.argo_qc.LATITUDE<=conf.lim(2) & ...
            conf.argo_qc.LONGITUDE>=conf.lim(3) & conf.argo_qc.LONGITUDE<=conf.lim(4) ...
            );
    else
        aux = conf.argo_qc.LONGITUDE;
        aux(aux<0)=aux(aux<0)+360;
        J=find(bin==jj & sum(conf.argo_qc.PSAL_QC==1)'>1 & ...
            conf.argo_qc.LATITUDE>=conf.lim(1) & conf.argo_qc.LATITUDE<=conf.lim(2) & ...
            aux>=conf.lim(4) & aux<=conf.lim(3) ...
            );
    end
    nn=length(J);
    
    if nn,
        
        % plot raw TS data
        Pts=[P_raw(:,J);zeros(1,nn)*NaN]; Pts=Pts(:);
        Tts=[T_raw(:,J);zeros(1,nn)*NaN];  Tts=Tts(:);
        Sts=[S_raw(:,J);zeros(1,nn)*NaN];  Sts=Sts(:);
        It=find(~isnan(Tts));It=union(It,Np:Np:length(Tts));
        Is=find(~isnan(Sts));Is=union(Is,Np:Np:length(Sts));
        Pt=Pts(It);Tt=Tts(It);Ps=Pts(Is);Ts=Tts(Is);Ss=Sts(Is);
        Ts_pot=sw_ptmp(Ss,Ts,Ps,0);
        
        axes(ax2);
        H=[H plot(Ss,Ts_pot,'-','color',col(jj,:),'linewidth',1)];
        
        % plot cor TS data
        Pts=[P(:,J);zeros(1,nn)*NaN]; Pts=Pts(:);
        Tts=[T(:,J);zeros(1,nn)*NaN];  Tts=Tts(:);
        Sts=[S(:,J);zeros(1,nn)*NaN];  Sts=Sts(:);
        It=find(~isnan(Tts));It=union(It,Np:Np:length(Tts));
        Is=find(~isnan(Sts));Is=union(Is,Np:Np:length(Sts));
        Pt=Pts(It);Tt=Tts(It);Ps=Pts(Is);Ts=Tts(Is);Ss=Sts(Is);
        Ts_pot=sw_ptmp(Ss,Ts,Ps,0);
        
        axes(ax3);
        H=[H plot(Ss,Ts_pot,'-','color',col(jj,:),'linewidth',1)];
        axes(ax4);
        H=[H plot(conf.argo_qc.LONGITUDE(J),conf.argo_qc.LATITUDE(J),'.',...
            'color',col(jj,:),'markersize',10)];
                
        ax6=axes('position',[.55 .05 .4 .42]);axis off
        axes(ax6);
        if isfield(conf.argo_qc,'list_smru_platform')
            descr_str={descr_str{:},' ', ...
                sprintf('%s :\n %d profiles \n coef temperature : a = %g ; b =%g \n coef salinity : a = %g ; b=%g \n time : %s \n %s'...
                ,conf.argo_qc.list_smru_platform{jj},nn,T1(jj),T2(jj),S1(jj),S2(jj))...
                ,datestr(conf.argo_qc.JULD(1)),datestr(conf.argo_qc.JULD(end))};
       
        else
            descr_str={descr_str{:},' ', ...
                sprintf('%s: %d profiles',conf.argo_qc.platform_number{J(1)},nn)};
        end
        
        if isfield(conf,'pause') & conf.pause
            pause
        end
        
    end
    
end

H2=text(0.5,0.5,descr_str, ...
    'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',12);

% print figure
if isfield(conf,'nomfig') & length(conf.nomfig)>4 & strcmp(conf.nomfig(end-3),'.')
    format_figure_centred([20 15]);
    suffix=conf.nomfig(end-2:end);
    if strcmp(suffix,'png')
        feval(@print,'-dpng','-r300',conf.nomfig);
    elseif strcmp(suffix,'eps')
        feval(@print,'-depsc2','-tiff',conf.nomfig);
    else
        feval(@print,['-d' suffix],'-r300',conf.nomfig);
    end
    H=[];
end



