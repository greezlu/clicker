class RadiusCommand extends Command
{
    execute()
	{
		radius_input := this.input("Please enter radius in pixels.", "Radius")

		radius_input_value := radius_input.Value
		radius_input_result := radius_input.Result

		if (radius_input_result = "Cancel" || radius_input_value = "" || !IsDigit(radius_input_value)) {
			Config.setRadius()
			this.info("Set to deault 5px radius.")
		} else {
			Config.setRadius(radius_input_value)
		}
	}
}
