rem @echo off

setlocal
Setlocal EnableDelayedExpansion
set zworkdir=%~dp0
set filelog=%~n0.error
set SERVERLIST=%~n0.list
set FTPCOMMAND=%~n0.ftp
set PSCP="%zworkdir%\..\..\Program files\putty\PLINK.EXE"
pushd %zworkdir% 

set DAY=%DATE:~0,2%
set MONTH=%DATE:~3,2%
set YEAR=%DATE:~-4%


for /f "usebackq eol=# tokens=1-3" %%i in ("%SERVERLIST%") do (
	 set address=%%i
	 if "%%j"==""  (
	   set us=apc
	 ) else (
	   set us=%%j
	 )
	 if "%%k"==""  (
	   set pw=apc
	 ) else (
	   set pw=%%k
	 )
	 echo !us!> get_logs.auth.ftp
	 echo !pw!>> get_logs.auth.ftp
	 type "%FTPCOMMAND%" >> get_logs.auth.ftp
	 cp get_logs.auth.ftp get_logs.auth.ftp.!address!
	 type get_logs.auth.ftp.!address!
	 echo address: !address! >&2
	 ftp -s:get_logs.auth.ftp.!address! !address!
	 move /Y data.txt UPS\data_%%i_%YEAR%%MONTH%%DAY%.txt
	 move /Y event.txt UPS\event_%%i_%YEAR%%MONTH%%DAY%.txt
	 move /Y config.ini UPS\config_%%i_%YEAR%%MONTH%%DAY%.ini
)