@echo off

setlocal
Setlocal EnableDelayedExpansion
chcp 1251>nul
set zworkdir=%~dp0
set SERVERLIST=servers.txt

set DST_DIR=%zworkdir%\logs
set PSCP="PSCP.EXE"

set DAY=%DATE:~0,2%
set MONTH=%DATE:~3,2%
set YEAR=%DATE:~-4%
set HOURS=%TIME:~0,2%
set MINUTES=%TIME:~3,2%
set SECONDS=%TIME:~6,2%

pushd %zworkdir% 

if not exist "%PSCP%" (
	echo no file: %PSCP%
	exit 1
)
for /f "usebackq eol=# delims=; tokens=1-4" %%i in ("%SERVERLIST%") do (
 echo server: %%i >&2
 if not exist "%DST_DIR%\%%i" (
        mkdir "%DST_DIR%\%%i"
 )
 if not exist "%DST_DIR%\%%i" (
	echo cant create dir %DST_DIR%\%%i
	exit 1
 )
 if "%%k"==""  (
	set username=admin
 ) else (
	set username=%%k
 )
 set password=%%l
 set server=%%j
 @echo on
 mkdir "%DST_DIR%\%%i\%YEAR%%MONTH%%DAY%"
 "%PSCP%" -r -pw "!password!" !username!@!server!:log "%DST_DIR%\%%i\%YEAR%%MONTH%%DAY%"

)
chcp 866>nul