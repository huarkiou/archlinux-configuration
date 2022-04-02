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
alias matlab='matlab -nodesktop -nosplash'

# prompt
PS1='\$ '

# env
export GOPROXY=https://goproxy.cn,direct
export PATH="$(yarn global bin):$PATH"

