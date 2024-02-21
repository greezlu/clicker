class ActionListCommand extends Command
{
    execute()
    {
        if (!ActionList.list.Count) {
            this.error("Empty action list.")
            return
        }

        data := ""

        for pid, pid_action_list in ActionList.list {
            for action in pid_action_list {
                data .= action.details() . "`n"
            }
        }

        this.show(data, "Action List")
    }
}
