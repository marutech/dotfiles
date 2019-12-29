#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && (tmux attach || tmux new-session)

# key bind
set -o vi

# aliases
alias ls='ls --color=auto'
alias ll='ls -hl'
alias la='ll -a' 
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# colorized man page
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# prompt style settings
function add_empty_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

PROMPT_COMMAND='add_empty_line'
PS1='\[$(if [[ $? -eq 0 ]]; then echo "$(tput setaf 40)"; else echo "$(tput setaf 196)"; fi;)\][\u \w]\$\[$(tput sgr0)\] '

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# nvm setting
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# IBus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
