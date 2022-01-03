#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if tty1 then startx
if [ "$I3_RUNNING" != "1" ];then
	export I3_RUNNING="1";
	startx
else
	unset I3_RUNNING;
fi

# aliases
alias ls='ls --color=auto'
alias l='ls --color=auto -al'
alias ll='ls --color=auto -l'
alias la='ls --color=auto -a'
alias hostname='hostnamectl hostname'

# prompt
PS1='\$ '

# env
. "$HOME/.cargo/env"