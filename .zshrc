#!/bin/zsh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.

autoload -Uz colors && colors

# initialize autocomplete here, otherwise functions won't be loaded
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

if type gh &>/dev/null; then
  eval "$(gh completion -s zsh)"
fi

autoload -Uz compinit
compinit

# -- Oh My Zsh -----------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="themes/af-magic"

plugins=(
  colored-man-pages
  git
  gitignore
  golang
  node
  npm
  nvm
)

source $ZSH/oh-my-zsh.sh

# -- Aliases -------------------------------------------------------------------

alias l="ls -lAh"
alias ll="ls -Gl"
alias la='ls -GA'
alias ls="ls -GpF"

alias g=git

# Reload the shell
alias reload!='source ~/.zshrc'

# DOS style clear
alias cls="clear"
