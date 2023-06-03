#SingleInstance
#Include, CaptureScreen.ahk  ; assumes it's in the same folder as script

imageFormat := ".png"  ; .jpg's compression can be seen when you zoom in image
savedPath := A_Desktop "\AHK-Screenshots\"

+Space::  ; script will be ran (screenshot saved) every time user presses Shift+Space

if (not FileExist(savedPath))
{
    RunWait, % "cmd /c mkdir """ savedPath """",, Hide
}

; Find the highest numbered file in the directory
highestNum := 0
Loop, Files, %savedPath%*%imageFormat%
{
    fileNum := SubStr(A_LoopFileName, 1, 2)
    if (fileNum > highestNum)
        highestNum := fileNum
}

; Increment the number and construct the new filename
newNum := highestNum + 1
newFilename := savedPath . Format("{:02d}", newNum) . imageFormat

; Take the screenshot and save it with the new filename
CaptureScreen(3, 0, newFilename)
; first parameter indicates full screen capture(0 = all display screenshot, 1 = current window screenshot, 3 = current display screenshot...)
; change 2nd parameter to 1 if you want mouse cursor in image

return
