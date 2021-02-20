@echo off

setlocal
rem script directory 
set zworkdir=%~dp0
rem file with list of servers  and their ssh keys
set SERVERLIST=%zworkdir%\servers.txt
rem file with default command
set COMMAND=%~dpn0.command
rem ssh console program
set PSCP="%zworkdir%\putty\PLINK.EXE"
rem go to script directory
pushd %zworkdir% 

rem datetime operations depend on windows regional settings
rem this works with russian locale
set DAY=%DATE:~0,2%
set MONTH=%DATE:~3,2%
set YEAR=%DATE:~-4%

rem file for command output. it is used with the default command, otherwise stdout is used.
set REPORT="%zworkdir%\report.%YEAR%-%MONTH%-%DAY%"

rem processing the server list file
rem
rem eol=# - comment symbol, anything after the character will be treated as a comment
rem
rem "delims=;" - field separator
rem 
rem "tokens=1,2" - this means %%i will capture first field and %%j will capture second one.
rem 
rem expectation: %%i - server addres, %%j - ssh key file

rem launch with command file from argument. command output to sdtout
if "%1" NEQ "" (
	set COMMAND=%1
	for /f "usebackq eol=# delims=; tokens=1,2" %%i in ("%SERVERLIST%") do (
	 echo server: %%i >&2
     	 %PSCP% -t -i "%%j" -ssh -l root -m "%1" %%i
	)
rem launch with default command file from %COMMAND% variable. command output to %REPORT%
) else (
	echo. 2> %REPORT%
	for /f "usebackq eol=# delims=; tokens=1,2" %%i in ("%SERVERLIST%") do (
	 echo server: %%i >&2
	 %PSCP% -t -i "%%j" -ssh -l root -m "%COMMAND%" %%i >> %REPORT%
	)
	start "" notepad %REPORT%
)

