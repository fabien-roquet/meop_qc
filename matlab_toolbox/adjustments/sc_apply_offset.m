%% apply offset adjustment on all ncfiles at once


if exist([conf.builddir 'build_fcell_' EXP '.m'],'file'),
    if ~exist('calib_coeff','var'), calib_coeff=[]; end
    try; eval(['build_fcell_' EXP ';']); catch; error([EXP ': error in the build']); end
end
list_tag = info_deployment.list_tag;

for kk=1:length(info_deployment.list_tag),
    
    name = sprintf('%s%s',info_deployment.dir,info_deployment.list_tag(kk).name);
    
    name_prof= strrep(name, '_lr0', '_lr0' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end
    
    name_prof= strrep(name, '_lr0', '_lr1' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end

    name_prof= strrep(name, '_lr0', '_hr0' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end

    name_prof= strrep(name, '_lr0', '_hr1' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end

    name_prof= strrep(name, '_lr0', '_fr0' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end

    name_prof= strrep(name, '_lr0', '_fr1' );
    if exist(name_prof,'file'), sc_correct_offset_qc; end

end



