% script to process new deployments
cd('/home/froqu/GitHub/meop_qc/matlab_toolbox')

list_file = 'list_deployments_updated_20200108_180129.txt';
list_file_done = 'list_deployments_updated_20200108_180129_DONE.txt';

count=0;
lEXP = textread(list_file,'%s');
for kk = 1:length(lEXP),
    EXP = lEXP{kk};
    lEXP_done = {};
    if exist(list_file_done,'file')
        lEXP_done = textread(list_file_done,'%s');
    end
    if ismember(EXP,lEXP_done),
        disp([EXP ' already done: skipped']);
        continue
    end
    disp(EXP)
    try
        process_single_deployment(EXP);
        fid2 = fopen(list_file_done,'a');
        data = fprintf(fid2, '%s\n', EXP);
        fclose(fid2);
    catch exception
        msgText = getReport(exception,'extended','hyperlinks','off');
        fprintf(1,'%s',msgText);
        count = count+1;
    end

end

if count == 0
    mirounga_diags('global_diagnostics');
    mirounga_diags('update_public_CTD');
end

