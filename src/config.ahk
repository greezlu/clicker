CoordMode "Mouse", "Screen"
SendMode "Event"
SetKeyDelay 50

if (!A_IsAdmin) {
    try
	{
		if A_IsCompiled
			Run '*RunAs "' A_ScriptFullPath '" /restart'
		else
			Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
	}
	ExitApp
}
