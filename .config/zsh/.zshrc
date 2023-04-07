autoload -U colors && colors

stty stop undef
setopt no_nomatch

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

setopt PROMPT_SUBST

bindkey -e

PROMPT='%B%{$fg[red]%}[%{$fg[magenta]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%b '

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

