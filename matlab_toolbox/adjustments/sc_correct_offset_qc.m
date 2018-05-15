%% script applying corrections on T and S


%% correction de temperature/salinite base sur tests in situ + ORP
Mqc = ARGO_load_qc(name_prof,0);
calib = ncload_struct(name_prof,'SCIENTIFIC_CALIB_COEFFICIENT');

Mqc.PRES_ADJUSTED=Mqc.PRES;
Mqc.TEMP_ADJUSTED=Mqc.TEMP;
Mqc.PSAL_ADJUSTED=Mqc.PSAL;
if isfield(Mqc,'CHLA'), Mqc.CHLA_ADJUSTED=Mqc.CHLA*0.6; end
if isfield(Mqc,'DOXY'), Mqc.DOXY_ADJUSTED=Mqc.DOXY;     end
if ~exist('update_calib_coeff','var')
    update_calib_coeff=1;
end
TAG=sprintf('%02d',kk);
I=1:length(Mqc.JULD);%find(strcmp(Mqc.platform_number,Mqc.list_descr{kk}));
if ~isempty(I)
    P1=0; P2=0; T1=0; T2=0; S1=0; S2=0;
    
    if exist('pressure_correction','var') & isstruct(pressure_correction)
        if isfield(pressure_correction,EXP)
            coef=getfield(pressure_correction,EXP);
            coef(isnan(coef))=0;
            P1=P1+coef(kk,1);
            P2=P2+coef(kk,2);
        end
    end
    if exist('calib_coeff','var') & isstruct(calib_coeff)
        if isfield(calib_coeff,EXP)
            coef=getfield(calib_coeff,EXP);
            coef(isnan(coef))=0;
            T1=T1+coef(kk,2)*1e-3;
            T2=T2+coef(kk,3);
            S1=S1+coef(kk,4)*1e-3;
            S2=S2+coef(kk,5);
        end
    end
    
    %disp(sprintf('\t%d\t%3.2f\t%3.2f\t%3.2f\t%3.2f',kk,T1*1e3,T2,S1*1e3,S2))
    
    Mqc.PRES_ADJUSTED(:,I)=Mqc.PRES_ADJUSTED(:,I) - P1.* Mqc.PRES_ADJUSTED(:,I) - P2;
    Mqc.TEMP_ADJUSTED(:,I)=Mqc.TEMP_ADJUSTED(:,I) - T1.* Mqc.PRES_ADJUSTED(:,I) - T2;
    Mqc.PSAL_ADJUSTED(:,I)=Mqc.PSAL_ADJUSTED(:,I) - S1.* Mqc.PRES_ADJUSTED(:,I) - S2;
    
    if update_calib_coeff
        str_calib=sprintf('a1= %8.6e , a0= %8.6e',P1,P2);
        str_calib=sprintf('%s%*s',str_calib,256-length(str_calib),' ');
        calib.SCIENTIFIC_CALIB_COEFFICIENT(:,1,1,I)=repmat(str_calib',1,length(I));
        str_calib=sprintf('b1= %8.6e , b0= %8.6e',T1,T2);
        str_calib=sprintf('%s%*s',str_calib,256-length(str_calib),' ');
        calib.SCIENTIFIC_CALIB_COEFFICIENT(:,2,1,I)=repmat(str_calib',1,length(I));
        str_calib=sprintf('c1= %8.6e , c0= %8.6e',S1,S2);
        str_calib=sprintf('%s%*s',str_calib,256-length(str_calib),' ');
        calib.SCIENTIFIC_CALIB_COEFFICIENT(:,3,1,I)=repmat(str_calib',1,length(I));
        if isfield(Mqc,'CHLA')
            str_calib=sprintf('f1= 0.6 , f0= 0.0');
            str_calib=sprintf('%s%*s',str_calib,256-length(str_calib),' ');
            SCIENTIFIC_CALIB_COEFFICIENT(:,4,1,I)=repmat(str_calib',1,length(I));
        end
    end
    
    
    
    %% correction de l'offset de salinite Sc=S+salinity_offset
    if exist('salinity_offset','var') & isstruct(salinity_offset)
        
        TAG=sprintf('%02d',kk);
        %I=find(strcmp(Mqc.platform_number,Mqc.list_descr{kk}));
        if isfield(salinity_offset,sprintf('%s%s',EXP,TAG)),
            o=getfield(salinity_offset,sprintf('%s%s',EXP,TAG));
            o(1,end)=length(I);
            offset=interp1(o(1,:),o(2,:),1:length(I));
        elseif isfield(salinity_offset,EXP)
            o=getfield(salinity_offset,EXP);
            o(isnan(o))=0;
            offset=(1:length(I))*0+o(kk);
        else
            offset=(1:length(I))*0;
        end
        if ~isnan(offset(1)),
            c = sscanf(calib.SCIENTIFIC_CALIB_COEFFICIENT(:,3,1,I(1))','c1= %f , c0= %f');
            c1 = c(1);
            c0 = c(2);
            for ii=1:length(I),
                Mqc.PSAL_ADJUSTED(:,I(ii))=Mqc.PSAL_ADJUSTED(:,I(ii))+offset(ii);
                if update_calib_coeff
                    str_calib=sprintf('c1= %8.6e , c0= %8.6e',c1,c0-offset(ii));
                    str_calib=sprintf('%s%*s',str_calib,256-length(str_calib),' ');
                    calib.SCIENTIFIC_CALIB_COEFFICIENT(:,3,1,I(ii))=str_calib;
                end
            end
        end
    end
    
    
    
    %%
    
    ncwrite(name_prof,'PRES_ADJUSTED',Mqc.PRES_ADJUSTED);
    ncwrite(name_prof,'TEMP_ADJUSTED',Mqc.TEMP_ADJUSTED);
    ncwrite(name_prof,'PSAL_ADJUSTED',Mqc.PSAL_ADJUSTED);
    if isfield(Mqc,'CHLA')
        ncwrite(name_prof,'CHLA_ADJUSTED',Mqc.CHLA_ADJUSTED);
    end
    if isfield(Mqc,'DOXY')
        ncwrite(name_prof,'DOXY_ADJUSTED',Mqc.DOXY_ADJUSTED);
    end
    if update_calib_coeff
        ncwrite(name_prof,'SCIENTIFIC_CALIB_COEFFICIENT',calib.SCIENTIFIC_CALIB_COEFFICIENT);
    end
    
    %% set first guess of observational error
    
    error = ncload_struct(name_prof,'TEMP_ADJUSTED_ERROR','PSAL_ADJUSTED_ERROR');
    error.TEMP_ADJUSTED_ERROR(:)=temp_error; error.TEMP_ADJUSTED_ERROR(Mqc.TEMP_QC==9)=NaN;
    error.PSAL_ADJUSTED_ERROR(:)=psal_error; error.PSAL_ADJUSTED_ERROR(Mqc.PSAL_QC==9)=NaN;
    ncwrite(name_prof,'TEMP_ADJUSTED_ERROR',error.TEMP_ADJUSTED_ERROR);
    ncwrite(name_prof,'PSAL_ADJUSTED_ERROR',error.PSAL_ADJUSTED_ERROR);
    
    
        
end