#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetCapsLockState, AlwaysOff
+CapsLock::CapsLock

CapsLock::Send, {Ctrl down}{Shift down}{Shift up}{Ctrl up}{Ctrl up}
return

; win+n, run notepad and type current datetime
#n::
Run, notepad.exe
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
Send, %A_DD%.%A_MM%.%A_YYYY% %A_Hour%:%A_Min%{enter}
return

; win+d, type current date
#d::
Send, %A_DD%.%A_MM%.%A_YYYY% 
return

; win+t, type current time
#t::
Send, %A_Hour%:%A_Min%
return
