function process_single_tag(smru_name)
% run all the procedure for one tag only

I = strfind(smru_name,'-');
EXP = smru_name(1:I(1)-1);

init_mirounga;
info_deployment=load_info_deployment(conf,EXP,smru_name);

for ktask = 1:length(conf.list_tasks),
    
    task = conf.list_tasks{ktask};
    fprintf('(%d) %s on %s\n',ktask,task,smru_name);
    feval(task,conf,EXP,smru_name);
    
end

generate_plot1(conf,EXP,smru_name);
