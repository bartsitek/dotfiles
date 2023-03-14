# gerty.zsh-theme

# Based on https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/bira.zsh-theme

# You can set your computer name in the ~/.box-name file if you want.

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

local nodev=""
if [[ $(node -v) > /dev/null ]]; then
  nodev='%{$FG[239]%}running%{$FG[245]%} ‹$(node -v)/$(npm -v)›%{$reset_color%}'
fi

local box_at=""
if [[ $(hostname -s) != 'BartPro' ]]; then
  box_at=" %{$FG[239]%}@%{$reset_color%} %{$BG[214]%}%{$FG[000]%}$(box_name)%{$reset_color%}"
fi

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

# local prompt_start="%{$FG[239]%}╭─%{$reset_color%} %{$FG[214]%}%n%{$reset_color%}"
local prompt_start="%{$FG[239]%}╭─%{$reset_color%} %{$FG[214]%}$(id -F)%{$reset_color%}"
local prompt_rest="%{$FG[239]%}in%{$reset_color%} %{$FG[214]%}${current_dir}%{$reset_color%}${git_info} ${nodev} "
local prompt_end="%{$FG[239]%}╰─${prompt_char} %{$reset_color%}"

PROMPT="${prompt_start}${box_at} ${prompt_rest}
${prompt_end}"

# ZSH CONFIG
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[239]%} on%{$reset_color%} %{$FG[245]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[214]%} ✘"
# ZSH_THEME_GIT_PROMPT_UNTRACKED=" ?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
