%% load nc file by ftp on smru server

mw=ftp('smug.st-andrews.ac.uk','fabien','vyLtDZ3bpfSy');

for ktag=Itag,
    EXP=conf.lfic{ktag};
    info_deployment=load_info_deployment(conf,EXP);
    if conf.list_ficseals{ktag,4}==1
        list_tag = dir([info_deployment.dir '*_prof.nc']);
        for ii=:length(list_tag)
            mput(mw,['/results/' info_deployment.PI '/' info_deployment.EXP '/' list_tag(ii).name])
        end
    end
    
end

close(mw);
