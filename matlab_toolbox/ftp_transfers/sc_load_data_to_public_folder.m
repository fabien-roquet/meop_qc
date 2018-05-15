%% copy final data files in public folder

folder_output = sprintf('%s%s/',conf.public,conf.version);
[s,mess,messid] = mkdir(folder_output);
delete([folder_output '*']);
[status,message] = copyfile('info_*.csv',folder_output,'f');
[status,message] = copyfile('README.txt',folder_output,'f');
[status,message] = copyfile(sprintf('%sglobal/map_*.png',conf.mapsdir),folder_output,'f');

Itag_all=tags_processed(conf);
[aux,Jtag]=sort({conf.start_date{Itag_all}});
Itag_1=Itag_all(Jtag);
[name_NATION,Ktag]=sort({conf.list_ficseals{Itag_1,5}});
Itag_sort=Itag_1(Ktag);
list_NATION=unique(name_NATION);

for  kNATION=1:length(list_NATION),
    NATION = list_NATION{kNATION};
    Itag_sort_group = Itag_sort(strcmp(NATION,name_NATION));
    if sum([conf.list_ficseals{Itag_sort_group,3}])==0, continue; end

    [s,mess,messid] = mkdir([folder_output NATION '/PDF/']);
    [s,mess,messid] = mkdir([folder_output NATION '/MAPS/']);
    [s,mess,messid] = mkdir([folder_output NATION '/DATA_ncARGO/']);
    [s,mess,messid] = mkdir([folder_output NATION '/DATA_ncARGO_interp/']);
    [s,mess,messid] = mkdir([folder_output NATION '/DATA_csv_interp/']);
    [s,mess,messid] = mkdir([folder_output NATION '/METADATA/']);
    [status,message] = copyfile('info_*.csv',[folder_output NATION],'f');
    [status,message] = copyfile('README.txt',[folder_output NATION],'f');
    [status,message] = copyfile(sprintf('%sglobal/map_global_public.png',conf.mapsdir),[folder_output NATION],'f');

    for kk=Itag_sort_group,
        EXP = conf.lfic{kk};
        info_deployment=load_info_deployment(conf,EXP);
        ispublic = logical(info_deployment.ispublic);
        if ispublic
            [status,message] = copyfile( ...
                sprintf('%s%s/%s_lr1_doc_adj.pdf',conf.texdir,NATION,EXP),...
                [folder_output NATION '/PDF/'],'f');
            [status,message] = copyfile( ...
                sprintf('%sdeployments/%s_map*.png',conf.mapsdir,EXP),...
                [folder_output NATION '/MAPS/'],'f');
            
            list_tag = info_deployment.list_tag_lr1;
            Ntag = length(list_tag);
            for jj=1:Ntag,
                ncfile = sprintf('%s%s/%s/%s',conf.datadir,NATION,EXP,list_tag(jj).name);
                ncfile_final = strrep(list_tag(jj).name, '_lr1', '');
                ncfile2 = strrep(ncfile, '_lr1', '_hr1');
                ncfile2_final = strrep(list_tag(jj).name, '_lr1', '_interp');
                odvfile = sprintf('%s%s/%s/%s_ODV.txt',conf.datadir_ODV,NATION,EXP,list_tag(jj).name(1:end-12));
                metafile = sprintf('%s%s/%s/%s_METADATA.txt',conf.datadir_ODV,NATION,EXP,list_tag(jj).name(1:end-12));
                [status,message] = copyfile(ncfile,[folder_output NATION '/DATA_ncARGO/' ncfile_final],'f');
                [status,message] = copyfile(ncfile2,[folder_output NATION '/DATA_ncARGO_interp/' ncfile2_final],'f');
                [status,message] = copyfile(odvfile,[folder_output NATION '/DATA_csv_interp/' ],'f');
                [status,message] = copyfile(metafile,[folder_output NATION '/METADATA/' ],'f');
            end
                        
        end
    end
end


