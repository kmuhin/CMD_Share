﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetCapsLockState, AlwaysOff

+CapsLock::CapsLock


CapsLock::Send, {Ctrl down}{Shift down}{Shift up}{Ctrl up}


; win+n, run notepad and type current datetime
#n::
Run, notepad.exe
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
Send, %A_DD%.%A_MM%.%A_YYYY% %A_Hour%:%A_Min%{enter}
Send, %A_YYYY%-%A_MM%-%A_DD%T%A_Hour%%A_Min%{enter}
return

; on russian keyboard type '#' instead '№'
*+3::Send, {#}

; ctrl+shift to type type '№'
^+3::Send, №

; in PyCharm program print float numbers with period, not comma on numpad
#IfWinActive ahk_exe pycharm64.exe
NumpadDot::Send .
#IfWinActive

*#c::Run Calc.exe  ; Win+C, Shift+Win+C, Ctrl+Win+C, etc. will all trigger this hotkey.

^!f::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Far Manager 3 x64\Far Manager 3 x64.lnk"

