#Requires -Version 5.1
#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
$ProgressPreference = 'SilentlyContinue'

try {
    Install-PackageProvider -Name NuGet -Force -ErrorAction Stop | Out-Null
    Install-Script -Name winget-install -Force -ErrorAction Stop | Out-Null
    & winget-install -Force

    winget source reset --force
    winget configure --enable
    winget configure --file "C:\src\tools.yaml" --accept-configuration-agreements
}
catch {
    Write-Warning "An error occurred during winget installation: $_"
}
finally {
    $ProgressPreference = 'Continue'
}
