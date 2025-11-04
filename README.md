# Styx

![image](https://upload.wikimedia.org/wikipedia/commons/6/6b/Lytovchenko_Olexandr_Kharon.jpg)

## Table of content

- [Requirements](https://github.com/MikeHorn-git/Styx#requirements)
- [Providers](https://github.com/MikeHorn-git/Styx#providers)
- [Plugins](https://github.com/MikeHorn-git/Styx#plugins)
- [Installation](https://github.com/MikeHorn-git/Styx#installation)
- [Targets](https://github.com/MikeHorn-git/Styx#targets)
- [Features](https://github.com/MikeHorn-git/Styx#features)
- [Credits](https://github.com/MikeHorn-git/Styx#credits)

## Requirements

- Provider
- Vagrant

## Providers

- Virtualbox
- Vmware

## Plugins

> [!Note]
> Vagrant-vmware certificates are stored in `/opt/vagrant-vmware-desktop/certificates` by default.

- [vagrant-reload](https://github.com/aidanns/vagrant-reload)
- [vagrant-vmware-desktop](https://github.com/hashicorp/vagrant-vmware-desktop) (Optionnal)
- [vagrant-vmware-utility](https://github.com/hashicorp/vagrant/blob/main/website/content/docs/providers/vmware/vagrant-vmware-utility.mdx) (Optionnal)

## Installation

```bash
git clone https://github.com/MikeHorn-git/Styx
cd Styx
vagrant up
```

## Targets

- C/C++ Windows Dev
- Hypervisor Dev
- Rust Dev
- Windows Driver Dev

## Features

- **Build system**
  - [Cmake](https://cmake.org/)
  - [Make](http://www.gnu.org/software/make/) ([Winlibs](https://winlibs.com/))
- **Compiler**
  - [Clang](http://llvm.org/) ([Winlibs](https://winlibs.com/))
  - [GCC](https://gcc.gnu.org/) ([Winlibs](https://winlibs.com/))
  - [MSVC](https://visualstudio.microsoft.com/vs/community/)
- **Debugger**
  - [Gdb](https://www.sourceware.org/gdb/) ([Winlibs](https://winlibs.com/))
  - [Windbg](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/)
- **IDE**
  - [Vim](https://www.vim.org/)
  - [VSCodium](https://vscodium.com/)
- **Language**
  - [C/C++](<https://en.wikipedia.org/wiki/C_(programming_language)>) ([Visual Studio 2022 & SDK & WDK](https://learn.microsoft.com/en-us/windows-hardware/drivers/install-the-wdk-using-winget))
  - [Rust](<https://en.wikipedia.org/wiki/Rust_(programming_language)>) ([Rustup](https://rustup.rs/))
- **Security**
  - [HEVD](https://github.com/hacksysteam/HackSysExtremeVulnerableDriver)
  - [RedEdr](https://github.com/dobin/RedEdr)
- **Misc**
  - [Git](https://git-scm.com/downloads)
  - [MinGW](http://mingw-w64.org/) ([Winlibs](https://winlibs.com/))
  - [OSRLoader](https://www.osronline.com/article.cfm%5earticle=157.htm)
  - [Sysinternals](https://learn.microsoft.com/en-us/sysinternals/)

## Credits

- [Microsoft](https://learn.microsoft.com/en-us/windows-hardware/drivers)
- [Novafacing](https://novafacing.github.io/practical-fuzzing/libfuzzer/kernel/windows/index.html)
