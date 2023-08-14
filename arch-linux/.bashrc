#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias hx='helix'
alias ls='ls --color=auto'
alias ll='ls -halt'
alias ..="cd .."
alias grep='grep --color=auto'

# Shell customization
export PS1="\[$(tput bold)\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\t\[$(tput sgr0)\] \n\[$(tput sgr0)\]\[\033[38;5;7m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] > \[$(tput sgr0)\]"

export LSCOLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
# Different colors for different extensions
eval "$(dircolors)"

# Rust
. "$HOME/.cargo/env"

# Wezterm
alias wezterm="cd ~/dev/workflow/wezterm && cargo run --release --bin wezterm -- start"

# Make it easier to switch from macOS
alias open="xdg-open"

# Emacs
# -----------------------------------------------------------------------------
#
# Doom Emacs
if [ "$(echo "$PATH" | grep -c 'emacs/bin')" == 0 ]; then
    export PATH="$HOME/.config/emacs/bin:$PATH"
    alias emacsclient="emacsclient -c -a 'emacs'"
fi

# vterm integration
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'

# Created by `pipx` on 2023-07-29 14:32:42
export PATH="$PATH:/home/vv/.local/bin"
eval "$(register-python-argcomplete pipx)"
