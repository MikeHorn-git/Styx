#Requires -Version 5.1

Set-Location -Path "C:\"

$RedEdrZip = "RedEdr.zip"
$RedEdrUrl = "https://github.com/dobin/RedEdr/releases/download/v0.3/RedEdr_0.3.zip"
$RedEdrDir = Join-Path -Path $PWD -ChildPath "RedEdr"

function Invoke-Safely {
    param (
        [Parameter(Mandatory=$true)][scriptblock]$Command,
        [string]$ErrorMessage = "An error occurred."
    )
    try {
        & $Command
    } catch {
        Write-Error "$ErrorMessage Error: $_"
    }
}

if (-Not (Test-Path -Path $RedEdrZip)) {
    Write-Output "Downloading RedEdr package..."
    Invoke-Safely { Invoke-WebRequest -Uri $RedEdrUrl -OutFile $RedEdrZip } "Failed to download RedEdr.zip."
} else {
    Write-Warning "RedEdr.zip already exists."
}

Write-Output "Extracting RedEdr.zip..."
Invoke-Safely { Expand-Archive -Path $RedEdrZip -DestinationPath $RedEdrDir -Force } "Failed to extract RedEdr archive."

Write-Output "Enabling test signing and debugging options..."
Invoke-Safely { bcdedit /set TESTSIGNING ON } "Failed to enable test signing."
Invoke-Safely { bcdedit /debug ON } "Failed to enable debugging."
