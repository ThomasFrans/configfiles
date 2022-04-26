#!/usr/bin/env bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER=vimpager

alias sudo='doas'
alias ls='ls -hlA --group-directories-first --color=auto'
alias vim='TERM=xterm-256color vim'
alias less=$PAGER
alias zless=$PAGER

pacman-Ql() {
  pacman -Ql $1 | rg -e "[^/]$"
}

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias config='git --git-dir=/home/thomas/.cfg/ --work-tree=/home/thomas'
