function create_hr2(conf,EXP)


info_deployment=load_info_deployment(conf,EXP);
if ~exist(info_deployment.dir), return, end

list_tag_fr1 = info_deployment.list_tag_fr1;
for ll=1:length(list_tag_fr1),
    
    name_prof_fr0 = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag_fr0(ll).name);
    name_prof_fr1 = strrep(name_prof_fr0,'_fr0_','_fr1_');
    name_prof_hr1 = strrep(name_prof_fr0,'_fr0_','_hr1_');
    name_prof_hr2 = strrep(name_prof_fr0,'_fr0_','_hr2_');
    
    tag_fr1 = list_tag_fr1(ll).name;
    smru_name = tag_fr1(1:end-12);
    if ~ismember(smru_name,conf.hr_smru_name), continue; end
    disp(['(4c)' smru_name])
    kk = find(strcmp(smru_name,conf.hr_smru_name));
    
    if conf.hr_continuous(kk),
        
        copyfile(name_prof_hr1, name_prof_hr2,'f');
        data_hr2 = ncload_struct(name_prof_hr2);
        data_fr1 = ncload_struct(name_prof_fr1);
        I = round(interp1(data_fr1.JULD,1:length(data_fr1.JULD),data_hr2.JULD));
        J = find(~isnan(I));
        
        list_var1={'JULD','JULD_LOCATION','LATITUDE','LATITUDE'};
        for jj=1:length(list_var1),
            aux  = getfield(data_hr2,list_var1{jj});
            aux1 = getfield(data_fr1,list_var1{jj});
            aux(J) = aux1(I(J));
            ncwrite(name_prof_hr2,list_var1{jj},aux);
        end
        
        list_var2={'PRES','PRES_QC','PRES_ADJUSTED','PRES_ADJUSTED_ERROR',...
            'TEMP','TEMP_QC','TEMP_ADJUSTED','TEMP_ADJUSTED_ERROR',...
            'PSAL','PSAL_QC','PSAL_ADJUSTED','PSAL_ADJUSTED_ERROR'};
        for jj=1:length(list_var2),
            aux  = getfield(data_hr2,list_var2{jj});
            aux1 = getfield(data_fr1,list_var2{jj});
            aux(:,J) = aux1(:,I(J));
            ncwrite(name_prof_hr2,list_var2{jj},aux);
        end
        
        list_var3={'PARAMETER','SCIENTIFIC_CALIB_EQUATION','SCIENTIFIC_CALIB_COEFFICIENT'};
        for jj=1:length(list_var3),
            aux  = getfield(data_hr2,list_var3{jj});
            aux1 = getfield(data_fr1,list_var3{jj});
            aux(:,1:3,:,J) = aux1(:,1:3,:,I(J));
            ncwrite(name_prof_hr2,list_var3{jj},aux);
        end
        
    else
        
        copyfile(name_prof_fr1, name_prof_hr2,'f');
        
    end
    
    
end

