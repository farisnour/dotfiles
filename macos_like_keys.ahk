#Requires AutoHotkey v2.0+
#SingleInstance Force

; macOS-style key remapping for Windows 11

; Rule 1: Alt+Tab passthrough
; Fix this later: Alt Tab Tab doesn't work
LAlt & Tab:: {
    if GetKeyState("Shift", "P")
        Send "{Alt down}{Shift down}{Tab}{Shift up}{Alt up}"
    else
        Send "{Alt down}{Tab}{Alt up}"
}


; Rule 2: Cursor navigation for text editing

; -- Line navigation (⌘ + arrows)
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

; -- Word navigation (Option + arrows)
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
LAlt & v::MapAltToCtrl("v")
LAlt & w::MapAltToCtrl("w")
LAlt & x::MapAltToCtrl("x")
LAlt & y::MapAltToCtrl("y")
LAlt & z::MapAltToCtrl("z")

; Rule 4: Additional keybindings

; --- ⌘ + backspace to delete word in terminal
; --- Fix this to delete from cursor to start of line
LAlt & Backspace:: {
    if GetKeyState("Shift", "P")
        Send "{Alt down}{Shift down}{Backspace}{Shift up}{Alt up}"
    else
        Send "{Alt down}{Backspace}{Alt up}"
}

; --- Option + backspace to delete word
#Backspace:: {
    if GetKeyState("Shift", "P")
        Send "{Ctrl down}{Shift down}{Backspace}{Shift up}{Ctrl up}"
    else
        Send "{Ctrl down}{Backspace}{Ctrl up}"
}

; --- Tab switching within apps
; ⌘ (Shift) + [
LAlt & SC01A:: {
    if GetKeyState("Shift", "P")
        Send "^+{Tab}"
    else
        Send "^["
}

; ⌘ (Shift) + ]
LAlt & SC01B:: {
    if GetKeyState("Shift", "P")
        Send "^{Tab}"
    else
        Send "^]"
}
