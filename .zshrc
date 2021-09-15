export HOSTNAME=$(cat /proc/sys/kernel/hostname)

. ~/environment-setup/zsh/functions

autoload -Uz compinit promptinit
compinit
promptinit

# Allow comments with hastags
setopt interactivecomments

#Plugins
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


#Don"t do anything in non-interactive
[[ $- != *i* ]] && return

# Python stuff
export PYTHONBREAKPOINT="ipdb.set_trace"

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

export PYTHONPATH=$PYTHONPATH:~/Desktop/pyaccount
export PYTHONPATH=$PYTHONPATH:~/Desktop/symbolic-ai/searchclient
export PYTHONBREAKPOINT="ipdb.set_trace"

export ANDROID_HOME=~/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
# export ANDROID_AVD_HOME=~/.android/avd

export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/node/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$ENDLOSUNG
export PATH=$PATH:~/bin

export PATH=$PATH:~/flutter/bin
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.pub-cache/bin

if command -v pyenv 1>/dev/null 2>&1;
then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH=$PATH:$PYENV_ROOT/bin
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
fi

# export ANDROID_SDK_ROOT=$ANDROID_HOME
# export ANDROID_PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
# # export FLUTTER=$BASE_DIR/bin
# export PATH=$PATH:$ANDROID_PATH

# if [ -d "$HOME/platform-tools" ] ; then
#   export PATH="$HOME/platform-tools:$PATH"
# fi

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
alias jupyter="python -m jupyter lab"

alias src="source ~/.zshrc"
alias close-emulator="rm -rf $HOME/.android/avd/flutterboi.avd/*.lock"
alias run-emulator="close-emulator ; flutter emulators --launch flutterboi"

alias xmaple="setsid ~/maple2020/bin/xmaple"
alias matlab="setsid $HOME/MATLAB/R2020a/bin/matlab > /dev/null 2>&1 &"
alias pycharm="setsid /usr/local/bin/charm . > /dev/null 2>&1 &"
alias intellij="setsid $HOME/intellij/bin/idea.sh . > /dev/null 2>&1 &"
alias android="setsid studio.sh . > /dev/null 2>&1 &"

alias pitu="$NEXTCLOUD/Programmering/indian-tech-support"

alias ugenr="curl -s https://ugenr.dk/ | grep -o -P -m 1 '(?=Uge).*(?=starter)'"
alias plugins="antibody bundle < ~/environment-setup/zsh/zsh_plugins.txt > ~/environment-setup/zsh/.zsh_plugins.sh"

# https://unix.stackexchange.com/questions/264632/what-is-the-correct-way-to-view-your-cpu-speed-on-linux
alias cpuspeed='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'

# Remote stuff
alias hpc="ssh login2.gbar.dtu.dk -l s183912"
alias hpc1="ssh login1.gbar.dtu.dk -l s183912"
alias hpc-fs="sshfs s183912@login2.gbar.dtu.dk:/zhome/d3/f/137655 ~/hpc"
alias hpc-fs-work3="sshfs s183912@login2.gbar.dtu.dk:/work3/s183912 ~/hpc-work3"
