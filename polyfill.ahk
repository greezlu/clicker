restart()
{
    try
    {
        if (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }

    ExitApp
}

target_random(min, max)
{
    target := (min + max) / 2

    Random, lower, min, target
    Random, upper, target, max
    Random, middle, lower, upper

    Return, middle
}
