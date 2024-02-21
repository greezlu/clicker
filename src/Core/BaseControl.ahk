class BaseControl
{
	pid()
	{
		return WinGetPID("A")
	}

	name()
	{
		return ProcessGetName(this.pid())
	}

	activate(pid)
	{
		WinActivate("ahk_pid " . pid)
	}

	exist(pid)
	{
		return WinExist("ahk_pid " . pid)
	}

	info(text, title := "Info")
	{
		MsgBox text, title, "0 64 T3"
	}

	error(text, title := "Error")
	{
		MsgBox text, title, "0 16 T3"
	}

	show(text, title)
	{
		MsgBox text, title, "0 64"
	}
	
	input(text, title)
	{
		return InputBox(text, title)
	}
}
