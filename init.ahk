﻿config_path := "config.ini"

log_path := "log.txt"

IniRead, mouse_speed, %config_path%, General, mouse_speed

logger := new Logger()

action_list := []

is_active := false
