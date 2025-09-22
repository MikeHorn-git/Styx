winget install Kitware.CMake -e
winget install BrechtSanders.WinLibs.MCF.UCRT -e

winget install VSCodium.VSCodium -e

winget install Git.Git -e
winget install Rustlang.Rustup -e

winget install Microsoft.Sysinternals.Suite -e
winget install Microsoft.WinDbg -e
winget install Microsoft.WindowsTerminal -e

winget install --id Microsoft.WindowsSDK.10.0.26100 -e --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.WindowsWDK.10.0.26100 -e --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VisualStudio.2022.Community -e `
  --accept-package-agreements --accept-source-agreements --silent `
  --override "--wait --quiet --norestart --addProductLang En-us `
    --add Microsoft.Component.VC.Runtime.UCRTSDK `
    --add Microsoft.VisualStudio.Component.VC.ASAN `
    --add Microsoft.VisualStudio.Component.VC.ATL `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.VC.Tools.14.34.17.4 `
    --add Microsoft.VisualStudio.Component.Windows11SDK.22621 `
    --add Microsoft.VisualStudio.Workload.CoreEditor `
    --add Microsoft.VisualStudio.Workload.NativeDesktop `
    --add Component.Microsoft.Windows.DriverKit"

$AddPATH = ";C:\Program Files\CMake\bin;C:\Program Files\Git\bin"
[Environment]::SetEnvironmentVariable("Path", $env:Path + $AddPATH, "Machine")
