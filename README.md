# Styx

![image](https://upload.wikimedia.org/wikipedia/commons/6/6b/Lytovchenko_Olexandr_Kharon.jpg)

## Table of content

- [Requirements](https://github.com/MikeHorn-git/Styx#requirements)
- [Plugins](https://github.com/MikeHorn-git/Styx#plugins)
- [Installation](https://github.com/MikeHorn-git/Styx#installation)
- [Features](https://github.com/MikeHorn-git/Styx#features)
- [ToDo](https://github.com/MikeHorn-git/Styx#todo)
- [Credits](https://github.com/MikeHorn-git/Styx#credits)

## Requirements

- Vagrant
- Virtualbox

## Plugins

- vagrant-reload

## Installation

```bash
git clone https://github.com/MikeHorn-git/WKD
cd WKD
vagrant up
```

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
- **Misc**
  - [Git](https://git-scm.com/downloads)
  - [HEVD](https://github.com/hacksysteam/HackSysExtremeVulnerableDriver)
  - [MinGW](http://mingw-w64.org/) ([Winlibs](https://winlibs.com/))
  - [Sysinternals](https://learn.microsoft.com/en-us/sysinternals/)

## Todo

- [ ] Support Vmware

## Credits

- [Practical Fuzzing](https://novafacing.github.io/practical-fuzzing/libfuzzer/kernel/windows/index.html)
- [Windows Drivers](https://learn.microsoft.com/en-us/windows-hardware/drivers)
