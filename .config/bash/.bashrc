#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$HOME/.config/bash/alias.bash" ] && source "$HOME/.config/bash/alias.bash"

[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

[ -f "$HOME/.local/share/blesh/ble.sh" ] && source "$HOME/.local/share/blesh/ble.sh"

[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"
[ -x "$(command -v tv)" ] && eval "$(tv init bash)"
[ -x "$(command -v bat)" ] && export BAT_THEME="Catppuccin-mocha"
# [ -x "$(command -v starship)" ] && eval "$(starship init bash)"

