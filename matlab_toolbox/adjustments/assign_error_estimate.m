function assign_error_estimate(name_prof,name_lr0,temp_error,psal_error)
% error taken from file table_param.csv
% error is multiplied by for low resolution profiles

TEMP_QC = ncread(name_lr0,'TEMP_QC');
PSAL_QC = ncread(name_lr0,'PSAL_QC');
if TEMP_QC,
    nT=nansum(double(TEMP_QC<=1));
    nS=nansum(double(PSAL_QC<=1));
else
    return
end

% set first guess of observational error
error = ncload_struct(name_prof,'TEMP_ADJUSTED_ERROR','PSAL_ADJUSTED_ERROR');

error.TEMP_ADJUSTED_ERROR(:)=temp_error;
J = find(nT<10);
if length(J), 
    error.TEMP_ADJUSTED_ERROR(:,J)=temp_error*2; 
end
error.TEMP_ADJUSTED_ERROR(TEMP_QC==9)=NaN;

error.PSAL_ADJUSTED_ERROR(:)=psal_error;
J = find(nS<10);
if length(J), 
    error.PSAL_ADJUSTED_ERROR(:,J)=psal_error*2; 
end
error.PSAL_ADJUSTED_ERROR(PSAL_QC==9)=NaN;

ncwrite(name_prof,'TEMP_ADJUSTED_ERROR',error.TEMP_ADJUSTED_ERROR);
ncwrite(name_prof,'PSAL_ADJUSTED_ERROR',error.PSAL_ADJUSTED_ERROR);


