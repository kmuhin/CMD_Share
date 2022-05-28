#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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

*#c:: ; Win+C, Shift+Win+C, Ctrl+Win+C, etc. will all trigger this hotkey.
Run Calc.exe  
WinActivate Calculator
return

^!f::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Far Manager 3 x64\Far Manager 3 x64.lnk"


#IfWinActive ahk_exe EXCEL.EXE
; Excel fill color alt+z, h({vk48}), 1, esc, enter
^PgDn::
Send !z
Sleep 5
Send {vk48}
Sleep 5
Send 1
Sleep 5
Send {Esc}
Sleep 5
Send {Enter}
return
#IfWinActive