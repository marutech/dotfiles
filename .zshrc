# attach a tmux session when it exists, otherwise create a new tmux session
if type tmux >/dev/null 2>&1; then
    [[ -z $TMUX ]] && (tmux attach || tmux new-session)
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# set key bind like vi
bindkey -v

zstyle :compinstall filename '/home/koki/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit

prompt fade

# add nvm path and settigns
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
