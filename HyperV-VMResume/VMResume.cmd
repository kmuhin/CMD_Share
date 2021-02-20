@echo off
rem event
rem 18510 - save machine
rem 18596 - restore machine

if "%3%" == "" (
	echo expect 3 parameters: host vmname status
	exit 1
)

setlocal
set filelog="%~dp0LOG\%~n0.%COMPUTERNAME%.%DATE%-%TIME::=%-%2%.log"

if "%STDOUT_REDIRECTED%" == "" (
  set STDOUT_REDIRECTED=yes
  cmd.exe /c "%0" %* >> %filelog% 2>&1
  exit /b %ERRORLEVEL%
)

echo %DATE% %TIME% START

echo %0 %*
rem powershell -File "%~dpn0.ps1" %* 2>&1 >> %filelog% 
if "%3%" == "18596" (
	cd "%~dp0\SCRIPTS\"
	cmd.exe /c %2%.cmd
rem	echo y | PLINK.EXE -T -i "ntpflush.ppk" root@%172.16.131.58%
)
echo %DATE% %TIME% END

cd "%~dp0\LOG\"
forfiles /M "*.log" /D -120 /C "cmd /c del @file" 2>nul
