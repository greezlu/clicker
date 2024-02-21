class ActionList extends BaseControl
{
    static list := Map()
    static active := false

    enable()
    {
        if (ActionList.active) {
            this.error("Process has already been started.")
            return
        }

        if (!ActionList.list.Count) {
            this.error("Empty action list.")
            return
        }

        this.sanitize()

        ActionList.active := true

        for pid, pid_action_list in ActionList.list {
            for action_index, action in pid_action_list {
                action.tick()
                action.start()
            }
        }
    }

    disable()
    {
        if (!ActionList.active) {
            this.error("Process is not started.")
            return
        }

        for pid, pid_action_list in ActionList.list {
            for action in pid_action_list {
                action.stop()
            }
        }

        this.sanitize()

        this.info("Process was stopped.")

        ActionList.active := false
    }

    add(pid, name, action)
    {
        list := ActionList.list.Has(pid) ? ActionList.list.Get(pid) : []
        list.Push(action)

        ActionList.list.Set(pid, list)

        this.info(Format("Action PID: {1} | {2} was added to list.", pid, name))
    }

    remove(pid, index := false)
    {
        if (!ActionList.list.Count) {
            this.error("Empty action list.")
            return
        }

        if (!ActionList.list.Has(pid)) {
            this.error(Format("Action PID: {1} not found in list.", pid))
            return
        }

        if (index = false) {
            ActionList.list.Delete(pid)
        } else if (this.list.Get(pid).Has(index)) {
            ActionList.list.Get(pid).RemoveAt(index)
        }

        this.sanitize()

        if (index = false) {
            this.info(Format("Actions with PID: {1} were removed from list.", pid))
        } else {
            this.info(Format("Action PID: {1} | Index: {2} was removed from list.", pid, index))
        }
    }

    sanitize()
    {
        for pid, pid_action_list in ActionList.list {
            if (!this.exist(pid) || !pid_action_list.Length) {
                this.remove(pid)
            }
        }
    }
}
