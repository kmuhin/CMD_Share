@echo off

setlocal
set zworkdir=%~dp0
set filelog=%~n0.error
set SERVERLIST=%~n0.list
pushd %zworkdir% 

set DAY=%DATE:~0,2%
set MONTH=%DATE:~3,2%
set YEAR=%DATE:~-4%

@echo on
for /f "usebackq eol=# " %%i in ("%SERVERLIST%") do (
	 echo server: %%i >&2
	 copy "\\%%i\c$\Program Files\APC\PowerChute\group1\EventLog.txt" agent\%%i_%YEAR%%MONTH%%DAY%.txt
	 copy "\\%%i\c$\Program Files\APC\PowerChute\group1\pcnsconfig.ini" agent\%%i_%YEAR%%MONTH%%DAY%.ini
)