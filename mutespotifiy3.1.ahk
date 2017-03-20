; Mutespotify 3.1.1 
; Copyright 2017 Isaac Zinman
; Free to use and distribute under GNU public license (GPL)
; For more information on licensing see readme.md

global spotifyIsMuted = false
global mutex = 0
global mutey = 0

FindMuteButton()

Loop
{
	if (AdRunning())
	{
		if (!%spotifyIsMuted%)
		{
			ToggleMute()
			spotifyIsMuted = true
		}
	}
	else 
	{
		if (%spotifyIsMuted%)
		{
			ToggleMute()
			spotifyIsMuted = false
		}
	}
	Sleep, 1000
}

ToggleMute()
{
  DetectHiddenWindows, On
  SetControlDelay -1
  ControlClick, x%mutex% y%mutey%, ahk_class SpotifyMainWindow,,,, NA
  DetectHiddenWindows, Off
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
	
	
