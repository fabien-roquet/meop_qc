%% script initializing the analysis of a SRDL-CTD comparison
% Fabien 26/08/2011
%
% - create folders
% - copy data
% - create a script template


EXP='cal201711_boussole188_JB';
rootdir='D:\MEOP\CALIBRATION\ship_calibration\';
expdir=[rootdir EXP];
scriptdir=[rootdir 'calibration_matlab_scripts\'];

mkdir(expdir);
cd(expdir);

mkdir('raw_data');
mkdir('seal_dataset');
mkdir('calibration_plots');

if ~exist('sc_calibration.m','file'),
    copyfile([scriptdir 'sc_calibration_template.m'],...
        ['sc_calibration_' EXP '.m']);
end

% copy ctd and srdl data in raw_data

save environment EXP expdir scriptdir 
