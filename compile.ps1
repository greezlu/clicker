Write-Host "Starting ..."

$ahk = "AutoHotkey\Compiler\Ahk2Exe.exe"
$index = ".\index.ahk"
$base = "AutoHotkey\v2\AutoHotkey64.exe"
$out = "ahk_v1_7"
$icon = ".\media\icon.ico"

if (Test-Path -Path ".\$out.exe" -PathType Leaf) {
    Write-Host "Output file already exists ..." -ForegroundColor Black -BackgroundColor White
} else {
    Start-Process -FilePath "$env:PROGRAMFILES\$ahk"`
        -ArgumentList "/in $index /out $out /icon $icon /base `"$env:PROGRAMFILES\$base`""`
        -PassThru `
        -Wait
}

Read-Host -Prompt "Press Enter to exit"
