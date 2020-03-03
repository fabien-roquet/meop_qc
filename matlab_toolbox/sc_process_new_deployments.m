% script to process new deployments
cd('/home/froqu/GitHub/meop_qc/matlab_toolbox')

list_file = 'list_deployments_updated_20200108_180129.txt';
list_file_done = 'list_deployments_updated_20200108_180129_DONE.txt';

list_forced={};%'ct144','ct148','ct149','ft24','ft22','ct152'};

count=1;%0;
lEXP = readtable(list_file,'Delimiter',',','ReadVariableNames',0);
lEXP = {lEXP{:,1}{:}};
for kk = 1:length(lEXP),
    EXP = lEXP{kk};
    lEXP_done = {};
    if exist(list_file_done,'file')
        lEXP_done = readtable(list_file_done,'Delimiter',',','ReadVariableNames',0);
        lEXP_done = {lEXP_done{:,1}{:}};
    end
    if ismember(EXP,lEXP_done) & ~ismember(EXP, list_forced),
        visualize_tags([],EXP);
        disp([EXP ' already done: skipped']);
        continue
    end
    disp(EXP)
    try
        process_single_deployment(EXP);
        if ~ismember(EXP,lEXP_done)
            fid2 = fopen(list_file_done,'a');
            data = fprintf(fid2, '%s,\n', EXP);
            fclose(fid2);
        end
        count = count+1;
    catch exception
        msgText = getReport(exception,'extended','hyperlinks','off');
        fprintf(1,'%s',msgText);
        count = NaN;
    end

end

if count>0
    mirounga_diags('global_diagnostics');
    mirounga_diags('update_public_CTD');
end

