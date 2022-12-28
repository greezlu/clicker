config_path := "config.ini"

IniRead, after_action_max_sleep, %config_path%, General, after_action_max_sleep

IniRead, mouse_speed, %config_path%, General, mouse_speed

logger := new Logger()

action_list := []

is_active := false
