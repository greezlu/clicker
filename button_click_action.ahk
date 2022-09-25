class ButtonClickAction
{
    __New(pid, button)
    {
        this.button := button
        this.pid := pid
    }

    click()
    {
        Send, % this.button
    }
}
