#Requires -Version 5.1
#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
Set-Location -Path $env:USERPROFILE

$hevdZip = "HEVD.zip"
$hevdUrl = "https://github.com/hacksysteam/HackSysExtremeVulnerableDriver/releases/download/v3.00/HEVD.3.00.zip"
$hevdDir = Join-Path -Path $PWD -ChildPath "HEVD"

function Invoke-Safely {
    param (
        [Parameter(Mandatory=$true)][scriptblock]$Command,
        [string]$ErrorMessage = "An error occurred while executing command."
    )
    try {
        & $Command
    } catch {
        Write-Error "$ErrorMessage Error: $_"
    }
}

if (-Not (Test-Path -Path $hevdZip)) {
    Invoke-Safely { Invoke-WebRequest -Uri $hevdUrl -OutFile $hevdZip } "Failed to download HEVD.zip."
} else {
    Write-Warning "HEVD.zip already exists."
}

Invoke-Safely { Expand-Archive -Path $hevdZip -DestinationPath $hevdDir -Force } "Failed to extract HEVD archive."

Write-Output "Enabling test signing and disabling integrity checks..."
Invoke-Safely { bcdedit /set TESTSIGNING ON } "Failed to enable test signing."
Invoke-Safely { bcdedit /set loadoptions DISABLE_INTEGRITY_CHECKS } "Failed to disable integrity checks."
