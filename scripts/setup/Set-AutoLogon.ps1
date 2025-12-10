#Requires -Version 5.1
#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"

$Username = "vagrant"
$Pass = "vagrant"
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'

try {
    Set-ItemProperty -Path $RegistryPath -Name 'AutoAdminLogon' -Value "1" -Type String -ErrorAction Stop
    Set-ItemProperty -Path $RegistryPath -Name 'DefaultUsername' -Value $Username -Type String -ErrorAction Stop
    Set-ItemProperty -Path $RegistryPath -Name 'DefaultPassword' -Value $Pass -Type String -ErrorAction Stop
}
catch {
    Write-Warning "Failed to configure auto logon settings. Error: $_"
}
finally {
    $ErrorActionPreference = "Continue"
}
