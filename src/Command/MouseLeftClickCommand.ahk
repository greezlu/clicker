class MouseLeftClickCommand extends Command
{
    execute()
    {
        MouseGetPos &x_coord, &y_coord

        current_pid := this.pid()
        current_name := this.name()

        action := MouseLeftClickAction(x_coord, y_coord, current_pid, current_name)

        this.actionList.add(current_pid, current_name, action)
    }
}
