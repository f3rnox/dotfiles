# shellcheck disable=SC1090
#
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ $HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin: ]]; then
    PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(zoxide init bash)"
source ~/.bash-powerline.sh

alias ll='ls -alh'
alias ..='cd ..'
alias ~='cd ~'
alias c='clear'
alias x='exit'
