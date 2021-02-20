@echo off
rem Copies addons of game World of Warcraft from foreign PC to mine.
rem Uses NetBIOS.

rem set of params
set cshare=192.168.0.2\AddOns
set cuser=user
set cpwd=password
set wowdir=C:\World of Warcraft\_classic_\Interface\AddOns

rem try to connect to network share
echo "Y" | net use Y: /DELETE
net use Y: \\%cshare% %cpwd% /USER:%cuser%

rem if fail goto end and exit
if  {%errorlevel%} NEQ {0} (
 echo network resource is not available: %ERRORLEVEL%
 goto end
)

rem if last result was successful continue connecting
echo network resource is connected to Y:\
rem remove old files
rmdir /Q /S "%wowdir%\"
rem copy new files
robocopy -ndl -nfl -e \\%cshare% "%wowdir%"

:end
pause