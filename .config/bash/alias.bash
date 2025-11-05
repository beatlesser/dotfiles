#!/usr/bin/env bash

if [[ -x $(command -v lsd) ]]; then
    alias ls='lsd'
    alias la='lsd -ha'
    alias ll='lsd -hla'
fi

alias vi='nvim'

alias cls='clear'
