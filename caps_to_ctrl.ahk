#Requires AutoHotkey v2.0+
#SingleInstance Force

; Map CapsLock to Ctrl when held, Esc when tapped
; Press both shift keys together to toggle CapsLock

*CapsLock:: {
    ; Send Ctrl down
    Send "{Blind}{LCtrl down}"
    CapsDownTime := A_TickCount

    KeyWait "CapsLock"

    ; Send Ctrl up
    Send "{Blind}{LCtrl up}"

    if (A_PriorKey = "CapsLock") {
        if (A_TickCount - CapsDownTime < 250) {
	    Send "{Esc}"
	}
    }
}

ToggleCaps() {
    ; Prevent AHK from forcing CapsLock off
    SetStoreCapsLockMode false
    Send "{CapsLock}"
    SetStoreCapsLockMode true
}

LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()
