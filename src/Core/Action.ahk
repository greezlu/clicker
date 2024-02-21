class Action extends BaseControl
{
	static after_action_max_sleep := 1000

    __New(pid, name)
    {
        this.actionPid := pid
        this.actionName := name
		this.timer := this.tick.Bind(this)
    }

    tick()
    {
		if (!ActionList.active) {
			return
		}

		initial_pid := this.pid()
		after_action_sleep := this.random(0, Action.after_action_max_sleep)

		if (!this.exist(this.actionPid)) {
			this.error(Format("Action PID: {1} | {2} was stopped.", this.actionPid, this.actionName))
			return
        }

		this.activate(this.actionPid)

		this.click()
		
		if ((initial_pid != this.actionPid) && this.exist(initial_pid)) {
			this.activate(initial_pid)
		}

		this.start()
    }
	
	click()
	{
		this.sleep()
	}

	start()
	{
		interval := Random(Config.interval * 0.99, Config.interval * 1.01)
		SetTimer this.timer, -Round(interval)
	}

	stop()
	{
		SetTimer this.timer, 0
	}
	
	random(min, max)
	{
		target := (min + max) / 2

		lower := Random(min, target)
		upper := Random(target, max)

		return Random(lower, upper)
	}
	
	details()
	{
		return Format("PID: {1} | {2}", this.actionPid, this.actionName)
	}
	
	sleep()
	{
		Sleep Action.after_action_max_sleep
	}
}
