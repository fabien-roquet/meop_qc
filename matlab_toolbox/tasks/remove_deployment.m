function remove_deployment(conf,EXP,one_smru_name)


if isempty(conf),
    conf = init_mirounga;
end

if ~exist('one_smru_name','var') % all tags from EXP deployment
    one_smru_name = '';
elseif isempty(EXP),
    EXP=EXP_from_smru_name(one_smru_name);
end



% don't process it if no raw odv file
info_deployment=load_info_deployment(conf,EXP,one_smru_name);
if ~exist([conf.rawdir info_deployment.nomfic]),
    error(sprintf('%s: no raw file. not processed.',EXP));
end

delete([conf.plotdir EXP '/*.png'])
delete([conf.calibplotdir EXP '/*.png'])
delete([info_deployment.dir '*.nc'])
delete([info_deployment.dir '/*.txt'])
delete([info_deployment.dir '/*.json'])

