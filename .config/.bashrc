# If not running interactively, don't do anything
[[ -n $PS1 ]] || return

PS1='\e[38;5;45m\w\e[00m \e[01;33m> \e[00m'

# flyline
enable -f /usr/local/lib/bash/libflyline.so flyline
flyline set-cursor --backend terminal

# env
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL=$EDITOR
export HISTSIZE=5000
export HISTFILESIZE=5000

# alias
if [[ -x $(command -v eza) ]] ; then
    alias ls='eza --icons=always'
    alias la='eza --all --icons=always'
    alias lt='eza --tree --icons=always'
    alias l='eza --long --header --all --icons=always'
fi

[[ -x $(command -v yazi) ]] && alias yz='yazi'

alias vi='nvim'
alias zz='z -'

[[ -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion


[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"
[ -x "$(command -v fzf)" ] && eval "$(fzf --bash)"

