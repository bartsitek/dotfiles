#!/bin/bash
set -e

# Include helper functions
source ./bin/helpers.sh

header

info "Currently running \"Setup\" stage [2/2]"

######################################
# PREPARE

# Check [1/2] completion
run "Checking Installation ..."
if [[ ! -f ~/.dotfiles_installed ]]; then
  err && write "Installation step did not run or has failed?"
  exit
fi
ok

# Set script running start time for backup, symlinking etc.
export DOTFILES_START=$(date +"%Y%m%d%H%M%S")

######################################
# SUDO

# https://gist.github.com/cowboy/3118588
warnn "This will require PRIVAC. Please enter your sudo password if prompted."
getsudo
ok "PRIVAC granted. Proceeding."

######################################
# SYMLINK SECRETS

info "Backups will be saved in ~/.dotfiles_backup/${DOTFILES_START}/"

mkdir -p ~/Secrets
if [[ ! -d ~/Secrets/dotfiles ]]; then
  run "Symlinking Secrets ..."
  cd ~/Secrets && git clone keybase://private/brtstk/dotfiles &> /dev/null
  ok
fi

run "Symlinking Secrets ..."
link ~/Secrets/dotfiles/hosts /etc/hosts
link ~/Secrets/dotfiles/ip-up /etc/ppp/ip-up
link ~/Secrets/dotfiles/.ssh ~/.ssh
link ~/Secrets/dotfiles/.zshenv ~/.zshenv
ok

######################################
# SYMLINK DOTFILES

run "Symlinking Dotfiles ..."
link $(PWD)/.bash.d ~/.bash.d
link $(PWD)/.zshrc ~/.zshrc
link $(PWD)/gerty.zsh-theme ~/.oh-my-zsh/custom/themes/gerty.zsh-theme
link $(PWD)/SpaceVim.init.vim ~/.SpaceVim.d/init.vim
ok

######################################
# SET UP ITERM2

run "Setting Up iTerm2 ..."
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Dropbox/Synced/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
ok

######################################
# RELOAD SHELL

run "Reloading Shell ..."
/bin/zsh -i -c "source ~/.zshrc" && \
/bin/zsh -i -c "source ~/.zshenv"
ok

info "Setup Complete!"
