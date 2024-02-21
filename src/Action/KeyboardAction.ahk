class KeyboardAction extends Action
{
    __New(button, pid, name)
    {
		super.__New(pid, name)
        this.button := button
    }

    click()
    {
        Send this.button
		super.click()
    }
	
	details()
	{
		return Format("PID: {1} | {2} | keyboard", this.actionPid, this.actionName)
	}
}
