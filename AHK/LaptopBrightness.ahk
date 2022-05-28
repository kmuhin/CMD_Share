; original from https://www.autohotkey.com/boards/viewtopic.php?p=365188&sid=b894e15471959bd01e3066780e4e0b0d#p365188

; Switches Brightness off/on pressing by win+m
; save and restore previous brightness level
#m::
current_brightness := GetCurrentBrightNess()
if (current_brightness > 0)
{
  last_brightness := current_brightness
  ChangeBrightness(0)
}
else if (last_brightness)
{
  ChangeBrightness(last_brightness)
}
return

ChangeBrightness( ByRef brightness, timeout = 1 )
{
	if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
		property.WmiSetBrightness( timeout, brightness )	
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}
