function name_prof = gen_name_prof(smru_prefix,Nsplit,suffix,namedir)


    if ~exist('name_dir','var')
        name_dir='';
    end
    
    if length(Nsplit) & ~strcmp(Nsplit(1),'-')
        Nsplit=['-' Nsplit];
    end
    
    name_prof = sprintf('%s%s%s_%s_prof.nc',namedir,smru_prefix,Nsplit,suffix);
    
