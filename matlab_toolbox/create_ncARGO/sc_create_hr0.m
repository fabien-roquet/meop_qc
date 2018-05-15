% create a hr0 ncfile file starting from a low resolution one

list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = list_tag(index).name(1:end-12);

    suffix = '_lr0';
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
    Mqc=ARGO_load_qc(name_prof,0);

    name_prof_hr0 = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_hr0');
    if exist(name_prof_hr0,'file'), delete(name_prof_hr0); end
    
    name_fcell=[conf.temporary_fcell info_deployment.EXP '_lr0_fcell.mat'];
    load(name_fcell);
    
    I = strcmp(hs,smru_name);
    hs = hs(I);
    hi = hi(I,:);
    
    PRES=Mqc.PRES;
    Mqc.PRES_QC(Mqc.PRES_QC==0) = 1;
    Pmask=double(Mqc.PRES_QC==1);
    PRES(Pmask==0) = NaN;

    TEMP=Mqc.TEMP;
    Mqc.TEMP_QC(Mqc.TEMP_QC==0) = 1;
    Tmask=double(Mqc.TEMP_QC==1);
    TEMP(Tmask==0) = NaN;

    SALI=Mqc.PSAL;
    Mqc.PSAL_QC(Mqc.PSAL_QC==0) = 1;
    Smask=double(Mqc.PSAL_QC==1);
    SALI(Smask==0) = NaN;

    CHLA=Mqc.PRES*NaN; 
    if isfield(Mqc,'CHLA'), 
        CHLA=Mqc.CHLA;
        Mqc.CHLA_QC(Mqc.CHLA_QC==0) = 1;
        Fmask=double(Mqc.CHLA_QC==1);
        CHLA(Fmask==0) = NaN;
    end
    
    DOXY=Mqc.PRES*NaN;
    if isfield(Mqc,'DOXY'),
        DOXY=Mqc.DOXY;
        Mqc.DOXY_QC(Mqc.DOXY_QC==0) = 1;
        Omask=double(Mqc.DOXY_QC==1);
        DOXY(Omask==0) = NaN;
    end    
    
    std_lev = [1:1000]';
    sc_profiles_interp;
    
    P=PRES_std_lev;
    T=TEMP_std_lev;
    S=SALI_std_lev;
    F=CHLA_std_lev;
    O=DOXY_std_lev;
    
    %% write fcell files
    N=size(hi,1);
    PTi=cell(1,N); PSi=cell(1,N);
    PFi=cell(1,N); POi=cell(1,N);    
    for ii=1:N,        
        PTi{ii}=[P(:,ii) T(:,ii)];
        PSi{ii}=[P(:,ii) S(:,ii)];
        PFi{ii}=[P(:,ii) F(:,ii)];
        POi{ii}=[P(:,ii) O(:,ii)];
        hi(ii,8)=sum(~isnan(T(:,ii)));        
    end
    
    %save fcell
    name_fcell=[conf.temporary_fcell smru_name '_hr0_fcell.mat'];
    save(name_fcell,'hi','hs','PTi','PSi','PFi','POi','EXP','PI','NATION','isoxy','isfluo');
    
    %% save in Argo netcdf format
    if length(hi)>0
        suffix = 'hr0_prof.nc';
        convert_fcell2ARGO(conf,info_deployment.EXP,name_fcell,suffix,1000);
    end

    %% set masks
    
    Mqc.PRES_QC=double(~isnan(PRES_std_lev)); Mqc.PRES_QC(Mqc.PRES_QC==0)=9;
    Mqc.TEMP_QC=double(~isnan(TEMP_std_lev)); Mqc.TEMP_QC(Mqc.TEMP_QC==0)=9;
    Mqc.PSAL_QC=double(~isnan(SALI_std_lev)); Mqc.PSAL_QC(Mqc.PSAL_QC==0)=9;
    Mqc.CHLA_QC=double(~isnan(CHLA_std_lev)); Mqc.CHLA_QC(Mqc.CHLA_QC==0)=9;
    Mqc.DOXY_QC=double(~isnan(DOXY_std_lev)); Mqc.DOXY_QC(Mqc.DOXY_QC==0)=9;

    name_prof_hr0 = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_hr0');
    ARGO_save_qc(name_prof_hr0,Mqc,0);

end
