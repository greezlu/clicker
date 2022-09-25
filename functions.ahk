start_process()
{
    if (is_active) {
        MsgBox, 16, Error, Process has already been started., 5
        return
    }

    if (!interval) {
        set_interval()
    }

    if (!action_list.Length()) {
        MsgBox, 16, Error, Empty action list., 5
        return
    }

    is_active := true

    process()
}

process()
{
    if (!is_active) {
        return
    }

    WinGet, initial_pid, PID, A

    for index, action in action_list {
        WinActivate, % "ahk_pid" action.pid
        action.click()
    }

    WinActivate, % "ahk_pid" initial_pid

    Random, interval_random, % interval * -0.01, % interval * 0.01
    SetTimer, process, % -Round(interval + interval_random)
}

stop_process()
{
    if (!is_active) {
        MsgBox, 16, Error, Process didn't start., 5
        return
    }

    is_active := false
    SetTimer process, Off
    MsgBox, 0, Confirm, Process was stopped., 5
}

set_interval()
{
    InputBox, input_interval, Interval, Please enter interval in seconds.

    if (input_interval is not integer) {
        IniRead, input_interval, %config_path%, General, default_interval_sec
    }

    interval := input_interval * 1000
}

current_window_info()
{
    WinGet, pid, PID , A
    WinGet, process_name, ProcessName , A

    data := "PID: " . pid . " | " . process_name

    MsgBox, 0, Current window, % data
}

show_action_list()
{
    if (!action_list.Length()) {
        MsgBox, 0, Confirm, Empty action list., 5
        return
    }

    data := ""

    for index, action in action_list {
        data .= "PID: " . action.pid . " | " . action.process_name . " | " . action.action_name . "`n"
    }

    MsgBox, 0, Action list, % data
}

add_action(action_type)
{
    WinGet, current_pid, PID, A

    for index, action in action_list {
        if (action.pid = current_pid) {
            MsgBox, 16, Error, Action PID %current_pid% has already been added., 5
            return
        }
    }

    if (action_type = "mouse") {
        action := get_mouse_action(current_pid)
    } else if (action_type = "keyboard") {
        action := get_keyboard_action(current_pid)
    } else {
        MsgBox, 16, Error, Internal error., 5
        return
    }

    if (isObject(action)) {
        action_list.Push(action)
        MsgBox, Action PID: %current_pid% was added to list.
    } else {
        MsgBox, Action PID: %current_pid% was not added.
    }
}

get_mouse_action(current_pid)
{
    InputBox, x_coord, [X] Coordinate, Please enter [X] coordinate.

    if (!x_coord) {
        return
    }

    InputBox, y_coord, [Y] Coordinate, Please enter [Y] coordinate.

    if (!y_coord) {
        return
    }

    InputBox, radius, Radius, Please enter radius.

    if (!radius) {
        IniRead, radius, %config_path%, General, default_radius
    }

    Return, new MouseClickAction(current_pid, x_coord, y_coord, radius)
}

get_keyboard_action(current_pid)
{
    InputBox, button, Radius, Please enter button.

    if (!button) {
        return
    }

    Return, new ButtonClickAction(current_pid, button)
}

remove_action()
{
    WinGet, current_pid, PID, A

    remove_index := false
    remove_pid := false

    for index, action in action_list {
        if (action.pid = current_pid) {
            remove_index := index
            remove_pid := action.pid
            break
        }
    }

    if (remove_index = false || remove_pid = false) {
        MsgBox, 16, Error, Action PID: %current_pid% is not in action list., 5
    } else {
        action_list.RemoveAt(remove_index)
        MsgBox, Action PID: %remove_pid% was removed from list.
    }

    if (!action_list.Length() && is_active) {
        stop_process()
    }
}
