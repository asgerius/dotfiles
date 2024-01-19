export HOSTNAME=$(cat /proc/sys/kernel/hostname)

. ~/environment-setup/zsh/functions

autoload -Uz compinit promptinit
compinit
promptinit

# Allow comments with hastags
setopt interactivecomments

# Plugins
source ~/environment-setup/zsh/.zsh_plugins.sh

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

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ];
then
	export PATH=$PATH:$PYENV_ROOT/bin
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# Stuff thats different on hpc and elsewhere
if [[ $HOSTNAME == *"gbarlogin2"* || $HOSTNAME == *"gbarlogin1"* || $HOSTNAME == *"hpclogin1"* || $HOSTNAME == *"hpclogin1"* || $HOSTNAME == *"n-62-12-19"* || $HOSTNAME == *"n-62-20-1"* || $HOSTNAME == *"n-62-20-9"* ]];
then
	source ~/.hpcrc
	export LANG=da_DK.UTF8
else
	alias pip="python -m pip"
	# https://stackoverflow.com/questions/30000008/how-can-i-change-gnucash-ui-language
	export LANG=da_DK.UTF-8
	export LANGUAGE=da_DK.UTF-8
fi
alias pytest="python -m pytest"
alias jupyter="python -m jupyter lab"


# https://unix.stackexchange.com/questions/264632/what-is-the-correct-way-to-view-your-cpu-speed-on-linux
alias cpuspeed='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
alias ugenr="curl -s https://ugenr.dk/ | grep -o -P -m 1 '(?=Uge).*(?=starter)'"

alias src="source ~/.zshrc"
alias plugins="antibody bundle < ~/environment-setup/zsh/zsh_plugins.txt > ~/environment-setup/zsh/.zsh_plugins.sh"
alias novideo-smi='watch -n.1 "/opt/rocm/bin/rocm-smi"'

# Remote stuff
alias hpc="ssh login2.gbar.dtu.dk -l s183912"
alias hpc1="ssh login1.gbar.dtu.dk -l s183912"
alias hpc-fs="sshfs s183912@login2.gbar.dtu.dk:/zhome/d3/f/137655 ~/hpc"
alias hpc-fs-work3="sshfs s183912@login2.gbar.dtu.dk:/work3/s183912 ~/hpc-work3"
