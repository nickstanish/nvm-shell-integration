#!/usr/bin/env bash

_nvm() {
  AUTO_CMD=$(ruby "${BASH_SOURCE%/*}/nvm-shell-integration.rb")
  if [ ! -z "$AUTO_CMD" ]; then
    # echo "> $AUTO_CMD"
    eval $AUTO_CMD
  fi
}

cdnvm(){
  cd "$@"
  _nvm
}
alias cd='cdnvm'
_nvm
