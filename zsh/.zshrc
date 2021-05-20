# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/home/phil/.oh-my-zsh
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.platformio/penv/bin

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="common"

COLORTERM="truecolor"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  autojump
  git
  github
  sudo
  zsh-syntax-highlighting
  vi-mode
  history-substring-search
  zsh-autosuggestions
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

export EDITOR=/usr/bin/nvim
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/'

alias nv="nvim5"
alias gits="git status"
alias grh="git reset --hard"
alias ls='ls --color'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export SYSTEMDS_ROOT=/home/phil/Documents/systemds
export PATH=$SYSTEMDS_ROOT/bin:$PATH
export NNN_PLUG='f:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview;j:autojump'
export BAT_THEME="Solarized (dark)"
# export MANPAGER="/usr/bin/nvim5 -M +MANPAGER -"
export NVM_DIR="$HOME/.nvm"
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  # Solarized Light color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  # "
}
_gen_fzf_default_opts
