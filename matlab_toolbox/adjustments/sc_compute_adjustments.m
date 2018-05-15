%% load data

%% create calibration plot directory
[s,mess,messid] = mkdir(sprintf('%s%s/%s',conf.calibplotdir,info_deployment.NATION,info_deployment.EXP));
delete(sprintf('%s%s/%s/*.png',conf.calibplotdir,info_deployment.NATION,info_deployment.EXP))

%% visualization of TS plots
conf_wod.lon=[];
conf_wod.lat=[];
for ii=1:length(info_deployment.list_tag)
    conf_wod.lon=[conf_wod.lon;ncread([info_deployment.dir info_deployment.list_tag(ii).name],'LONGITUDE')];
    conf_wod.lat=[conf_wod.lat;ncread([info_deployment.dir info_deployment.list_tag(ii).name],'LATITUDE')];
end

conf_wod.woddir=conf.woddir;
argo_clim=load_WOD(conf_wod);
if isempty(argo_clim)
    return;
end

%% load seal deployment data
Mgroup=[]; list_smru_platform={};
for itag=1:length(info_deployment.list_tag)
    name_prof = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag_lr1(itag).name);
    if exist(name_prof,'file'),
        Mqc=ARGO_load_qc(name_prof,3);
        list_smru_platform{itag}=Mqc.smru_platform_code;
        if length(Mqc.platform_number),
            list_platform_number{itag}=Mqc.platform_number{1};
        else
            list_platform_number{itag}='';
        end
        Mgroup=ARGO_concat(Mgroup,Mqc);
    else
        disp(['no data file: ' name_prof]);
        info_deployment.list_tag(itag)=[];
    end
end
Mgroup.list_smru_platform=list_smru_platform;
Mgroup.list_platform_number=list_platform_number;
%%
[I,J]=find(Mgroup.TEMP_QC==1);
J=unique(J);
if length(J)>0
    tmp=Mgroup.TEMP(:,J);
    tmp=nanmax(tmp);
    tmp=sort(tmp(~isnan(tmp)));
    temp_max=tmp(min([ceil(.99*length(tmp)) length(tmp)]));
    tmp=Mgroup.TEMP(:,J);
    tmp=nanmin(tmp);
    tmp=sort(tmp(~isnan(tmp)));
    temp_min=tmp(max([floor(.01*length(tmp)) 1]));
else
    temp_max=5;
    temp_min=-2;
end
[I,J]=find(Mgroup.PSAL_QC==1);
J=unique(J);
if length(J)>0
    tmp=Mgroup.PSAL(:,J);
    tmp=nanmax(tmp);
    tmp=sort(tmp(~isnan(tmp)));
    sal_max=max([35,tmp(min([ceil(.99*length(tmp)) length(tmp)]))]);
    tmp=Mgroup.PSAL(:,J);
    tmp=nanmin(tmp);
    tmp=sort(tmp(~isnan(tmp)));
    sal_min=tmp(max([floor(.01*length(tmp)) 1]));
else
    sal_max=36;
    sal_min=33;
end
%% 
if exist([conf.builddir 'build_fcell_' EXP '.m'],'file'),
    try; eval(['build_fcell_' EXP ';']); catch; disp([EXP ': error in the build']); end
end

%% compute comparison plots
for itag=1:length(info_deployment.list_tag)
        
        %%
        conf_adjustement=[];
        conf_adjustement.Nprof_diags=100;        
        if exist([conf.adjustment 'adjustments_' EXP '.m'],'file'),
            eval(['adjustments_' EXP ';']);
        end
        if isfield(conf_adjustement,sprintf('%s%02d',EXP,itag))
            if isfield(getfield(conf_adjustement,sprintf('%s%02d',EXP,itag)),'Nprof_diags')
                conf_adjustement.Nprof_diags=getfield(getfield(conf_adjustement,sprintf('%s%02d',EXP,itag)),'Nprof_diags');
            end
        end
        I=find(strcmp(Mgroup.platform_number,list_platform_number{itag}));
        if length(I)==length(Mgroup.index_tag)
            Mtemp=Mgroup;
        elseif length(I)>0
            Mtemp=extract_profil(Mgroup,I);
        else
            continue
        end
        conf_adjustement.argo_qc=Mtemp;
        conf_adjustement.argo_clim=argo_clim;
        t= getfield(calib_coeff,EXP);
        conf_adjustement.calib_coeff = t(itag,:);
        if exist('salinity_offset')
            if isfield(salinity_offset,sprintf('%s%02d',EXP,itag))
                o=getfield(salinity_offset,sprintf('%s%02d',EXP,itag));
                o(1,end)=length(I);
                Offset=interp1(o(1,:),o(2,:),1:length(I));
            else
                Offset=(1:length(I))*0;
            end
            conf_adjustement.offset=Offset;
        end
        conf_adjustement.pause=0;
        conf_adjustement.Tlim=[temp_min temp_max]; conf_adjustement.Slim=[sal_min sal_max];
      %  conf_adjustement.list_tag=1;
        conf_adjustement.hfig=1;
        conf_adjustement.nomfig=sprintf('%s%s/%s/calibration_%02d_0.png',...
            conf.calibplotdir,info_deployment.NATION,info_deployment.EXP,itag);
        TS_diags_comparison(conf_adjustement);
        J=1:conf_adjustement.Nprof_diags:length(I);
        if J(end)~=length(I)
            J(end+1)=length(I);
        end
        for jj=1:length(J)-1
            Msmall=extract_profil(Mtemp,J(jj):J(jj+1)-1);
            if exist('salinity_offset'), conf_adjustement.offset=Offset(J(jj):J(jj+1)-1); end
            conf_adjustement.argo_qc=Msmall;
            conf_adjustement.nomfig=sprintf('%s%s/%s/calibration_%02d_%03d_part%02d.png',...
                conf.calibplotdir,info_deployment.NATION,info_deployment.EXP,...
                itag,conf_adjustement.Nprof_diags,jj);
            TS_diags_comparison(conf_adjustement);
        end
        %%
        % %% estimate Toffset using freezing temperature
        % Mqc=ARGO_load_qc(name_prof,1);
        % Toffset = estimate_Toffset_freezing_temp(Mqc);
        %
        % %% estimate offset minimizing surface salinity differences
        % %  (additive offset, put in salinity_offset)
        %
        % Mqc=ARGO_load_qc(name_prof,1);
        % Soffset = estimate_Soffset_surface_salinity(Mqc,'NKP');
        %
        %
        
end



