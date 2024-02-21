class WindowInfoCommand extends Command
{
    execute()
	{
		this.show(Format("PID: {1} | {2}", this.pid(), this.name()), "Current Window")
	}
}
