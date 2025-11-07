#! /usr/bin/env fish
alias cl 'clear'

[ -n $(command -v nvim) ] && alias vi 'nvim'

[ -n $(command -v lsd) ] && alias ls 'lsd'

alias la 'ls -ha'
alias ll 'ls -hla'

[ -n $(command -v zoxide) ] && alias zz 'z -'
