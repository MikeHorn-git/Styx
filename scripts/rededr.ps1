Set-Location C:\

$RedEdrZip = "RedEdr.zip"
$RedEdrUrl = "https://github.com/dobin/RedEdr/releases/download/v0.3/RedEdr_0.3.zip"

Invoke-WebRequest -Uri $RedEdrUrl -OutFile $RedEdrZip

$RedEdrDir = Join-Path $PWD "RedEdr"
if (Test-Path $RedEdrDir) { Remove-Item -Recurse -Force $RedEdrDir }
Expand-Archive -Path $RedEdrZip -DestinationPath $RedEdrDir -Force

bcdedit /set TESTSIGNING ON
bcdedit -debug ON
