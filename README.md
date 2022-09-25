# Clicker

Simple clicker script. Created and compiled using [AutoHotkey](https://www.autohotkey.com/).

[Download](https://github.com/greezlu/clicker/releases) release for windows.

## Main Functionalities
Creating list of action attached to specific windows.

## Shortcuts
- `Ctrl + 1` Start processing action list. 
- `Ctrl + 2` Stop processing action list. 
- `Ctrl + 3` Set interval in seconds. 
- `Ctrl + 4` Add mouse click action for current window. 
- `Ctrl + 5` Add keyboard action for current window. 
- `Ctrl + 0` Remove current window from action list. 
- `Ctrl + q` Terminate current application. 

## Additional
- Script is requiring admin privileges.
- List of special keys can be found [here](https://www.autohotkey.com/docs/commands/Send.htm#keynames).
- If interval wasn't set before action call, it will be prompted automatically.
- [SetKeyDelay](https://www.autohotkey.com/docs/commands/SetKeyDelay.htm) is set to 50.
- Interval between actions was modified to slightly differ each time for 1%.
- Mouse click happens in random place inside given radius. But closer to center.
- Mouse click is set to left-click only.
- Actions will be activated in the order they were added.
- One action for one window (process).

## Compilation
Executable release was compiled using default [compiler](https://www.autohotkey.com/docs/Scripts.htm#ahk2exe).
Feel free to compile by yourself. Initial point is `index.ahk`.

You also need to disable defender to use executable as there is no signature provided by compiler.  

## Scenario example for keyboard click
1. Open `ahk.exe`.
2. Press `Ctrl + 3` to set time interval in seconds. \[Can be skipped\]
3. Open a window you want to automate.
4. Press `Ctrl + 5`.
5. Input buttons you want to be pressed.
6. Press `Ctrl + 1` to start working process.

You're done. Repeat steps 3-5 to add more action windows to list.

## Scenario example for mouse (left) click
1. Open `ahk.exe`.
2. Press `Ctrl + 3` to set time interval in seconds. \[Can be skipped\]
3. Open a window you want to automate.
4. Press `Ctrl + 4`.
5. Input `X Coordinate`.
6. Input `Y Coordinate`.
7. Input `Radius`.
8. Press `Ctrl + 1` to start working process.

You're done. Repeat steps 4-7 to add more action windows to list.
