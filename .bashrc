umask 0077

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

stty start undef

export PROMPT_DIRTRIM=2

PS1="\[\033[1;33m\][\[\033[1;35m\]\u\[\033[1;32m\]@\[\033[1;36m\]\h\[\033[1;37m\]:\[\033[1;33m\]\w]\[\033[0m\] "

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable globbing hidden/dot files (.filename).
shopt -s dotglob

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable colors
if  [ -f ~/.config/dircolors ]; then
    eval "`dircolors -b ~/.config/dircolors`"
fi


if [ -f ~/.config/shell/aliasrc ]; then
    . ~/.config/shell/aliasrc
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# fzf configs
[ -f ~/.local/src/fzf/fzf.bash ] && . ~/.local/src/fzf/fzf.bash
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="find -type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NNN
[ -f ~/.config/nnn/nnn.bash ] && . ~/.config/nnn/nnn.bash
