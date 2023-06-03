#Requires AutoHotkey v2.0

#SingleInstance Ignore ; if this script is already running, don't start new one

BlockInput true ; blocks user input (mouse clicks, keyboard presses), this only works if script is ran as administrator

; Check if clipboard contains any data
if A_Clipboard != "" {
    Run "notepad"
	WinWaitActive "ahk_class Notepad"

	Send "^v" ; pastes copied contents
	Send "^a" ; selects all text
	Send "^c" ; copies all text
	Sleep 100

	WinClose ; closes notepad
	Send "{Right}"
	Send "{Enter}"
}

BlockInput false ; resumes user input
