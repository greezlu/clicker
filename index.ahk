﻿#Include config.ahk
#Include polyfill.ahk

if (!A_IsAdmin) {
    restart()
}

#Include class.ahk
#Include functions.ahk
#Include bootstrap.ahk
