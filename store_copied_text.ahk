#Requires AutoHotkey v2.0

#SingleInstance Ignore  ; if this script is already running, don't start another one


; Ctrl+C=>+E to activate (Ctrl+C=>+S would be a bit more practical, but then Ctrl+S doesn't work)
^e::
{
	if GetKeyState("c", "P")
	{
		filePath := A_Desktop "\CopiedText.txt"

		if not FileExist(filePath) {
			FileAppend "#########################################################################`nALL TEXT COPIED USING A SPECIAL SHORTCUT (CTRL+C=>+E) WILL BE SAVED HERE!`n#########################################################################`n`n", filePath
		}  ; if file doesn't exist, it creates it and adds a header

		textToSave := " - " A_Clipboard "`n`n"
		FileAppend textToSave, filePath

	    ToolTip("saved")  ; display a tooltip notification near the mouse cursor
	    Sleep(500)
	    ToolTip  ; hide the tooltip
	}
}
