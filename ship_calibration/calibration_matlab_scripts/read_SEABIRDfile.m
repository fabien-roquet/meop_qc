%% script extracting P, T and S out of a SEABIRD data file
% to work, need to set:
%   path_in='name_of_directory';
%   files={list_of_file_names};
%   str_format='data_line_format';
%   up (=1 upcast; =0 downcast)
%
% output: ctd(:,1:7)=[numctd P T S up(=1 for upcast)]


% load ctd data
ctd=[];
for kk=1:length(files),
    
    file=sprintf('%s/%s',path_in,files{kk});
    
    fid=fopen(file);
    nheader=1;str='*START*';
    while (~strncmp(str,'*END*',5)), str=fgetl(fid); nheader=nheader+1; end
    fclose(fid);
    
    [P T S]=textread(file,str_format,'headerlines',nheader);
    PTS=sortrows([P T S],1);
    l=length(P);
    ctd=[ctd;kk*ones(l,1) PTS up*ones(l,1)];
    
    fprintf('%s : CTD %d : %d dbar\n',files{kk},kk,max(P));
    
end


