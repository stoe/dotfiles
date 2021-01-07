#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

test ! -d "${HOME}/.zgen" && git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
