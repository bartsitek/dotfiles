# 🗃 dotfiles

This installs my **dotfiles™** on MacOS platform.

<!-- TOC -->

- [Setup Overview](#setup-overview)
- [Installation](#installation)
- [Architecture](#architecture)
- [Included Software](#included-software)
  - [Fonts](#fonts)
  - [Utils](#utils)
  - [Work](#work)

<!-- /TOC -->

# Setup Overview

```
🖥 OS:             MacOS
📺 Terminal/Shell: True Color (24-bit) iTerm2 w/ Oh My ZSH
📇 Keyboard:       FKBN87MC/EFB2 FILCO NINJA Tenkeyless, Mac remapped w/ Karabiner
```

# Installation

```
$ git clone git@github.com:brtstk/dotfiles.git
$ cd dotfiles
$ make [install]
$ make setup
```

# Architecture
This tool is running two steps:
- First it's *installing* all the necessary software.
- Then it's *setting* the system *up* with custom settings.

Here is the current architecture:

| Access Scope | Medium | Description |
| --- | --- | --- |
| Public | This Repo | Shareable configuration files |
| Private | Keybase | Secret configuration files |
| Volatile | Dropbox | Frequently changing configuration files (Sublime Text, iTerm etc.) |

⚠️ It is important to properly set up Dropbox and Keybase before running the setup step.\
This will set **Private and Volatile** configurations to run properly.

# Included Software
Here is a list of software installed by the tool:

## Fonts
- font-hack-nerd-font
- font-inconsolata
- font-inconsolata-nerd-font
- font-menlo-for-powerline

## Utils
- 1password
- bettertouchtool
- calibre
- carbon-copy-cloner
- cleanmymac
- cloudapp
- dropbox
- firefox
- flux
- google-chrome
- gpg-suite
- java
- kap
- karabiner-elements
- keybase
- mullvadvpn
- qbittorent
- skype
- slack
- spotify
- steam
- vlc

## Work
- cmake
- coreutils
- curl
- dive
- docker
- gd
- gnu-sed
- gnupg
- grep
- httpstat
- jpeg
- jq
- libssh2
- mkcert
- openssl
- pcre
- pngquant
- pssh
- readline
- rsync
- terraform
- tig
- tmux
- tree
- arduino
- cyberduck
- docker
- iterm2
- mongodb-compass
- ngrok
- p4merge
- postman
- sequel-pro
- sublime-text
- teamviewer
- vagrant
- virtualbox
