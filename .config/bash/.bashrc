#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ -n $PS1 ]] || return


# Flyline - enhanced Bash experience
[ -f $HOME/.local/lib/libflyline.so ] && enable -f /home/tql/.local/lib/libflyline.so flyline

for f in $HOME/.config/bash/conf.d/*; do [ -f "$f" ] && . "$f"; done

[[ -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"
[ -x "$(command -v fzf)" ] && eval "$(fzf --bash)"

