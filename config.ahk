#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Event ; Recommended for new scripts due to its superior speed and reliability.
SetKeyDelay, 50,,

global config_path
global action_list
global interval
global after_action_max_sleep
global mouse_speed
global logger
global is_active
