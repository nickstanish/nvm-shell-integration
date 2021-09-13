#!/usr/bin/env zsh

SCRIPT_DIRECTORY=${0%/*}

_nvm() {
  AUTO_CMD=$(ruby "$SCRIPT_DIRECTORY/nvm-shell-integration.rb")
  if [ ! -z "$AUTO_CMD" ]; then
    eval $AUTO_CMD
  fi
}

chpwd_functions=(${chpwd_functions[@]} "_nvm")
_nvm
