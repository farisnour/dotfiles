#Requires AutoHotkey v2.0+

; macOS-style key remapping for Windows 11

; Rule 1: Alt+Tab passthrough
; Fix this later: Alt+Shift+Tab exits as soon as shift is lifted
LAlt & Tab:: AltTab
Shift & Tab:: ShiftAltTab


; Rule 2: Cursor navigation for text editing

; -- Make Alt-arrow similar to Mac ⌘-arrows
LAlt & Left:: {
    if GetKeyState("Shift", "P")
        Send "{Shift down}{Home}{Shift up}"
    else
        Send "{Home}"
}

LAlt & Right:: {
    if GetKeyState("Shift", "P")
        Send "{Shift down}{End}{Shift up}"
    else
        Send "{End}"
}

; -- Make Win-arrow similar to Mac Option-arrows
; Fix: Holding down Win then holding left arrow triggers Win-left Windows shortcut
#Left::Send "{Ctrl down}{Left}{Ctrl up}"
#+Left::Send "{Ctrl down}{Shift down}{Left}{Shift up}{Ctrl up}"
#Right::Send "{Ctrl down}{Right}{Ctrl up}"
#+Right::Send "{Ctrl down}{Shift down}{Right}{Shift up}{Ctrl up}"


; Rule 3: Remap Alt to Ctrl for all key combinations

MapAltToCtrl(x) {
    if GetKeyState("Shift", "P")
        Send "{Ctrl down}{Shift down}" x "{Shift up}{Ctrl up}"
    else
        Send "{Ctrl down}" x "{Ctrl up}"
}

LAlt & a::MapAltToCtrl("a")
LAlt & b::MapAltToCtrl("b")
LAlt & c::MapAltToCtrl("c")
LAlt & d::MapAltToCtrl("d")
LAlt & e::MapAltToCtrl("e")
LAlt & f::MapAltToCtrl("f")
LAlt & g::MapAltToCtrl("g")
LAlt & h::MapAltToCtrl("h")
LAlt & i::MapAltToCtrl("i")
LAlt & j::MapAltToCtrl("j")
LAlt & k::MapAltToCtrl("k")
LAlt & l::MapAltToCtrl("l")
LAlt & m::MapAltToCtrl("m")
LAlt & n::MapAltToCtrl("n")
LAlt & o::MapAltToCtrl("o")
LAlt & p::MapAltToCtrl("p")
LAlt & q::MapAltToCtrl("q")
LAlt & r::MapAltToCtrl("r")
LAlt & s::MapAltToCtrl("s")
LAlt & t::MapAltToCtrl("t")
LAlt & u::MapAltToCtrl("u")
; -- Handled specially for terminals
; LAlt & v::MapAltToCtrl("v")
LAlt & w::MapAltToCtrl("w")
LAlt & x::MapAltToCtrl("x")
LAlt & y::MapAltToCtrl("y")
LAlt & z::MapAltToCtrl("z")

LAlt & 9::MapAltToCtrl("9")
LAlt & 0::MapAltToCtrl("0")
LAlt & -::MapAltToCtrl("-")
LAlt & =::MapAltToCtrl("=")
LAlt & ,::MapAltToCtrl(",")

; --- Handle special case Alt-V to paste in terminals
IsTerminal() {
    class := WinGetClass("A")
    return class = "CASCADIA_HOSTING_WINDOW_CLASS"  ; Windows Terminal
        || class = "mintty"                         ; Git Bash
}

LAlt & v:: {
    if GetKeyState("Shift", "P")
        Send "{Ctrl down}{Shift down}v{Shift up}{Ctrl up}"
    else
        if IsTerminal()
            Send "{Shift down}{Insert}{Shift up}"
        else
            Send "{Ctrl down}v{Ctrl up}"
}

; --- Remap Alt + click to Ctrl + click
; --- Remap Win + click to Alt + click
!LButton::Send "^{Click}"
!+LButton::Send "^+{Click}"
#LButton::Send "!{Click}"
#+LButton::Send "!+{Click}"


; Rule 4: Additional keybindings

; --- ⌘ + backspace to delete until start of line
; --- Fix this to work in terminal
LAlt & Backspace:: {
    if GetKeyState("Shift", "P")
        Send "{Ctrl down}{Shift down}{Backspace}{Shift up}{Ctrl up}"
    else
        if IsTerminal()
            Send "{Ctrl down}u{Ctrl up}"
        else
            Send "{Shift down}{Home}{Shift up}{Backspace}"
}

; --- Option + backspace to delete word
#Backspace:: {
    if GetKeyState("Shift", "P")
        Send "{Ctrl down}{Shift down}{Backspace}{Shift up}{Ctrl up}"
    else
        if IsTerminal()
            Send "{Alt down}{Backspace}{Alt up}"
        else
            Send "{Ctrl down}{Backspace}{Ctrl up}"
}

; --- Tab switching within apps
; ⌘ (Shift) + [
LAlt & SC01A:: {
    if GetKeyState("Shift", "P")
        Send "^+{Tab}"
    else
        Send "!{Left}"
}

; ⌘ (Shift) + ]
LAlt & SC01B:: {
    if GetKeyState("Shift", "P")
        Send "^{Tab}"
    else
        Send "!{Right}"
}
