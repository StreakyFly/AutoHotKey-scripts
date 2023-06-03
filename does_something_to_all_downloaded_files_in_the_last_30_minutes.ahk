#Requires AutoHotkey v2.0

#SingleInstance Ignore ; if this script is already running, don't start new one


FILE_EXTENSION := "*"
MINUTES_SINCE_MODIFICATION := 30 ; put 0 to check all files no matter the time


downloads_path := StrReplace(A_Desktop, "Desktop", "Downloads")

new_files := ""
Loop Files downloads_path "\*." FILE_EXTENSION
{
	minutes_since_file_modification := DateDiff(A_Now, A_LoopFileTimeModified, "minutes")
	if minutes_since_file_modification <= MINUTES_SINCE_MODIFICATION || MINUTES_SINCE_MODIFICATION = 0 {
		new_files := A_LoopFileName "`n" new_files
	}
}

MsgBox new_files