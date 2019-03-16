% configsys: set base folders 

config = 'fabien';  

switch config,
    case 'fabien',
        conf.maindir = '/Users/roquet/Dropbox/MEOP/MEOP-CTD/';
        conf.matlabdir = '/Users/roquet/Documents/GitHub/meop_qc/matlab_toolbox/';
        conf.inputdir= '/Users/roquet/Dropbox/MEOP/SMUG_INPUT/all/';
        conf.woddir  = '/Users/roquet/Dropbox/MEOP/DATA/WOD_data/WOD_matlab_nc/';
        conf.public  = '/Users/roquet/Dropbox/MEOP/public/';
        conf.pdflatex= '/Library/TeX/texbin/pdflatex';
    case 'baptistelinux',
        conf.maindir = '/media/ubuntu/SPPHD/MEOP/MEOP-CTD/';
        conf.matlabdir = [conf.maindir 'matlab_toolbox/'];
        conf.inputdir= '/media/ubuntu/SPPHD/MEOP/SMUG_INPUT/all/';
        conf.woddir  = '/media/ubuntu/SPPHD/MEOP/WOD_data/';
        conf.public  = '/media/ubuntu/SPPHD/MEOP/public/';
        conf.pdflatex= 'pdflatex';
    case 'baptistewindow',
        conf.maindir = 'D:\MEOP\MEOP-CTD\';
        conf.matlabdir = [conf.maindir 'matlab_toolbox\'];
        conf.inputdir= 'D:\MEOP\SMUG_INPUT\all\';
        conf.woddir  = 'L:\MEOP\DATA\WOD_data\';
        conf.public  = 'D:\MEOP\public\';
        conf.pdflatex= 'pdflatex';
    otherwise
        if exist ('config','var')
            error(sprintf('"%s" is not a valid configsys entry to initialize the system\nModify configsys.m or set the variable config to a valid value',config));
        else
            error(sprintf('Modify configsys.m to add your system or set the variable config to a valid entry value',config));
        end
end
