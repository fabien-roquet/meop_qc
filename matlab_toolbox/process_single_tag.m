function process_single_tag(one_smru_name)
% run all the procedure for one tag only

I = strfind(one_smru_name,'-');
EXP = one_smru_name(1:I(1)-1);

conf = init_mirounga;
info_deployment=load_info_deployment(conf,EXP,one_smru_name);

for ktask = 1:length(conf.list_tasks),
    
    task = conf.list_tasks{ktask};
    fprintf('(%d) %s on %s\n',ktask,task,one_smru_name);
    feval(task,conf,EXP,one_smru_name);
    
end

generate_plot1(conf,EXP,one_smru_name);
