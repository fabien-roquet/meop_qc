% build a latex file recapitulating general information for each deployments
% sort deployments by NATION
Itag_all=tags_processed(conf);
[aux,Jtag]=sort({conf.start_date{Itag_all}});
Itag_1=Itag_all(Jtag);
[name_NATION,Ktag]=sort({conf.list_ficseals{Itag_1,5}});
Itag_sort=Itag_1(Ktag);
list_NATION=unique(name_NATION);

%%
if exist([conf.mapsdir 'global/map_global.png'],'file') & exist([conf.mapsdir 'global/map_SH.png'],'file')
    
    nfic=sprintf('%stex/seal_general.tex',conf.temporary);
    
    fid=fopen(nfic,'w');
    fprintf(fid,...
        ['\\documentclass[10pt]{article}\n' ...
        '\\usepackage{graphicx}\n' ...
        '\\usepackage[top=2cm, bottom=1.5cm, left=1cm, right=1cm]{geometry}\n\n' ...
        '\\begin{document}\n\n']);
    %
    fprintf(fid,...
        ['\\begin{figure}[htb!]\n', ...
        '\\begin{centering}\n', ...
        '\\includegraphics[width=12cm,angle=0]{' conf.mapsdir 'global/map_global.png}\n', ...
        '\\par\\end{centering}\n', ...
        '\\end{figure}\n', ...
        '\\begin{figure}[htb!]\n', ...
        '\\begin{centering}\n', ...
        '\\includegraphics[width=14cm,angle=0]{' conf.mapsdir 'global/map_SH.png}\n', ...
        '\\par\\end{centering}\n', ...
        '\\end{figure}\n\n', ...
        '\\clearpage\n\n' ]);
    
    
    for kk=Itag_sort,
        
        str=conf.lfic{kk};
        if exist([conf.plotdir str '_recapARGO_cal.png'],'file') & exist([conf.plotdir str '_histoARGO_cal.png'],'file')
            fprintf(fid,...
                ['\\begin{figure}[htb!]\n', ...
                '\\begin{centering}\n', ...
                '\\includegraphics[width=14cm,angle=0]{' conf.plotdir str '_recapARGO_cal.png}\n', ...
                '\\par\\end{centering}\n', ...
                '\\end{figure}\n', ...
                '\\begin{figure}[htb!]\n', ...
                '\\begin{centering}\n', ...
                '\\includegraphics[width=14cm,angle=0]{' conf.plotdir str '_histoARGO_cal.png}\n', ...
                '\\par\\end{centering}\n', ...
                '\\end{figure}\n\n', ...
                '\\clearpage\n\n' ]);
        else
            disp([str ' not included in seal_general: recap/histo figures not found'])
        end
        
    end
    
    
    fprintf(fid,'\\end{document}\n\n');    
    fclose(fid);
    
    [T,cmdout]=system(sprintf('%s -interaction nonstopmode %s',conf.pdflatex,nfic));
    delete('seal_general.aux');
    delete('seal_general.log');
    
else
    disp(['seal_general.pdf not generated: map figures not found'])
end


