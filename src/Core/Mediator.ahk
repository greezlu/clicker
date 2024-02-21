class Mediator
{
	static startCommand := StartCommand()
	static stopCommand := StopCommand()
	static mouseLeftClickCommand := MouseLeftClickCommand()
	static keyboardClickCommand := KeyboardClickCommand()
	static intervalCommand := IntervalCommand()
	static radiusCommand := RadiusCommand()
	static windowInfoCommand := WindowInfoCommand()
	static actionListCommand := ActionListCommand()
	static removeCommand := RemoveCommand()
	static exitCommand := ExitCommand()

    static start()
	{
		this.startCommand.execute()
	}

    static stop()
	{
		this.stopCommand.execute()
	}

    static addMouseLeftClick()
	{
		this.mouseLeftClickCommand.execute()
	}

    static addKeyboardClick()
	{
		this.keyboardClickCommand.execute()
	}

    static askInterval()
	{
		this.intervalCommand.execute()
	}

    static askRadius()
	{
		this.radiusCommand.execute()
	}

    static showWindowInfo()
	{
		this.windowInfoCommand.execute()
	}

    static showActionList()
	{
		this.actionListCommand.execute()
	}

    static remove()
	{
		this.removeCommand.execute()
	}

    static exit()
	{
		this.exitCommand.execute()
	}
}
