Set-Location $env:USERPROFILE

$osrZip = "OSR.zip"
$osrUrl = "https://www.osronline.com/OsrDown.cfm/osrloaderv30.zip"

Invoke-WebRequest -Uri $osrUrl -OutFile $osrZip

$osrDir = Join-Path $PWD "OSR"
if (Test-Path $osrDir) { Remove-Item -Recurse -Force $osrDir }
Expand-Archive -Path $osrZip -DestinationPath $osrDir -Force
