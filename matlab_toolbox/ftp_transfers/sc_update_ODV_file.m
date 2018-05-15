%% update ODV zip files that contains raw CTDFO data
% download from SMRU ftp site
%  download only if the version on the ftp server is more recent
%  if successfully updated, conf.input_data_updated set to 1


list_input=struct2table(dir(conf.inputdir));
list_rawdir=struct2table(dir(conf.rawdir ));

for ii=1:length(list_deployment{1,1})
    
    I=find(strcmp([list_deployment{1,1}{ii} '_ODV.txt'],list_rawdir{:,1})==1);
    J=find(strcmp(list_deployment{1,1}{ii},list_input{:,1})==1);
    ODV=table();
    if length(J)>0
        ODV=struct2table(dir([conf.inputdir list_input.name{J} '/' list_input.name{J} '_ODV.zip']));
    end
    if length(I)>0 & height(ODV)>0
        if list_rawdir.datenum(I)<=ODV.datenum
            delete([conf.rawdir list_rawdir.name{I}]);
            unzip([conf.inputdir list_input.name{J} '/' list_input.name{J} '_ODV.zip'],conf.rawdir);
        end
    elseif length(I)==0 & height(ODV)>0
        unzip([conf.inputdir list_input.name{J} '/' list_input.name{J} '_ODV.zip'],conf.rawdir);
    end
    
end


