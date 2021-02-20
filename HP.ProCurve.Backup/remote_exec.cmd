@echo off

setlocal
Setlocal EnableDelayedExpansion
chcp 1251>nul
set zworkdir=%~dp0
set SERVERLIST=%zworkdir%\servers.txt
set DST_DIR=%zworkdir%\files
set USB_DIR=%zworkdir%\USBProvisioning
set PSCP="PSCP.EXE"

rem datetime operations depend on windows regional settings
rem this works with russian locale
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
 "%PSCP%" -pw "!password!" !username!@!server!:cfg/running-config "%DST_DIR%\%%i\running-config.pcc"
 "%PSCP%" -pw "!password!" !username!@!server!:cfg/startup-config "%DST_DIR%\%%i\startup-config.pcc"
 fc "%DST_DIR%\%%i\running-config.pcc" "%DST_DIR%\%%i\startup-config.pcc" > "%DST_DIR%\%%i\startup-config-%YEAR%%MONTH%%DAY%.diff" || echo "WARNING.Running configuration has been changed and needs to be saved."
 copy "%DST_DIR%\%%i\running-config.pcc" "%DST_DIR%\%%i\%%i-HP3800-running-config-%YEAR%%MONTH%%DAY%.pcc"
 copy "%DST_DIR%\%%i\startup-config.pcc" "%DST_DIR%\%%i\%%i-HP3800-startup-config-%YEAR%%MONTH%%DAY%.pcc"
rem usb provisioning
 mkdir "%USB_DIR%\%%i"
 copy "3800_pushconfig.cmd.xml" "%USB_DIR%\%%i\"
 copy "%DST_DIR%\%%i\startup-config.pcc" "%USB_DIR%\%%i\"

)
chcp 866>nul