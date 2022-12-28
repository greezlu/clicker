Write-Host "Starting ..."

$ahk = "AutoHotkey\Compiler\Ahk2Exe.exe"
$index = ".\index.ahk"
$out = "ahk_v1_5"
$icon = ".\icon.ico"

if (Test-Path -Path ".\$out.exe" -PathType Leaf) {
    Write-Host "Output file already exists ..." -ForegroundColor Black -BackgroundColor White
} else {
    Start-Process -FilePath "$env:PROGRAMFILES\$ahk"`
        -ArgumentList "/in $index /out $out /icon $icon"`
        -PassThru `
        -Wait
}

Read-Host -Prompt "Press Enter to exit"
