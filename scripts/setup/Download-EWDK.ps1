#Requires -Version 5.1

$ISO = "EWDK_ge_release_svc_prod3_26100_250220-1537.iso"
$LocalPath = "C:\$ISO"
$LinkEWDK = "https://software-static.download.prss.microsoft.com/dbazure/998969d5-f34g-4e03-ac9d-1f9786c66749/$ISO"

if (-Not (Test-Path $LocalPath)) {
    try {
        Write-Output "Downloading file..."
        Invoke-WebRequest -Uri $LinkEWDK -OutFile $LocalPath -ErrorAction Stop
    }
    catch {
        Write-Warning "Failed to download file. Error: $_"
    }
}
else {
    Write-Output "File already exists at $LocalPath."
}
