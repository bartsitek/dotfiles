#!/bin/bash

######################################
# COLORS

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

######################################
# GUI

function header() {
  echo -e " 🗃   ${COL_YELLOW}dotfiles${COL_RESET} by BΛRT SITΞK"
  echo -en "     https://github.com/brtstk/dotfiles"
}

######################################
# STATUSES

function ok() {
  echo -en "${COL_GREEN}[ok]${COL_RESET} "$1
}

function warn() {
  echo -e "\n${COL_YELLOW}[!]${COL_RESET}  "$1
}

function warnn() {
  echo -e "\n\n${COL_YELLOW}[!]${COL_RESET}  "$1
}

function err() {
  echo -e "${COL_RED}[x]${COL_RESET}  "$1
}

function info() {
  echo -e "\n\n${COL_BLUE}[i]${COL_RESET}  "$1
}

# To be used with statuses above
function run() {
  echo -en "\n-->  "$1" "
}

# To be used on it's own
function runn() {
  echo -e "\n-->  "$1" "
}

function write() {
  echo -e "     "$1" "
}

function writen() {
  echo -e "\n     "$1" "
}

######################################
# ACTIONS

function getsudo() {
  # Might as well ask for password up-front, right?
  sudo -v
  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

# link "~/Secrets/dotfiles/ip-up" "/etc/ppp/ip-up"
# link "gerty.zsh-theme" "~/.oh-my-zsh/custom/themes/gerty.zsh-theme"
function link() {
  local SOURCE=$1
  local TARGET=$2
  # local TARGET_FILE=$(echo $TARGET | sed 's:.*/::')

  # Back up target
  if [[ -e $TARGET || -d $TARGET || -L $TARGET ]]; then
    mkdir -p ~/.dotfiles_backup/${DOTFILES_START}
    sudo rsync -L $TARGET ~/.dotfiles_backup/${DOTFILES_START}/ &> /dev/null;
  fi

  # Remove target
  sudo rm -rf ${TARGET}

  # Symlink
  sudo ln -sfn ${SOURCE} ${TARGET}
}
