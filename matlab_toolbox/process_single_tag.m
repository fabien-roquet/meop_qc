function process_single_tag(one_smru_name)
% run all the procedure for one tag only

conf = init_mirounga;

I = strfind(one_smru_name,'-');
EXP = one_smru_name(1:I(1)-1);
info_deployment=load_info_deployment(conf,EXP,one_smru_name);

create_ncargo(conf,EXP,one_smru_name);
create_fr0(conf,EXP,one_smru_name);
update_metadata(conf,EXP,one_smru_name);
apply_adjustments(conf,EXP,one_smru_name);
apply_tlc(conf,EXP,one_smru_name);
apply_tlc_fr(conf,EXP,one_smru_name);
create_hr2(conf,EXP,one_smru_name);
generate_odv4(conf,EXP,one_smru_name);

generate_plot1(conf,EXP,one_smru_name);
generate_plot2(conf,EXP,one_smru_name);
