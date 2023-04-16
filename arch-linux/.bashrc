#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias hx='helix'
alias ls='ls --color=auto'
alias ll='ls -halt'
alias grep='grep --color=auto'

# Shell customization
export PS1="\w \[$(tput sgr0)\]\[\033[38;5;195m\]\t\[$(tput sgr0)\]\n\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/') >\[$(tput sgr0)\] "
export LSCOLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
# Different colors for different extensions
eval "$(dircolors)"
