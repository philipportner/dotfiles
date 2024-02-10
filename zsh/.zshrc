# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/Users/philipportner/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
alias ctags='/usr/local/bin/ctags'

ZSH_THEME="powerlevel10k/powerlevel10k"

COLORTERM="truecolor"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  autojump
  git
  github
  sudo
  zsh-syntax-highlighting
  vi-mode
  zsh-autosuggestions
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

export EDITOR=/opt/homebrew/bin/nvim
# export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/'

alias nv="nvim"
alias grh="git reset --hard"
alias gg="git grep -iG"
alias gstns="git status --ignore-submodules"
alias gl="git lg"
alias ls='exa'
alias tm="tmux"
alias t1='exa -T -L 1 -a'
alias t2='exa -T -L 2 -a'
alias t3='exa -T -L 3 -a'
alias 001='ssh so001'
alias 005='ssh so005'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/**"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#export SYSTEMDS_ROOT=/home/phil/Documents/systemds
#export PATH=$SYSTEMDS_ROOT/bin:$PATH
#export NNN_PLUG='f:fzopen;p:mocplay;d:diffs;t:nmount;v:feh;j:autojump'
#export BAT_THEME="gruvbox-dark"
#export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#4d4d4c,bg:#ffffff,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
# export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/Users/philipportner/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin/:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/homebrew/Cellar/libevent/2.1.12_1/lib/"
