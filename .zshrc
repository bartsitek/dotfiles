export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

export PATH=$PATH:$HOME/bin

# Make sure vim is default editor
export EDITOR=vim
export TERM=xterm-256color

EDITOR=/usr/local/bin/vim
GIT_MERGE_AUTOEDIT=no # Disable opening the editor when merging

# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/custom/themes
# Color Debugging: spectrum_ls
ZSH_THEME="gerty"

# Get out of my face with your updates
DISABLE_UPDATE_PROMPT=true

# Base16 Shell Truecolor Support
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

######################################
# BASH PLUGINS

BASH_PLUGINS=(
  "rvm"
  "nvm"
  "avn"
  "go"
  "tmux"
)

for plugin in "${BASH_PLUGINS[@]}"; do
  plugin_path="$HOME/.bash.d/${plugin}"
  test -f $plugin_path && source $plugin_path
done

######################################
# ALIASES

alias resume='tmux attach'
alias gitg='tig status'
alias meld='noglob git meld -'
alias git='noglob git'
alias fetch='noglob git fetch'
alias fluff='source ~/.zshrc && source ~/.zshenv' # && source ~/.zprofile'
alias irssi='TERM=screen-256color irssi'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Configs
alias nconf='sudo vim /usr/local/etc/nginx/nginx.conf'
alias sconf='vim ~/.ssh/config'
alias zconf='vim ~/.zshrc'
alias econf='vim ~/.zshenv'
alias gconf='vim ~/.gitconfig'
alias hconf='sudo vim /etc/hosts'
alias ipconf='sudo vim /etc/ppp/ip-up'
alias vconf='vim ~/.SpaceVim.d/init.vim'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;'
alias flushdns='sudo ifconfig en0 down && \
                sudo ifconfig en0 up && \
                sudo dscacheutil -flushcache; \
                sudo killall -HUP mDNSResponder; \
                sudo scutil --set ComputerName "BartPro"'

# alias gdiff='git diff -U0 | grep "^[+-]" | grep -Ev "^(--- a/|\+\+\+ b/)" | pbcopy'
alias gdiff='git diff | tail -n +6 | pbcopy'

######################################
# TERMINAL

# Separate history for each tab
# HISTFILE=~/.history

SAVEHIST=10000
HISTSIZE=10000

unsetopt inc_append_history
unsetopt share_history
setopt append_history
setopt hist_ignore_dups    # Don't store sequential duplicate lines
setopt hist_find_no_dups   # Don't cycle through dupes during history search
setopt hist_reduce_blanks  # Trim before saving
setopt hist_no_store       # Don't save invocation of history itself
setopt hist_no_functions   # Don't save ZSH function definitions
# setopt no_hist_verify # Skip substitution confirmations.

######################################
# CUSTOMIZATIONS

# OSX word jumping
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# https://github.com/gnunn1/tilix/issues/1593
stty ixany
stty ixoff -ixon

# Colors for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# OH-MY-ZSH
ME="$(whoami)"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow github ssh-agent brew osx tmux tmuxinator kubectl)
#plugins=(git git-flow github ssh-agent brew osx tmux tmuxinator kubectl completion zsh)

source $ZSH/oh-my-zsh.sh
