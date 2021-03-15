#!/bin/sh


COMMIT_MSG=`cat $1 | egrep "^(feat|fix|docs|chore|style|refactor|perf|test|chore|revert)(\(\w+\))?:(\s)*(\S|\w)+"`

if [ "$COMMIT_MSG" = "" ]; then
    echo "Commit message irregular，Please check. regular pattern as follow："
    exit 1
fi

if [ ${#COMMIT_MSG} -lt 10 ]; then
    echo "Commit message too short，Please show more detail."
    exit 1
fi
