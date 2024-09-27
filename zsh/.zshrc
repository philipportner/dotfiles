# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/home/philipportner/.oh-my-zsh
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.platformio/penv/bin
export PYTHONPATH="$PYTHONPATH:$PWD/src/:/usr/lib/llvm-10/build/utils/lit/"
export PATH=$PATH:/home/philipportner/.fzf/bin/
export PATH=$PATH:/home/philipportner/daphne/thirdparty/build/llvm-project/bin/

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

export EDITOR=/usr/bin/nvim
# export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/'

alias nv="nvim"
alias grh="git reset --hard"
alias gg="git grep -iG"
alias gstns="git status --ignore-submodules"
alias ggtd="git grep 'TODO(phil)'"
alias gl="git log --oneline"
alias tm="tmux"
alias gcf="git-clang-format"
# alias t1='exa -T -L 1 -a'
# alias t2='exa -T -L 2 -a'
# alias t3='exa -T -L 3 -a'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/**"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export SYSTEMDS_ROOT=/home/philipportner/Documents/systemds
export PATH=$SYSTEMDS_ROOT/bin:$PATH
export NNN_PLUG='f:fzopen;p:mocplay;d:diffs;t:nmount;v:feh;j:autojump'
export BAT_THEME="gruvbox-dark"
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#4d4d4c,bg:#ffffff,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
