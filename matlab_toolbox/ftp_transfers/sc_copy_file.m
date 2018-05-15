[s,mess,messid] = mkdir([conf.public,'MEOP_CTD_',datestr(now(),'mm-dd-yyyy'),'/']);
dossier=[conf.public,'MEOP_CTD_',datestr(now(),'mm-dd-yyyy'),'/'];

for ii=1:length(conf.list_ficseals)
    if conf.list_ficseals{ii,4}==1
        file=[dossier,conf.list_ficseals{ii,5},'/'];
        [s,mess,messid] = mkdir(file);
        mkdir([file,'MAPS']);
        mkdir([file,'ncARGO']);
        mkdir([file,'ODV']);
        mkdir([file,'PDF']);
        PI=conf.list_ficseals{ii,2};
        PI=PI(PI~=' ');
        if exist([conf.datadir,PI,'/',...
                conf.list_ficseals{ii,1},'/'])
            copyfile([conf.datadir,PI,'/',...
                conf.list_ficseals{ii,1},'/'],[file,'ncARGO/'],'f');
        end
        if exist([conf.datadir_ODV,PI,'/',...
                conf.list_ficseals{ii,1},'/'])
            copyfile([conf.datadir_ODV,PI,'/',...
                conf.list_ficseals{ii,1},'/'],[file,'ODV/'],'f');
        end
        if exist([conf.texdir,...
                conf.list_ficseals{ii,1},'_doc_cal.pdf'])
            copyfile([conf.texdir,...
                conf.list_ficseals{ii,1},'_doc_cal.pdf'],[file,'PDF/']);
        end
        if exist([conf.mapsdir,'deployments/',...
                conf.list_ficseals{ii,1},'_mapSH.png'])
            copyfile([conf.mapsdir,'deployments/',...
                conf.list_ficseals{ii,1},'_mapSH.png'],[file,'MAPS/']);
        end
    end
end


copyfile([conf.mapsdir,'global/']...
    ,dossier,'f');
copyfile([conf.maindir,'info_deployments.csv']...
    ,dossier);
copyfile([conf.maindir,'info_groups.csv']...
    ,dossier);
copyfile([conf.maindir,'info_tags.csv']...
    ,dossier);
copyfile([conf.maindir,'info_total.csv']...
    ,dossier);
