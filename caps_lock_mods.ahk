#Requires AutoHotkey v2.0+
#SingleInstance Force

; Map CapsLock to Ctrl when held (for non-numbers), Esc when tapped, and Window Switcher for 1 & 2
*CapsLock:: {
    CapsDownTime := A_TickCount
    ctrlSent := false

    ; Keep looping for as long as the CapsLock key is physically held down
    while GetKeyState("CapsLock", "P") {
        ; Start a new input hook to catch the next keypress
        ih := InputHook("L1 I1") ; L1 = 1 key max, I1 = Ignore artificial inputs
        ih.Start()

        ; Wait for a key to be pressed OR for CapsLock to be released
        while GetKeyState("CapsLock", "P") && (ih.Input == "") {
            Sleep 10
        }
        ih.Stop()

        ; If a key was pressed while CapsLock was held down
        if (ih.Input != "") {
            targetKey := ih.Input

            ; INTERCEPT NUMBERS: Trigger the window focus logic and bypass Ctrl
            if (targetKey == "1") {
                HandleAppFocus("ahk_exe chrome.exe")
            }
            else if (targetKey == "2") {
                HandleAppFocus("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
            }
            else if (targetKey == "3") {
                HandleAppFocus("ahk_exe Devin.exe")
            }
            else if (targetKey == "4") {
                HandleAppFocus("ahk_exe Obsidian.exe")
            }
            else if (targetKey == "5") {
                HandleAppFocus("ahk_exe ms-teams.exe")
            }
            else if (targetKey == "6") {
	        ; Microsoft Outlook
                HandleAppFocus("ahk_exe olk.exe")
            }
            ; HANDLE ALL OTHER SHORTCUTS: Force Ctrl down dynamically for letters/symbols
            else {
                ctrlSent := true
                Send "{Blind}{LCtrl down}"
                Send "{Blind}{" targetKey "}"
                ; We keep Ctrl down in case they are holding multiple letter keys
            }
        }
    }

    ; Clean up the Ctrl state if it was activated during the hold
    if (ctrlSent) {
        Send "{Blind}{LCtrl up}"
    }

    ; ESCAPE KEY LOGIC: Only send Escape if absolutely no other keys were pressed
    if (A_PriorKey = "CapsLock") {
        if (A_TickCount - CapsDownTime < 250) {
            Send "{Esc}"
        }
    }
}

; --- CORE FOCUS ENGINE ---
HandleAppFocus(targetWindow) {
    if WinActive(targetWindow) {
        return
    }
    if WinExist(targetWindow) {
        windowState := WinGetMinMax(targetWindow)
        if (windowState == -1) {
            WinRestore(targetWindow)
        }
        WinActivate(targetWindow)
    }
}

; --- TOGGLE CAPSLOCK UTILITY ---
ToggleCaps() {
    SetStoreCapsLockMode false
    Send "{CapsLock}"
    SetStoreCapsLockMode true
}

LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()
