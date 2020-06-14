export HOSTNAME=$(cat /proc/sys/kernel/hostname)

. ~/environment-setup/zsh/functions

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
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename "/home/sorenwh/dotfiles/zsh/.zshrc"

# autoload -Uz compinit promptinit
# compinit
# promptinit

# End of lines added by compinstall

#
# Copied from bashrc 
#

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

export PYTHONPATH=${PYTHONPATH}:${HOME}/Desktop/rl-rubiks
export PYTHONBREAKPOINT="ipdb.set_trace"

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.android/avd

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/node/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$ENDLOSUNG:$PATH"
export PATH=$PATH:~/bin
export PATH="$PATH:`pwd`/flutter/bin"
export PATH="$HOME/android-studio/bin:$PATH"
export PATH="$HOME/cmdline-tools/tools/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Stuff thats different on hpc and elsewhere
if [ "$HOSTNAME" != "gbarlogin2" ];
then
	alias python="/usr/local/bin/python3"
	alias pip="/usr/local/bin/pip3"
	export LANG=C.UTF-8
else
	export LANG=da_DK.utf8
	module load python3/3.7.5
fi
alias src="~/environment-setup/start.sh && source ~/.zshrc"
alias close-emulator="rm -rf $HOME/.android/avd/flutterboi.avd/*.lock"
alias run-emulator="close-emulator ; flutter emulators --launch flutterboi"

alias psc="sc prog genveje"
alias ss="sc prog ss"
alias itu="sc prog itu"
alias syrup="xmaple $DTU/Ahornsirup/utils_source.mw $DTU/Ahornsirup/syrup_source.mw"

alias hpc="ssh login2.gbar.dtu.dk -l s183912 -t 'exec zsh'"
alias maple="~/maple2019/bin/maple"
alias xmaple="setsid ~/maple2019/bin/xmaple"
alias matlab="setsid $HOME/Matlab/R2019b/bin/matlab"
alias pycharm="setsid $HOME/pycharm/bin/pycharm.sh . > /dev/null 2>&1 &"
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

