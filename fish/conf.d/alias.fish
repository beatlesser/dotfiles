#! /usr/bin/env fish
alias cls 'clear'

[ -n $(command -v nvim) ] && alias vi 'nvim'

if [ -n $(command -v eza) ] 
    alias ls 'eza --icons=always'
    alias la 'eza --all --icons=always'
    alias lt 'eza --tree --icons=always'
    alias l 'eza --long --all --icons=always'
end

[ -n $(command -v zoxide) ] && alias zz 'z -'
