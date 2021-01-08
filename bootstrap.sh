#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

test ! -d "${HOME}/.zgen" && git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

test -d "${HOME}/.vscode" && rm -rf "${HOME}/.vscode"
ln -s "${HOME}/dotfiles/.vscode" "${HOME}/.vscode"

test -f "${HOME}/.zshrc" && rm "${HOME}/.zshrc"
ln -s "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"

test ! -f "${HOME}/.zsh-theme" && ln -s "${HOME}/dotfiles/.zsh-theme" "${HOME}/.zsh-theme"
test ! -f "${HOME}/.zshrc.codespaces" && ln -s "${HOME}/dotfiles/.zshrc.codespaces" "${HOME}/.zshrc.codespaces"

test -f "${HOME}/.gitconfig" && rm "${HOME}/.gitconfig"
ln -s "${HOME}/dotfiles/.gitconfig" "${HOME}/.gitconfig"
