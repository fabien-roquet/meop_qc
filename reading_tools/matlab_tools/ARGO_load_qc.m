function [argo_qc]=ARGO_load_qc(fileIn,varargin);
%function: 	ARGO_load_qc
%object:	read Argo netcdf data files
%
%usage:		[argo_qc]=ARGO_load_qc(fileIn);
%               ---> loads full data set (adjusted+raw data)
%           [argo_qc]=ARGO_load_qc(fileIn,adjusted);
%               ---> adjusted == 0 : load raw data (keep flagged data)
%                                1 : load adjusted data, but keeping headers of all profiles
%                                2 : load raw+adjusted data [default value]
%                                3 : load adjusted data only, removing headers of bad profiles
%
%note:      - replaces missing values with NaN
%   		- adds a couple fields: np, nr, list_descr, Pmask, Tmask, Smask
%
%inputs:	fileIn		data file name
%outputs:	argo_qc	structure containing the various qc fields
%
%example of usage: data=ARGO_load_qc('ct84-744-12_prof.nc');
%
% F. Roquet, 2016




% check that file exists and add prefix and suffix if necessary
[pathstr, name, ext] = fileparts(fileIn);
if isempty(pathstr) | strcmp(pathstr,'.'), pathstr=pwd; end
if isempty(ext) | ~strcmp(ext,'.nc'), ext='.nc'; end
fileIn=[pathstr '/' name ext];
if ~exist(fileIn,'file'), error([fileIn ' : file not found']); end

if nargin>1, adjusted=varargin{1}; else, adjusted=2; end

argo_qc=[];
list_basevar = {'PLATFORM_NUMBER','LATITUDE','LONGITUDE',...
    'JULD_LOCATION','PI_NAME','CYCLE_NUMBER'};

% set list of data to be loaded
switch adjusted
    case 0
        list_var={list_basevar{:},...
            'PRES','TEMP','PSAL',...
            'PRES_QC','TEMP_QC','PSAL_QC'...
            'CHLA','DOXY','CHLA_QC','DOXY_QC'};
    case 1
        list_var={list_basevar{:},...
            'PRES_ADJUSTED','TEMP_ADJUSTED','PSAL_ADJUSTED',...
            'PRES_ADJUSTED_QC','TEMP_ADJUSTED_QC','PSAL_ADJUSTED_QC'...
            'CHLA_ADJUSTED','DOXY_ADJUSTED','CHLA_ADJUSTED_QC','DOXY_ADJUSTED_QC'};
    case 2,
        list_var={list_basevar{:},...
            'PRES_ADJUSTED','TEMP_ADJUSTED','PSAL_ADJUSTED',...
            'PRES_ADJUSTED_QC','TEMP_ADJUSTED_QC','PSAL_ADJUSTED_QC',...
            'PRES','TEMP','PSAL','TEMP_ADJUSTED_ERROR','PSAL_ADJUSTED_ERROR'...
            'CHLA_ADJUSTED','DOXY_ADJUSTED','CHLA_ADJUSTED_QC','DOXY_ADJUSTED_QC'...
            'CHLA','DOXY','CHLA_QC','DOXY_QC'};
    case 3
        list_var={list_basevar{:},...
            'PRES_ADJUSTED','TEMP_ADJUSTED','PSAL_ADJUSTED',...
            'PRES_ADJUSTED_QC','TEMP_ADJUSTED_QC','PSAL_ADJUSTED_QC'...
            'CHLA_ADJUSTED','DOXY_ADJUSTED','CHLA_ADJUSTED_QC','DOXY_ADJUSTED_QC'};
end
finfo = ncinfo(fileIn);
vars={finfo.Variables.Name};
list_var = intersect(vars,list_var);

% load data
dd=ncload_struct(fileIn,list_var{:});

% handle ADJUSTED fields
if adjusted==1 | adjusted==3
    dd.PRES = dd.PRES_ADJUSTED; dd=rmfield(dd,'PRES_ADJUSTED');
    dd.TEMP = dd.TEMP_ADJUSTED; dd=rmfield(dd,'TEMP_ADJUSTED');
    dd.PSAL = dd.PSAL_ADJUSTED; dd=rmfield(dd,'PSAL_ADJUSTED');
    if isfield( dd,'CHLA_ADJUSTED')
        dd.CHLA = dd.CHLA_ADJUSTED; dd=rmfield(dd,'CHLA_ADJUSTED');
    end
    if isfield (dd,'DOXY_ADJUSTED')
        dd.DOXY = dd.DOXY_ADJUSTED; dd=rmfield(dd,'DOXY_ADJUSTED');
    end
