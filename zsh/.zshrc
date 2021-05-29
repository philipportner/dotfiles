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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#4d4d4c,bg:#eeeeee,hl:#b74951
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#b74951
    --color=info:#4271ae,prompt:#8959a8,pointer:#87005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
