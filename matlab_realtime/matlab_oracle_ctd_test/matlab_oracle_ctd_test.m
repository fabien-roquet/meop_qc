
%Script to produce *.mat file containing
%Matlab Table of sample data from the 
%CTD table in the SMRU IG Oracle database
%
%set up a connection to the SMRU IG database 
db_user = 'PL7';
db_password = 'read_only';
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
execute(db_conn,'ALTER SESSION SET TIME_ZONE=''UTC''')

%same for the formating
execute(db_conn,'ALTER SESSION SET NLS_DATE_FORMAT=''YYYY-MM-DD HH24:MI:SS''')

%define select query
% select_recent_ctd_query = 'SELECT RS.GREF,RS.NAME,RS.YEAR,CTD.PTT,CTD.END_DATE,CTD.MAX_DBAR,CTD.LAT,CTD.LON,CTD.N_TEMP,CTD.TEMP_DBAR,CTD.TEMP_VALS,CTD.N_SAL,CTD.SAL_DBAR,CTD.SAL_VALS,QC_TEMP,QC_SAL FROM (SELECT * FROM BM8.CTD CTD WHERE QC_TEMP IS NULL AND (END_DATE BETWEEN SYSDATE -7 AND SYSDATE+1)) INNER JOIN BM8.REALSEAL RS ON ( CTD.PTT= RS.PTT AND (CTD.END_DATE BETWEEN RS.ON_DATE AND NVL(RS.OFF_DATE,SYSDATE+1))) WHERE (SELECT GTS FROM BM8.WEBPAGES WP WHERE WP.GREF = RS.GREF)= ''Y'' ORDER BY END_DATE DESC';

select_recent_ctd_query = 'SELECT RS.GREF,RS.NAME,RS.YEAR,CTD.SEQ,CTD.PTT,CTD.END_DATE,CTD.MAX_DBAR,CTD.LAT,CTD.LON,CTD.N_TEMP,CTD.TEMP_DBAR,CTD.TEMP_VALS,CTD.N_SAL,CTD.SAL_DBAR,CTD.SAL_VALS,QC_TEMP,QC_SAL,QC_PROFILE'
'FROM BM8.CTD CTD '
' INNER JOIN BM8.REALSEAL RS ON ( CTD.PTT= RS.PTT AND (CTD.END_DATE BETWEEN RS.ON_DATE AND NVL(RS.OFF_DATE,SYSDATE+1)))'
' INNER JOIN BM8.WEBPAGES WP ON (WP.gref = RS.GREF) '
' WHERE WP.GTS = ''Y'''
' AND CTD.QC_PROFILE = 0'
' AND CTD.N_TEMP > 0'
' AND (CTD.END_DATE BETWEEN SYSDATE -7 AND SYSDATE+1)'
' ORDER BY CTD.END_DATE DESC';

%get the data from Oracle
recent_ctd_table = select(db_conn,select_recent_ctd_query);

%save the new table in a *.mat file
dt_now=datetime('now','TimeZone','UTC');
dt_now.Format='yyyyMMddHHmmss';
output_filename = strcat('Recent_CTD_Casts_',char(dt_now),'.mat');

save(output_filename, 'recent_ctd_table');

%output sample rows
recent_ctd_table(1:3,:)

close(db_conn);

