export HOSTNAME=$(cat /proc/sys/kernel/hostname)

. ~/environment-setup/zsh/functions

autoload -Uz compinit promptinit
compinit
promptinit

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

#export LANG=en_US.UTF-8

NEXTCLOUD=$HOME/Nextcloud
DTU=$NEXTCLOUD/DTU
ENDLOSUNG=$HOME/Desktop/latex-utilities

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

export PATH=$PATH:~/Desktop/main

export PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

export ALPHAVANTAGE_API_KEY=FQSLCXLX5610F802

# export ANDROID_SDK_ROOT=$ANDROID_HOME
# export ANDROID_PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
# # export FLUTTER=$BASE_DIR/bin
# export PATH=$PATH:$ANDROID_PATH

# if [ -d "$HOME/platform-tools" ] ; then
#   export PATH="$HOME/platform-tools:$PATH"
# fi

# Stuff thats different on hpc and elsewhere
if [ "$HOSTNAME" != "gbarlogin2" ];
then
	# alias python="/usr/local/bin/python3"
	# alias pip="/usr/local/bin/pip3"
	if command -v pyenv 1>/dev/null 2>&1;
	then
		eval "$(pyenv init -)"
		alias pip="python -m pip"
		# pyenv shell 3.9.1
	fi
	# https://stackoverflow.com/questions/30000008/how-can-i-change-gnucash-ui-language
	export LANG=da_DK.UTF-8
	export LANGUAGE=da_DK.UTF-8
else
	export LANG=da_DK.UTF8
	module load python3/3.8.4
	module load gcc/9.2.0
        source /.bashrc
fi
alias start="~/environment-setup/start.sh"
alias src="source ~/.zshrc"
alias close-emulator="rm -rf $HOME/.android/avd/flutterboi.avd/*.lock"
alias run-emulator="close-emulator ; flutter emulators --launch flutterboi"

alias psc="sc prog genveje"
alias ss="sc prog ss"
alias itu="sc prog itu"
alias syrup="xmaple $DTU/Ahornsirup/utils_source.mw $DTU/Ahornsirup/syrup_source.mw"

alias maple="~/maple2020/bin/maple"
alias xmaple="setsid ~/maple2020/bin/xmaple"
alias matlab="setsid $HOME/MATLAB/R2020a/bin/matlab > /dev/null 2>&1 &"
alias pycharm="setsid /usr/local/bin/charm . > /dev/null 2>&1 &"
alias intellij="setsid $HOME/intellij/bin/idea.sh . > /dev/null 2>&1 &"
alias android="setsid studio.sh . > /dev/null 2>&1 &"
alias caprine="setsid snap run caprine > /dev/null 2>&1 &"
alias heroku="snap run heroku"

alias ksp="setsid $HOME/KSP_linux/KSP.x86_64"

alias nc="~/Nextcloud"

alias dtu="$DTU"
alias psyrup="$DTU/Ahornsirup"

alias prog="$NEXTCLOUD/Programmering"
alias pitu="$NEXTCLOUD/Programmering/indian-tech-support"
alias endlosung="$HOME/Desktop/EndLosung"

alias ugenr="curl -s https://ugenr.dk/ | grep -o -P -m 1 '(?=Uge).*(?=starter)'"
alias plugins="antibody bundle < ~/environment-setup/zsh/zsh_plugins.txt > ~/environment-setup/zsh/.zsh_plugins.sh"

# https://unix.stackexchange.com/questions/264632/what-is-the-correct-way-to-view-your-cpu-speed-on-linux
alias cpuspeed='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'

# Remote stuff
alias hpc="ssh login2.gbar.dtu.dk -l s183912 -t 'exec zsh'"

export raspberry_ip=10.11.131.105
alias rasp="ssh pi@$raspberry_ip -t 'exec zsh'"
alias setrasp="sshfs -o allow_other,default_permissions pi@$raspberry_ip:/ ~/raspberry"


