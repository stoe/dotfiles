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

if test gh; then
  eval "$(gh completion -s zsh)"
fi

autoload -Uz compinit
compinit

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

# -- Zgen ----------------------------------------------------------------------

source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitignore
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/npm

    # zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips

    # theme
    zgen oh-my-zsh themes/af-magic

    # save all to init script
    zgen save
fi
