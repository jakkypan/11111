#!/bin/sh

_green() {
  printf '\033[1;31;32m%b\033[0m\n' "$1"
}

_red() {
  printf '\033[1;31;40m%b\033[0m\n' "$1"
}

main() {
  if [ "$(uname -s)" != "Darwin" ]; then
    _red "Unsupported operating system, Darwin?";
    return 1;
  fi

  if [ ! -d ".git" ]; then 
    _red "Dir .git not find, Please git init first?";
    return 1;
  fi

  if [ -f .git/hooks/commit-msg.sample ]; then
    mv .git/hooks/commit-msg.sample .git/hooks/commit-msg.bak;
  fi

  cp -f ./commit-msg.sh .git/hooks/commit-msg

  chmod +x .git/hooks/commit-msg

  _green "commit-msg hook Install Success!"
}

main "$@"