#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Event ; Recommended for new scripts due to its superior speed and reliability.
SetKeyDelay, 100,,

#Persistent

global config_path
global log_path
global event_list
global interval
global mouse_speed
global logger
