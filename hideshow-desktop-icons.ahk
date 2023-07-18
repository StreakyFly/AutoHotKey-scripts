#NoEnv
SendMode Input

; Show desktop icons
ControlGet, HWND, Hwnd,, SysListView321, ahk_class Progman
If HWND =
    ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW
If DllCall("IsWindowVisible", UInt, HWND)
    WinHide, ahk_id %HWND%
Else
    WinShow, ahk_id %HWND%

; Notify the system that the desktop has changed to refresh the icons
DllCall("Shell32\SHChangeNotify", UInt, 0x08000000, UInt, 0, UIntP, 0, UIntP, 0)