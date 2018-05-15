%% create an empty table of correction coefficients

EXP = info_deployment.EXP;
list_tag = info_deployment.list_tag;

if ~exist('calib_coeff','var'), calib_coeff=[]; end
minT=-3; maxT=32; minS= 4; maxS=40; min_Nprof= 30;

if ~exist([conf.builddir 'build_fcell_' EXP '.m'],'file'),
    str={['%% ' EXP],'','%% remove tags','','%% apply corrections',...
        'list_tag = dir([info_deployment.dir,''*_prof.nc'']);',...
        'sc_init_corrections;','',...
        ['calib_coeff.' EXP ' = [']};
    for kk=1:length(list_tag),
        str{end+1}=sprintf('\t%d\t%3.2f\t%3.2f\t%3.2f\t%3.2f',kk,0*1e3,0,0*1e3,0);
    end
    str = { str{:} , sprintf('\t];') , '' , 'temp_error=0.1;' , 'psal_error=0.2;' };
    str = { str{:} , '' , 'minT=-3;' , 'maxT=32;' };
    str = { str{:} , '' , 'minS= 4;' , 'maxS=40;' };
    str = { str{:} , '' , 'min_Nprof= 30;' };
    fid = fopen([conf.builddir 'build_fcell_' EXP '.m'],'w');
    for kk=1:length(str), fprintf(fid,'%s\n',str{kk}); end
    fclose(fid);
else
    % check that calib_coeff has the right dimension. If not, re-initialize build_fcell only if calib_coeff has only zeros
    eval(['build_fcell_' EXP ';']);
    t = getfield(calib_coeff,EXP);
    if length(list_tag)~=size(t,1),
        disp([EXP ': calib_coeff size mismatch with number of tags']);
        if all(all(t(:,2:5)==0))
            disp([EXP ': re-initialize ' 'build_fcell_' EXP]);
            str={['%% ' EXP],'','%% remove tags','','%% apply corrections',...
                'list_tag = dir([info_deployment.dir,''*_prof.nc'']);',...
                'sc_init_corrections;','',...
                ['calib_coeff.' EXP ' = [']};
            for kk=1:length(list_tag),
                str{end+1}=sprintf('\t%d\t%3.2f\t%3.2f\t%3.2f\t%3.2f',kk,0*1e3,0,0*1e3,0);
            end
            str = { str{:} , sprintf('\t];') , '' , 'temp_error=0.1;' , 'psal_error=0.2;' };
            str = { str{:} , '' , 'minT=-3;' , 'maxT=32;' };
            str = { str{:} , '' , 'minS= 4;' , 'maxS=40;' };
            str = { str{:} , '' , 'min_Nprof= 30;' };
            fid = fopen([conf.builddir 'build_fcell_' EXP '.m'],'w');
            for kk=1:length(str), fprintf(fid,'%s\n',str{kk}); end
            fclose(fid);
        else
            disp([EXP ': check manually build_fcell_' EXP]);
        end
    end
end

rehash path
eval(['build_fcell_' EXP ';']);


