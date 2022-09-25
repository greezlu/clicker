start_process()
{
    if (!interval) {
        set_interval()
    }

    if (!event_list.Length()) {
        MsgBox, 16, Error, Empty event list., 5
        return
    }

    process()
}

process()
{
    WinGet, initial_pid, PID, A

    for index, event in event_list {
        WinActivate, % "ahk_pid" event.pid
        event.click()
    }

    WinActivate, % "ahk_pid" initial_pid

    Random, interval_random, % interval * -0.01, % interval * 0.01
    SetTimer, process, % -Round(interval + interval_random)
}

stop_process()
{
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

add_event(event_type)
{
    WinGet, current_pid, PID, A

    for index, event in event_list {
        if (event.pid = current_pid) {
            MsgBox, 16, Error, Event PID %current_pid% has already been added., 5
            return
        }
    }

    if (event_type = "mouse") {
        action := get_mouse_event(current_pid)
    } else if (event_type = "keyboard") {
        action := get_keyboard_event(current_pid)
    } else {
        MsgBox, 16, Error, Internal error., 5
        return
    }

    if (action) {
        event_list.Push(action)
        MsgBox, Event PID: %current_pid% was added to list.
    } else {
        MsgBox, Event PID: %current_pid% was not added.
    }
}

get_mouse_event(current_pid)
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

get_keyboard_event(current_pid)
{
    InputBox, button, Radius, Please enter button.

    if (!button) {
        return
    }

    Return, new ButtonClickAction(current_pid, button)
}

remove_event()
{
    WinGet, current_pid, PID, A

    for index, event in event_list {
        event_pid := event.pid

        if (event_pid = current_pid) {
            event_list.RemoveAt(index)
            MsgBox, Event PID: %event_pid% was removed from list.
            return
        }
    }

    MsgBox, 16, Error, Event PID: %current_pid% is not in event list., 5
}