end

% handle masks
if adjusted==0,
    dd.PRES_QC = double(dd.PRES_QC);
    dd.TEMP_QC = double(dd.TEMP_QC);
    dd.PSAL_QC = double(dd.PSAL_QC);
    if isfield (dd,'CHLA')
        dd.CHLA_QC = double(dd.CHLA_QC);
    end
    if isfield (dd,'DOXY')
        dd.DOXY_QC = double(dd.DOXY_QC);
    end
else
    dd.PRES_QC = double(dd.PRES_ADJUSTED_QC); dd=rmfield(dd,'PRES_ADJUSTED_QC');
    dd.TEMP_QC = double(dd.TEMP_ADJUSTED_QC); dd=rmfield(dd,'TEMP_ADJUSTED_QC');
    dd.PSAL_QC = double(dd.PSAL_ADJUSTED_QC); dd=rmfield(dd,'PSAL_ADJUSTED_QC');
    if isfield (dd,'CHLA')
        dd.CHLA_QC =double(dd.CHLA_ADJUSTED_QC); dd=rmfield(dd,'CHLA_ADJUSTED_QC');
    end
    if isfield (dd,'DOXY')
        dd.DOXY_QC = double(dd.DOXY_ADJUSTED_QC); dd=rmfield(dd,'DOXY_ADJUSTED_QC');
    end
end
dd.PRES_QC(dd.PRES_QC>47) = dd.PRES_QC(dd.PRES_QC>47)-48;dd.PRES_QC(dd.PRES_QC==32) = 9;
dd.TEMP_QC(dd.TEMP_QC>47) = dd.TEMP_QC(dd.TEMP_QC>47)-48;dd.TEMP_QC(dd.TEMP_QC==32) = 9;
dd.PSAL_QC(dd.PSAL_QC>47) = dd.PSAL_QC(dd.PSAL_QC>47)-48;dd.PSAL_QC(dd.PSAL_QC==32) = 9;
if isfield (dd,'CHLA')
    dd.CHLA_QC(dd.CHLA_QC>47) = dd.CHLA_QC(dd.CHLA_QC>47)-48;dd.CHLA_QC(dd.CHLA_QC==32) = 9;
end
if isfield (dd,'DOXY')
    dd.DOXY_QC(dd.DOXY_QC>47) = dd.DOXY_QC(dd.DOXY_QC>47)-48;dd.DOXY_QC(dd.PRES_QC==32) = 9;
end
dd.Tmask = double(dd.TEMP_QC==1);
dd.Smask = double(dd.PSAL_QC==1);
% if exist ('dd.CHLA')
%     dd.CHLA = dd.CHLA_ADJUSTED; dd=rmfield(dd,'CHLA_ADJUSTED');
% end
% if exist ('dd.DOXY')
%     dd.DOXY = dd.DOXY_ADJUSTED; dd=rmfield(dd,'DOXY_ADJUSTED');
% end
dd.mask = sum( dd.Tmask+dd.Smask , 1)';
Iprof=1:length(dd.LATITUDE);
if adjusted == 3,
    Iprof=Iprof(find(dd.mask(Iprof)));
end

list_var={'LATITUDE','LONGITUDE','JULD_LOCATION','CYCLE_NUMBER'};
for ii=1:length(list_var),
    if isfield(dd,list_var{ii})
        data=eval(['dd.' list_var{ii} '(Iprof)']);
        argo_qc=setfield(argo_qc,list_var{ii},data);
    end
end

% change date format
argo_qc.JULD_LOCATION=argo_qc.JULD_LOCATION+datenum(1950,1,1);
argo_qc.JULD=argo_qc.JULD_LOCATION;

list_var={'PLATFORM_NUMBER','PI_NAME'};
for ii=1:length(list_var),
    if isfield(dd,list_var{ii})
        data=eval(['dd.' list_var{ii} '(:,Iprof)']);
        argo_qc=setfield(argo_qc,list_var{ii},data);
    end
end

list_var={'PRES','TEMP','PSAL','PRES_QC','TEMP_QC','PSAL_QC','CHLA','DOXY','CHLA_QC','DOXY_QC'};
for ii=1:length(list_var),
    if isfield(dd,list_var{ii})
        data=eval(['dd.' list_var{ii} '(:,Iprof)']);
        argo_qc=setfield(argo_qc,list_var{ii},data);
    end
end

