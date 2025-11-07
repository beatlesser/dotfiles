#! /usr/bin/env zsh
if [[ -n $(command -v lsd) ]]; then
    alias ls='lsd'
    alias la='lsd -ha'
    alias ll='lsd -hla'
fi

[[ -n $(command -v nvim) ]] && alias vi='nvim'

alias cl='clear'
