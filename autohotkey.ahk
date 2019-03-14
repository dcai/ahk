; # => Win
; ! => Alt
; ^ => Ctrl
; + => Shift
SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff
;; Capslock::Esc
Capslock::LCtrl
LAlt::LWin
LWin::LAlt

SetTitleMatchMode, 2

+^3::
;+^esc::
if WinExist("ahk_class PuTTY")
	WinActivate
return

+^1::
if WinExist("ahk_exe firefox.exe")
    WinActivate
else
    ;;Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    Run "C:\Program Files\Mozilla Firefox\firefox.exe"
return


+^2::
if WinExist("ahk_exe sublime_text.exe")
    WinActivate
else
    Run "C:\Program Files\Sublime Text 3\sublime_text"
return

+^0::
if WinExist("ahk_class Emacs")
	WinActivate
return

^!\::
    WinMaximize, A  ; Assign a hotkey to maximize the active window.
return

^!r::
    Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.
return

; ^j::
;     MsgBox Wow!
;     MsgBox this is
;     Run, Notepad.exe
;     winactivate, Untitled - Notepad
;     WinWaitActive, Untitled - Notepad
;     send, 7 lines{!}{enter}
;     sendinput, inside the ctrl{+}j hotkey
; Return

; macOS key bindings
!f::Send ^f
!q::!F4    ;退出
!w::Send ^w ;关闭网页窗口
!r::Send #r
!n::Send ^n ;新建
!t::Send ^t ; new tab
!c::Send ^c ; copy
!v::Send ^v ; paste
!s::Send ^s ; save
!e::Send #e ; win+e

^#v::SendRaw %clipboard%

; https://superuser.com/questions/285356/possible-to-snap-top-bottom-instead-of-just-left-right-in-windows-7
; credit: http://www.pixelchef.net/how-snap-windows-horizontally-windows-7
; Move window up (Windows + Shift + UP ... NOTE must maximize window first)
+#Up::
    WinGetPos,X,Y,W,H,A,,,
    WinMaximize
    WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,

    ; if this is greater than 1, we're on the secondary (right) monitor. This
    ;   means the center of the active window is a positive X coordinate
    if ( X + W/2 > 0 ) {
        SysGet, MonitorWorkArea, MonitorWorkArea, 1
        WinMove,A,,X,0 , , (MonitorWorkAreaBottom/2)
    } else {
        SysGet, MonitorWorkArea, MonitorWorkArea, 2
        WinMove,A,,X,0 , , (MonitorWorkAreaBottom/2)
    }
return

; Move window down (Windows + Shift + DOWN ... NOTE must maximize window first)
+#Down::
    WinGetPos,X,Y,W,H,A,,,
    WinMaximize
    WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,

    ; if this is greater than 1, we're on the secondary (right) monitor. This
    ;   means the center of the active window is a positive X coordinate
    if ( X + W/2 > 0 ) {
        SysGet, MonitorWorkArea, MonitorWorkArea, 1
        WinMove,A,,X,MonitorWorkAreaBottom/2 , , (MonitorWorkAreaBottom/2)
    } else {
        SysGet, MonitorWorkArea, MonitorWorkArea, 2
        WinMove,A,,X,MonitorWorkAreaBottom/2 , , (MonitorWorkAreaBottom/2)
    }
return
