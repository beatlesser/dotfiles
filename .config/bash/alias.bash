#!/usr/bin/env bash

if [[ -x $(command -v eza) ]] ; then
    alias ls='eza --icons=always'
    alias la='eza --all --icons=always'
    alias lt='eza --tree --icons=always'
    alias l='eza --long --all --icons=always'
fi

[[ -x $(command -v yazi) ]] && alias yz='yazi'

alias vi='nvim'
alias lns='ln -sfnT'
alias zz='z -'
