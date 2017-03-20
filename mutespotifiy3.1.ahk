; Mutespotify 2.1.1 
; March 19 2017
; Created by Isaac Zinman
; Totally unlicensed and free to use, distribute, and copy

global spotifyIsMuted = false
global mutex = 0
global mutey = 0

FindMuteButton()

Loop
{
	if (AdRunning() AND !spotifyIsMuted)
	{
		Mute()
		spotifyIsMuted = true
	}
	else if (!AdRunning() AND spotifyIsMuted)
	{
		Unmute()
		spotifyIsMuted = false
	}
	Sleep, 1000
}

Mute()
{
  DetectHiddenWindows, On
  SetControlDelay -1
  ControlClick, x%mutex% y%mutey%, ahk_class SpotifyMainWindow,,,, NA
  DetectHiddenWindows, Off
  Return
}

Unmute()
{
	Mute()
	Return
}

AdRunning()
{
	CurrentTitle = string
	specialString := "`-"
	WinGetTitle, CurrentTitle, ahk_class SpotifyMainWindow
	IfInString, CurrentTitle, %specialString%
	{
		Return false
	}
	Return true
}

FindMuteButton()
{
	winx = 0
	winy = 0
	WinGetPos, , , winx, winy, ahk_class SpotifyMainWindow
	mutex := winx - 120
	mutey := winy - 30
}
	
	