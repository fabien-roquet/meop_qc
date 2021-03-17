%Script to produce *.mat and *.dat files containing 
%exported Matlab table of sample data extracted from 
%the CTD table in the SMRU IG Oracle database
%
%Clint Blight 
%2019-10-04
%
%set up a connection to the SMRU IG database 
%db_user = 'XXXX';
%db_password = 'YYYY';
db_driver = 'oracle.jdbc.driver.OracleDriver';
db_url = 'jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = l-smru-db.st-andrews.ac.uk)(PORT = 1521))(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = PLSMRU)))';
db_conn = database('',db_user,db_password, db_driver, db_url);

%perform a query to get the GREF, NAME and YEAR from REALSEAL
%and the basic columns from the CTD table for casts:
%
%   - from the last seven days 
%   - from tags which are currently deployed according info in REALSEAL table
%   - part of a deployment marked in WEBPAGES as to go out on the GTS 
%
%if more columns required could switch over to SELECT CTD.* or  SELECT *

%just in case explicitly set Oracle session to UTC
execute(db_conn,"ALTER SESSION SET TIME_ZONE='UTC'")

%same for the formating
execute(db_conn,"ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD""T""HH24:MI:SS""Z""'")

%define select query
select_recent_ctd_query = "SELECT RS.GREF,RS.NAME,RS.YEAR,CTD.PTT,CTD.END_DATE,CTD.MAX_DBAR,CTD.LAT,CTD.LON,CTD.N_TEMP,CTD.TEMP_DBAR,CTD.TEMP_VALS,CTD.N_SAL,CTD.SAL_DBAR,CTD.SAL_VALS,CTD.QC_TEMP,CTD.QC_SAL FROM (SELECT * FROM BM8.CTD WHERE (END_DATE BETWEEN SYSDATE -7 AND SYSDATE+1)) CTD INNER JOIN BM8.REALSEAL RS ON ( CTD.PTT= RS.PTT AND (CTD.END_DATE BETWEEN RS.ON_DATE AND NVL(RS.OFF_DATE,SYSDATE+1))) WHERE (SELECT GTS FROM BM8.WEBPAGES WP WHERE WP.GREF = RS.GREF)= 'Y' ORDER BY END_DATE DESC";

%get the data from Oracle
recent_ctd_table = select(db_conn,select_recent_ctd_query);

%save the new table in a *.mat file
dt_now=datetime('now','TimeZone','UTC');
dt_now.Format='yyyyMMddHHmmss';
output_filename = strcat('Recent_CTD_Casts_',char(dt_now));

save(strcat(output_filename,'.mat'),'-mat','-v7.3','recent_ctd_table');

writetable(recent_ctd_table,strcat(output_filename,'.dat'),'Delimiter','tab','Encoding','UTF-8');
%output sample rows
recent_ctd_table(1:3,:);

close(db_conn);


%Tests
%
%Option 1: read in the *.mat version
test_ctd_table=importdata(strcat(output_filename,'.mat'),'recent_ctd_table');
%change END_DATE from strings to datetimes
test_ctd_table.END_DATE=datetime(test_ctd_table.END_DATE,'Format','uuuu-MM-dd HH:mm:ss.SSS');

%Option 2: read in the tab-separated values in the *.dat textfile
%END_DATE automatically read into datetime column
test_ctd_table=readtable(strcat(output_filename,'.dat'),'Delimiter','tab','Encoding','UTF-8');

%test making ragged array style columns from those holding multiple values 
%within CSV string  
colnames_to_split = {'TEMP_DBAR','TEMP_VALS','SAL_DBAR','SAL_VALS','QC_TEMP','QC_SAL'};
for colname_ind = 1:length(colnames_to_split)
    this_colname = colnames_to_split{colname_ind};
    these_split_vals =cellfun(@str2double, regexp(test_ctd_table{:,this_colname}, ',', 'split'), 'UniformOutput', false);
    test_ctd_table = addvars(test_ctd_table,these_split_vals,'NewVariableNames',strcat(this_colname,'_DBLS'));
end

%try to plot out the first few temperature profiles
%for cast_row_ind = 1:height(test_ctd_table)
for cast_row_ind = 1:4
   plot( cell2mat(test_ctd_table{cast_row_ind,'TEMP_VALS_DBLS'}),cell2mat(test_ctd_table{cast_row_ind,'TEMP_DBAR_DBLS'}));
   set(gca, 'YDir','reverse');
   titlestring=strcat( ...
     test_ctd_table{cast_row_ind,'GREF'},'\_', ...
     test_ctd_table{cast_row_ind,'NAME'},'\_', ...
     extractAfter(num2str(test_ctd_table{cast_row_ind,'YEAR'}),2),'\_', ...
     datestr(test_ctd_table{cast_row_ind,'END_DATE'},31));   
   title(titlestring);   
   pause(1);
end

