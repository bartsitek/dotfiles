# 🗃 dotfiles

This installs my dotfiles on MacOS platform.

<!-- TOC -->

- [Installation](#installation)
- [Architecture](#architecture)
- [Software Installation](#software-installation)
  - [Fonts](#fonts)
  - [Utils](#utils)
  - [Work](#work)

<!-- /TOC -->

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
- Then it's *setting up* custom settings.

⚠️ It is important to properly set up Dropbox and Keybase before running the setup step.

Here is the current architecture:
- **Public Configurations:** This Repository
- **Private Configurations:** Keybase
- **Volatile Configurations** (Sublime Text, iTerm2 etc.): Dropbox

# Software Installation
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
- gitg
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
