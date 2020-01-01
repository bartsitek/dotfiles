#!/bin/bash
set -e

function wait_for_input() {
  echo -e "\n⚠️   $1\n"
  read -rsn1 -p "    Press any key to continue ..."; echo
}

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

# Symlink dotfiles
ln -sfn $(PWD)/.bash.d ~/.bash.d
ln -sfn $(PWD)/.zshrc ~/.zshrc
ln -sfn $(PWD)/gerty.zsh-theme ~/.oh-my-zsh/custom/themes/gerty.zsh-theme
ln -sfn $(PWD)/SpaceVim.init.vim ~/.SpaceVim.d/init.vim

# Wait for KeyBase setup
wait_for_input "Make sure that KeyBase is set up before continuing!"

# Set up secret dotfiles
mkdir -p ~/Secrets
if [[ ! -d ~/Secrets/dotfiles ]]; then
  cd ~/Secrets && git clone keybase://private/brtstk/dotfiles
fi

# Symlink secret dotfiles
sudo rm -rf /etc/hosts && sudo ln -sfn ~/Secrets/dotfiles/hosts /etc/hosts
sudo rm -rf /etc/ppp/ip-up && sudo ln -sfn ~/Secrets/dotfiles/ip-up /etc/ppp/ip-up
rm -rf ~/.ssh && ln -sfn ~/Secrets/dotfiles/.ssh ~/.ssh
rm -rf ~/.zshenv && ln -sfn ~/Secrets/dotfiles/.zshenv ~/.zshenv

# Source
/bin/zsh -i -c "source ~/.zshrc" && \
/bin/zsh -i -c "source ~/.zshenv" && \
echo -e "ZSH config reloaded!"
