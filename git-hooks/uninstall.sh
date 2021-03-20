#!/bin/sh

_green() {
  printf '\033[1;31;32m%b\033[0m\n' "$1"
}

_red() {
  printf '\033[1;31;40m%b\033[0m\n' "$1"
}

main() {
  root=`git rev-parse --show-toplevel`

  if [ ! -d "${root}/.git" ]; then
    _red ".git file not found, Please git init first.";
    return 1;
  fi

  if [ -f "${root}/.git/hooks/commit-msg" ]; then
    rm ${root}/.git/hooks/commit-msg
    mv ${root}/.git/hooks/commit-msg.bak ${root}/.git/hooks/commit-msg.sample;
  fi

  if [ -f "${root}/.git/hooks/pre-commit" ]; then
    rm ${root}/.git/hooks/pre-commit
    mv ${root}/.git/hooks/pre-commit.bak ${root}/.git/hooks/pre-commit.sample;
  fi

  _green "uninstall success!"
}

main "$@"