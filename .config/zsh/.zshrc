autoload -U colors && colors

stty stop undef
setopt no_nomatch

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
setopt PROMPT_SUBST

THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ'}

THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line

zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

PROMPT='%B%{$fg[red]%}[%{$fg[magenta]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%b%(?.%F{green}$THEME_VI_MODE_SYMBOL.%F{red}$THEME_VI_MODE_SYMBOL)%{$reset_color%} '

setopt extendedGlob

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE='2000'
SAVEHIST='1000'

# ignore duplicate in history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups

DIRSTACKSIZE='20'

setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups
setopt pushd_minus


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f $XDG_CONFIG_HOME/.dircolors ]; then
	eval "$(dircolors -b $XDG_CONFIG_HOME/.dircolors)"
fi

if [ -f $XDG_CONFIG_HOME/shell/aliasrc ]; then
    . $XDG_CONFIG_HOME/shell/aliasrc
fi

# FZF Section
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fdfind --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -f $HOME/.fzf/fzf.zsh ]; then
	. $HOME/.fzf/fzf.zsh
fi

# NNN
if [ -f $XDG_CONFIG_HOME/nnn/nnn.bash ]; then
	. $XDG_CONFIG_HOME/nnn/nnn.bash
fi

neofetch

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f $XDG_DATA_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	. $XDG_DATA_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

