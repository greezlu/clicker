# Clicker

[v2.0.11](https://github.com/AutoHotkey/AutoHotkey/tree/v2.0.11)

Simple clicker script. Created and compiled using [AutoHotkey](https://www.autohotkey.com/).

Creating list of action attached to specific windows.

[Download](https://github.com/greezlu/clicker/releases) release for windows.

## Shortcuts
- `Ctrl + 1` Start processing action list.
- `Ctrl + 2` Stop processing action list.
- `Ctrl + 3` Add mouse click action for current window.
- `Ctrl + 4` Add keyboard action for current window.
- `Ctrl + 5` Set interval in seconds.
- `Ctrl + 6` Set radius in pixels.
- `Ctrl + 7` Show *PID* and *Process name* for current window.
- `Ctrl + 8` Show current action list.
- `Ctrl + 9` Remove current window from action list.
- `Ctrl + 0` Close current clicker application.

## Additional
- Running clicker requires admin privileges.
- List of special keys can be found [here](https://www.autohotkey.com/docs/v2/lib/Send.htm#keynames).
- [SetKeyDelay](https://www.autohotkey.com/docs/v2/lib/SetKeyDelay.htm) is set to `50`.
- [CoordMode](https://www.autohotkey.com/docs/v2/lib/CoordMode.htm) for mouse is set to `Screen`.
- Interval between actions was modified to slightly differ each time for 1%.
- Default interval is `60s`.
- Mouse click happens in random place inside given radius. But closer to center.
- Default click radius is `5px`.
- No limit for actions per window.

## Terminology
- **Process**: Infinite loop of calls to every registered action.
- **Action**: Registered mouse click or keyboard buttons.
- **Action list**: List of registered actions sorted by added time.
- **Registration**: Adding new record to action list.
- **PID**: Process (window) ID.

## Compilation
Executable release was compiled using default [compiler](https://www.autohotkey.com/docs/v2/Scripts.htm#ahk2exe).
Initial point is `index.ahk`.

Feel free to compile by yourself using `compile.ps1` script.

**Example for CLI compilation:**

    Ahk2Exe.exe /in index.ahk /out ahk /icon media\icon.ico

## Examples

### Example for mouse (left) click
1. Open `ahk.exe`.
2. Open a window you want to automate.
3. Position a mouse cursor.
4. Press `Ctrl + 3`.
5. Press `Ctrl + 1` to start working process.

Repeat steps 2-4 to add more action windows to list.

### Example for keyboard click
1. Open `ahk.exe`.
2. Open a window you want to automate.
3. Press `Ctrl + 4`.
4. Input buttons you want to be pressed.
5. Press `Ctrl + 1` to start working process.

Repeat steps 2-4 to add more action windows to list.
