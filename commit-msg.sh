#!/bin/sh

#格式校验
REGULAR="^(feat|fix|docs|chore|style|refactor|perf|test|chore|revert)(\(\w+\))?:(([1-9]\d|[1-9])(\.([1-9]\d|\d)){2,})(\s)*:(\s)*(\S|\w)+"
COMMIT_MSG=`cat $1 | egrep "$REGULAR"`

if [ "$COMMIT_MSG" = "" ]; then
    echo "Commit message irregular，Please check. regular pattern as follow："
    exit 1
fi

if [ ${#COMMIT_MSG} -lt 10 ]; then
    echo "Commit message too short，Please show more detail."
    exit 1
fi
