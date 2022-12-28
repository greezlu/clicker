#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Event ; Recommended for new scripts due to its superior speed and reliability.
SetKeyDelay, 50,,

global default_radius := 0
global default_interval := 60

global after_action_max_sleep := 1000
global mouse_speed := 30

global action_list := []
global is_active := false
global interval
