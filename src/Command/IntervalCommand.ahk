class IntervalCommand extends Command
{
    execute()
    {
        interval_input := this.input("Please enter interval in seconds.", "Interval")

        interval_input_value := interval_input.Value
        interval_input_result := interval_input.Result

        if (interval_input_result = "Cancel" || interval_input_value = "" || !IsDigit(interval_input_value)) {
            Config.setInterval()
            this.info("Set to deault 60s interval.")
        } else {
            Config.setInterval(interval_input_value)
        }
    }
}
