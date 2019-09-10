function create_fr0(conf,EXP)

info_deployment=load_info_deployment(conf,EXP);

% don't process it if no raw odv file
if ~exist([conf.rawdir info_deployment.nomfic]),
    fprintf('%s: no raw file. not processed.',EXP);
    return
end

% create netcdf HR traj and prof if FR data exist
sc_load_ctdhr2prof;

%   4) apply automated filters
list_tag = info_deployment.list_tag;
for index=1:length(list_tag),
    
    smru_name = list_tag(index).name(1:end-12);
    
    suffix = '_fr0';
    name_prof = sprintf('%s%s%s_prof.nc',info_deployment.dir,smru_name,suffix);
    if ~exist(name_prof,'file'), continue; end
    Mqc=ARGO_load_qc(name_prof,0);
    Mqc.PRES_QC(Mqc.PRES_QC==0) = 1;
    Mqc.TEMP_QC(Mqc.TEMP_QC==0) = 1;
    Mqc.PSAL_QC(Mqc.PSAL_QC==0) = 1;
    if isfield(Mqc,'CHLA_QC'), Mqc.CHLA_QC(Mqc.CHLA_QC==0) = 1; end
    if isfield(Mqc,'DOXY_QC'), Mqc.DOXY_QC(Mqc.DOXY_QC==0) = 1; end
    if isfield(Mqc,'LIGHT_QC'), Mqc.LIGHT_QC(Mqc.LIGHT_QC==0) = 1; end
    ARGO_save_qc(name_prof,Mqc,0);
    sc_filtre_seals_qc;
    
    sc_write_global_attribute;
    
end

% adjust locations
info_deployment=load_info_deployment(conf,EXP);
suffix = '_fr0';        sc_adjust_locations;

