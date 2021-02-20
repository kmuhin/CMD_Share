# On Windows 10 how to make CapsLock as a language switch
Required program
[AutoHotkey](https://www.autohotkey.com/)

https://superuser.com/questions/429930/using-capslock-to-switch-the-keyboard-language-layout

CapsLockSwitchLanguage.ahk - script for AutoHotkey.

    SetCapsLockState, AlwaysOff
    +CapsLock::CapsLock
    CapsLock::Send, {Ctrl down}{Shift down}{Shift up}{Ctrl up}{Ctrl up}
    return

## How to use
Install [AutoHotkey](https://www.autohotkey.com/)

Run the script manually or add the script to startup:
    
    Find the script file, select it, and press Control+C.
    Press Win+R to open the Run dialog, then enter **shell:startup** and click OK or Enter. This will open the Startup folder for the current user. To instead open the folder for all users, enter **shell:common** startup (however, in that case you must be an administrator to proceed).
    Right click inside the window, and click "Paste Shortcut". The shortcut to the script should now be in the Startup folder.

