class KeyboardClickCommand extends Command
{
    execute()
    {
        current_pid := this.pid()
        current_name := this.name()

        button_input := this.input("Please enter button.", "Add keyboard action")

        button_input_value := button_input.Value
        button_input_result := button_input.Result

        if (button_input_result = "Cancel" || button_input_value = "") {
            this.error("Incorrect keyboard action provided.")
            return
        }

        action := KeyboardAction(button_input_value, current_pid, current_name)

        this.actionList.add(current_pid, current_name, action)
    }
}
