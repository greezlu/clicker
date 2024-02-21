class RemoveCommand extends Command
{
    execute()
    {
        this.actionList.remove(this.pid())
    }
}
