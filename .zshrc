autoload -U colors && colors
PROMPT="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M:%{$fg[magenta]%}%~%{$reset_color%}%#%b "

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

export EDITOR=vim
export PAGER=less
export BLOCKSIZE=K
export CLICOLOR=yes
export JAVA_HOME=/usr/local/openjdk11
export JAVA_VERSION=11

alias h="history 25"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -FA"
alias ll="ls -lA"

typeset -U path
path=(/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin $HOME/.local/bin)
mailpath=(/var/mail)

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# HOME : go to the beginning of the line.
bindkey "^[[7~" beginning-of-line
bindkey "^[[H" beginning-of-line
# END : go to the end of the line.
bindkey "^[[8~" end-of-line
bindkey "^[[F" end-of-line

if [[ -n $?TERM ]]; then
    if [[ $TERM == "xterm" ]]; then
	bindkey "^[[3~" backward-delete-char
	bindkey "^?" delete-char
    fi
    if [[ $TERM == "rxvt" ]] then
	bindkey "^[[3~" delete-char
	bindkey "^?" backward-delete-char
    fi
fi

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

