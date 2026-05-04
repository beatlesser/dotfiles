#!/usr/bin/env bash

if [[ -x $(command -v eza) ]] ; then
    alias ls='eza --icons=always'
    alias la='eza --all --icons=always'
    alias lt='eza --tree --icons=always'
    alias l='eza --long --all --icons=always'
fi

alias vi='nvim'
