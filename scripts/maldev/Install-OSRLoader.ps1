#Requires -Version 5.1

Set-Location -Path $env:USERPROFILE

$osrZip = "OSR.zip"
$osrUrl = "https://www.osronline.com/OsrDown.cfm/osrloaderv30.zip"
$osrDir = Join-Path -Path $PWD -ChildPath "OSR"

function Invoke-Safely {
    param (
        [Parameter(Mandatory=$true)][scriptblock]$Command,
        [string]$ErrorMessage = "An error occurred."
    )
    try {
        & $Command
    } catch {
        Write-Warning "$ErrorMessage Error: $_"
    }
}

if (-Not (Test-Path -Path $osrZip)) {
    Write-Output "Downloading OSR package..."
    Invoke-Safely { Invoke-WebRequest -Uri $osrUrl -OutFile $osrZip } "Failed to download OSR.zip."
} else {
    Write-Output "OSR.zip already exists, skipping download."
}

Write-Output "Extracting OSR.zip..."
Invoke-Safely { Expand-Archive -Path $osrZip -DestinationPath $osrDir -Force } "Failed to extract OSR archive."
