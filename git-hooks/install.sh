#!/bin/sh

_green() {
  printf '\033[1;31;32m%b\033[0m\n' "$1"
}

_red() {
  printf '\033[1;31;40m%b\033[0m\n' "$1"
}

main() {
  root=`git rev-parse --show-toplevel`

  if [ "$(uname -s)" != "Darwin" ]; then
    _red "Unsupported operating system, Darwin?";
    return 1;
  fi

  if [ ! -d "${root}/.git" ]; then
    _red ".git file not found, Please git init first.";
    return 1;
  fi

  if [ -f "${root}/.git/hooks/commit-msg.sample" ]; then
    mv ${root}/.git/hooks/commit-msg.sample ${root}/.git/hooks/commit-msg.bak;
  fi

  cp -f ${root}/git-hooks/commit-msg.sh ${root}/.git/hooks/commit-msg
  if [ ! -f "${root}/.git/hooks/commit-msg" ]; then
    _red "error to copy the commit-msg.sh to hooks directory";
    return 1;
  fi

  chmod +x ${root}/.git/hooks/commit-msg

  _green "install commit message success!"
}

main "$@"