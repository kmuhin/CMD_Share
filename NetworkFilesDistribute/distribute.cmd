@echo off

Setlocal EnableDelayedExpansion

set servers="%~dpn0.servers"
set TASKSFILE="%~dpn0.txt"
# remote path of dir to files
set path_scripts=C$\scripts\ps_SecMgmt

echo %TASKSFILE%
echo %servers%

cd "%~dp0"

FOR /F "usebackq" %%i in (%servers%) do (
	echo %%i
	FOR /F "usebackq tokens=*" %%j in (%TASKSFILE%) do (
		set task=%%j
		echo !task!
rem if file name in list has prefix "-" file  will be deleted
		if "!task:~0,1!" == "-" (
			set task=!task:~1!
			del "\\%%i.domain.local\%path_scripts%\!task!"
		) else (
			copy "!task!" "\\%%i.domain.local\%path_scripts%"
			
		)
	)
)