if adjusted==2,
    list_var={'PRES_ADJUSTED','TEMP_ADJUSTED','PSAL_ADJUSTED','TEMP_ADJUSTED_ERROR','PSAL_ADJUSTED_ERROR'...
        ,'CHLA_ADJUSTED','DOXY_ADJUSTED','CHLA_ADJUSTED_ERROR','DOXY_ADJUSTED_ERROR'};
    for ii=1:length(list_var),
        if isfield(dd,list_var{ii})
            data=eval(['dd.' list_var{ii} '(:,Iprof)']);
            argo_qc=setfield(argo_qc,list_var{ii},data);
        end
    end
end

if adjusted~=0,
    argo_qc.PRES(argo_qc.PRES_QC>1)=NaN;
    argo_qc.TEMP(argo_qc.TEMP_QC>1)=NaN;
    argo_qc.PSAL(argo_qc.PSAL_QC>1)=NaN;
    if isfield (dd,'CHLA')
        argo_qc.CHLA(argo_qc.CHLA_QC>1)=NaN;
    end
    if isfield (dd,'DOXY')
        argo_qc.DOXY(argo_qc.DOXY_QC>1)=NaN;
    end

end

if adjusted==2,
    argo_qc.PRES_ADJUSTED(argo_qc.PRES_QC>1)=NaN;
    argo_qc.TEMP_ADJUSTED(argo_qc.TEMP_QC>1)=NaN;
    argo_qc.PSAL_ADJUSTED(argo_qc.PSAL_QC>1)=NaN;
    if exist ('dd.CHLA')
        argo_qc.CHLA_ADJUSTED(argo_qc.CHLA_QC>1)=NaN;
    end
    if exist ('dd.DOXY')
        argo_qc.DOXY_ADJUSTED(argo_qc.DOXY_QC>1)=NaN;
    end
end


%add a couple things:
%--------------------
argo_qc.np=size(argo_qc.PRES_QC,2);
argo_qc.nr=size(argo_qc.PRES_QC,1);
argo_qc.platform_number = cellstr(argo_qc.PLATFORM_NUMBER');
[list_descr,m,n]=unique(argo_qc.platform_number);
argo_qc.list_descr=list_descr;
for kk=1:length(list_descr),
    I=find(strcmp(list_descr{kk},argo_qc.platform_number));
    argo_qc.nprof(kk) = length(I);
    argo_qc.index_tag(I) = kk;
end
argo_qc.ntag=length(list_descr);

% load global attributes
data_att=ncloadatt_struct(fileIn);
listatt = fieldnames(data_att);
for ii=1:length(listatt),
    argo_qc = setfield(argo_qc,listatt{ii},getfield(data_att,listatt{ii}));
end




function data = ncload_struct(fileIn, varargin);

% ncload -- Load NetCDF variables.
%  ncload('fileIn', 'var1', 'var2', ...) loads the
%   given variables of 'fileIn' into the Matlab
%   workspace of the "caller" of this routine.  If no names
%   are given, all variables are loaded.

data=struct;

if ~exist(fileIn,'file'), 
    disp(sprintf('error: %s does not exist',fileIn))
    return,
end

if isempty(varargin); 
    finfo = ncinfo(fileIn);
    vars={finfo.Variables.Name};
    varargin = vars; 
end;

for ii = 1:length(varargin)
    try
        aa = ncread(fileIn,varargin{ii});
        if isnumeric(aa), aa=double(aa); end
        data = setfield( data, varargin{ii}, aa );
    catch
        disp(sprintf('error: %s is not a variable of %s',varargin{ii},fileIn));
    end;
end



function data = ncloadatt_struct(fileIn, varargin);

% ncload -- Load NetCDF variables.
%  ncload('fileIn', 'var1', 'var2', ...) loads the
%   given variables of 'fileIn' into the Matlab
%   workspace of the "caller" of this routine.  If no names
%   are given, all variables are loaded.

data=struct;

if ~exist(fileIn,'file'), 
    disp(sprintf('error: %s does not exist',fileIn))
    return,
end

if isempty(varargin); 
    finfo = ncinfo(fileIn);
    atts={finfo.Attributes.Name};
    varargin = atts; 
end;

for ii = 1:length(varargin)
    try
        aa = ncreadatt(fileIn,'/',varargin{ii});
        if isnumeric(aa), aa=double(aa); end
        data = setfield( data, varargin{ii}, aa );
    catch
        disp(sprintf('error: %s is not an attribute of %s',varargin{ii},fileIn));
    end;
end




