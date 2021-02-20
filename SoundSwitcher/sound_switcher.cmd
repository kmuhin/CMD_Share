@echo off
IF  EXIST "%~dp0\sound_switcher.tmp" (
	"%~dp0\nircmd.exe" setdefaultsounddevice "headphones"
	del "%~dp0\sound_switcher.tmp"
) ELSE (
	"%~dp0\nircmd.exe" setdefaultsounddevice "SAMSUNG"
	echo > "%~dp0\sound_switcher.tmp"
)