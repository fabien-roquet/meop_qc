function [argo_qc,nn] = remove_Sprofiles (info_deployment, smru_name, criterion_type, value, suffix)
% flag a list of salinity profile based on criterion
%
% type of criterion (criterion_type):
%   index:  value gives the list of profile index
%   Pmin :  value gives the minimum valid pressure
%   Pmax :  value gives the maximum valid pressure
%   Tmin :  value gives the minimum valid temperature
%   Tmax :  value gives the maximum valid temperature
%   Smin :  value gives the minimum valid salinity
%   Smax :  value gives the maximum valid salinity
%   P+S- :  [Pmin Smax]
%   date_min : value gives the minimum valid date, relative to first profile date
%   date_max : value gives the maximum valid date, relative to first profile date

if ~exist('suffix','var'),
    suffix='_lr0';
end

smru_name = strrep(smru_name,'_lr0','');
name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
if ~exist(name_prof,'file'), return; end

argo_qc=ARGO_load_qc(name_prof,0);

if ~exist('criterion_type','var')
    %I=find( strcmp(smru_name,argo_qc.smru_name)' );
    I=1:length(argo_qc.JULD);
else
    I=[];
    switch criterion_type
        
        case 'index',
            I=value;
        case 'Pmin',
            I=find(any(argo_qc.PRES<value));
        case 'Pmax',
            I=find(any(argo_qc.PRES>value));
        case 'Tmin',
            I=find(any(argo_qc.TEMP<value));
        case 'Tmax',
            I=find(any(argo_qc.TEMP>value));
        case 'Smin',
            I=find(any(argo_qc.PSAL<value));
        case 'Smax',
            I=find(any(argo_qc.PSAL>value));
        case 'P+S-',
            I=find(any(argo_qc.PRES>value(1) & argo_qc.PSAL<value(2)));
        case 'P+S+',
            I=find(any(argo_qc.PRES>value(1) & argo_qc.PSAL>value(2)));
        case 'P+T-',
            I=find(any(argo_qc.PRES>value(1) & argo_qc.TEMP<value(2)));
        case 'P+T+',
            I=find(any(argo_qc.PRES>value(1) & argo_qc.TEMP>value(2)));
        case 'P-S-',
            I=find(any(argo_qc.PRES<value(1) & argo_qc.PSAL<value(2)));
        case 'P-S+',
            I=find(any(argo_qc.PRES<value(1) & argo_qc.PSAL>value(2)));
        case 'P-T-',
            I=find(any(argo_qc.PRES<value(1) & argo_qc.TEMP<value(2)));
        case 'P-T+',
            I=find(any(argo_qc.PRES<value(1) & argo_qc.TEMP>value(2)));
        case 'T+S-',
            I=find(any(argo_qc.TEMP>value(2) & argo_qc.PSAL<value(2)));
        case 'T+S+',
            I=find(any(argo_qc.TEMP>value(2) & argo_qc.PSAL>value(2)));
        case 'T-S-',
            I=find(any(argo_qc.TEMP<value(2) & argo_qc.PSAL<value(2)));
        case 'T-S+',
            I=find(any(argo_qc.TEMP<value(2) & argo_qc.PSAL>value(2)));
        case 'date_min',
            Itag=1:length(argo_qc.JULD);
            date = argo_qc.JULD(Itag); date=date-min(date);
            Iprof = find( date < value );
            I=Itag(Iprof);
        case 'date_max',
            Itag=1:length(argo_qc.JULD);
            date = argo_qc.JULD(:); date=date-min(date);
            Iprof = find( date > value );
            I=Itag(Iprof);
        otherwise
            disp(['In remove_Sprofiles: ' strtype ' is not a valid type']);
            I=[];
    end
    
end

nn=length(I);

if nn,
    for kk=1:nn,
        p = argo_qc.PSAL_QC(:,I(kk)); argo_qc.PSAL_QC(p~=9,I(kk))=4;
    end
end
argo_qc.PSAL(argo_qc.PSAL_QC>1)=NaN;

argo_qc.PRES_QC(argo_qc.PSAL_QC(:)==4 & argo_qc.TEMP_QC(:)==9)=4;
argo_qc.PRES(argo_qc.PRES_QC>1)=NaN;

ARGO_save_qc(name_prof,argo_qc,0);



%%  special case: delete all Sprofiles -> apply to fr0
if ~exist('criterion_type','var')
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,'_fr0');
    if ~exist(name_prof,'file'), return; end
    argo_qc=ARGO_load_qc(name_prof,0);
    I=1:length(argo_qc.JULD);
    if length(I),
        for kk=1:length(I),
            p = argo_qc.PSAL_QC(:,I(kk)); argo_qc.PSAL_QC(p~=9,I(kk))=4;
        end
    end
    argo_qc.PSAL(argo_qc.PSAL_QC>1)=NaN;
    argo_qc.PRES_QC(argo_qc.PSAL_QC(:)==4 & argo_qc.TEMP_QC(:)==9)=4;
    argo_qc.PRES(argo_qc.PRES_QC>1)=NaN;
    ARGO_save_qc(name_prof,argo_qc,0);
end


