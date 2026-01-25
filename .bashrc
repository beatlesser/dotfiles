#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ -n $PS1 ]] || return

[[ -f "$HOME/.config/bash/alias.bash" ]] && . "$HOME/.config/bash/alias.bash"
[[ -f "$HOME/.config/bash/env.bash" ]] && . "$HOME/.config/bash/env.bash"
[[ -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[ -x "$(command -v starship)" ] && eval "$(starship init bash)"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"

