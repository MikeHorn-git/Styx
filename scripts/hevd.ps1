Set-Location $env:USERPROFILE

$hevdZip = "HEVD.zip"
$hevdUrl = "https://github.com/hacksysteam/HackSysExtremeVulnerableDriver/releases/download/v3.00/HEVD.3.00.zip"

Invoke-WebRequest -Uri $hevdUrl -OutFile $hevdZip

$hevdDir = Join-Path $PWD "HEVD"
if (Test-Path $hevdDir) { Remove-Item -Recurse -Force $hevdDir }
Expand-Archive -Path $hevdZip -DestinationPath $hevdDir -Force

$drvDir = Join-Path $hevdDir "driver\vulnerable\x64"
$infPath = Join-Path $drvDir "HEVD.inf"
$sysPath = Join-Path $drvDir "HEVD.sys"

bcdedit /set TESTSIGNING ON
bcdedit /set loadoptions DISABLE_INTEGRITY_CHECKS
