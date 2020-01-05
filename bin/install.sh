#!/bin/bash
set -e

# Include helper functions
source ./bin/helpers.sh

header

info "Currently running \"Installation\" stage [1/2]"

######################################
# SUDO

# https://gist.github.com/cowboy/3118588
warn "This will require PRIVAC. Please enter your sudo password if prompted."
getsudo
ok "PRIVAC granted. Proceeding."

######################################
# INSTALL

info "Installing Tools and Packages"

# XCode Tools
if ! xcode-select --print-path &> /dev/null; then
  run "Installing XCode Tools ..."

  xcode-select --install &> /dev/null

  # Wait until the XCode Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  # Accept XCode Tools license
  sudo xcodebuild -license accept
  ok
fi

# Homebrew
runn "Installing Homebrew ..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle
ok

# OhMyZsh
runn "Installing Oh My Zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ok

# SpaceVim
runn "Installing SpaceVim ..."
curl -sLf https://spacevim.org/install.sh | bash
ok

# NVM
runn "Installing NVM ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install stable
nvm use stable
ok

# AVN
runn "Installing AVN ..."
npm install -g avn avn-nvm avn-n && avn setup
ok

######################################
# FINALIZE

# If all went well, mark as installed
touch ~/.dotfiles_installed

# Print further instructions
echo -e "\n\n"
info "Installation Stage Complete!"

warn  "This software takes 2 steps in order to complete the process."
write "Make sure that Dropbox and KeyBase are set up and then run:"
write "$ make setup"
