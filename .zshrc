# attach a tmux session when it exists, otherwise create a new tmux session
if type tmux >/dev/null 2>&1; then
    [[ -z $TMUX ]] && (tmux attach || tmux new-session)
fi

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# keymaps
bindkey -v

# completion
zstyle :compinstall filename '/home/koki/.zshrc'
autoload -Uz compinit
compinit

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{109}%K{109}'
zstyle ':vcs_info:*' unstagedstr '%F{214}%K{214}' # yellow
zstyle ':vcs_info:*' formats '%K{142}%c%u%F{239}%c%u%F{237} %b %F{142}%c%u%k%f '
zstyle ':vcs_info:*' actionformats '%K{167}%c%u%F{239}%c%u%F{237} %b %F{167}%c%u%k%f '
zstyle ':vcs_info:*' nvcsformats '%F{239} '
precmd () { vcs_info }
setopt prompt_subst
PS1='%B%F{237}%K{248} %n %F{248}%K{239}%F{223} %~ %k${vcs_info_msg_0_}%k%f
%(?.%F{142}.%F{167})>%f %b'
#

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# zsh-syntax-height
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
