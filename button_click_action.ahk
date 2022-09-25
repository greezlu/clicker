class ButtonClickAction
{
    action_name := "keyboard_action"

    __New(pid, button)
    {
        WinGet, process_name, ProcessName , % "ahk_pid" pid

        this.button := button
        this.pid := pid
        this.process_name := process_name
    }

    click()
    {
        Send, % this.button
    }
}
