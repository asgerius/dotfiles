export HOSTNAME=$(cat /proc/sys/kernel/hostname)

. ~/dotfiles/zsh/functions

autoload -Uz compinit promptinit
compinit
promptinit

# Allow comments with hastags
setopt interactivecomments

# Plugins
source ~/dotfiles/zsh/.zsh_plugins.sh

# Lines configured by zsh-newuser-install
HISTSIZE=2000
SAVEHIST=3000
bindkey -v
HISTFILE=~/.zsh_history
PROMPT_COMMAND='history -a'
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


# Don't do anything in non-interactive
[[ $- != *i* ]] && return

# Completion
zstyle ":completion:*" menu select
zstyle ":completion::complete:*" gain-privileges 1
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

# Cd
setopt AUTO_CD
setopt PUSHDMINUS

# create a widget from `my-accept-line" with the same name
zle -N my-accept-line
# rebind Enter, usually this is `^M"
bindkey "^M" my-accept-line
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(my-accept-line)

export GIT_EDITOR=nano

# Pytorch on AMD
export HSA_OVERRIDE_GFX_VERSION=10.3.0
export PYTHONBREAKPOINT="ipdb.set_trace"

export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ];
then
	export PATH=$PATH:$PYENV_ROOT/bin
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

alias pip="python -m pip"
alias pytest="python -m pytest"
alias jupyter="python -m jupyter lab"

# https://unix.stackexchange.com/questions/264632/what-is-the-correct-way-to-view-your-cpu-speed-on-linux
alias cpuspeed='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
alias ugenr="curl -s https://ugenr.dk/ | grep -o -P -m 1 '(?=Uge).*(?=starter)'"

alias src="source ~/.zshrc"
alias plugins="antibody bundle < ~/dotfiles/zsh/zsh_plugins.txt > ~/dotfiles/zsh/.zsh_plugins.sh"
alias novideo-smi='watch -n.1 "/opt/rocm/bin/rocm-smi"'
