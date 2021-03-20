#!/bin/sh

_red() {
  printf '\033[1;31;40m%b\033[0m\n' "$1"
}

#格式校验
REGULAR="^(feat|fix|docs|chore|style|refactor|perf|test|chore|revert)(\(\w+\))?:(([1-9]\d|[1-9])(\.([1-9]\d|\d)){2,})(\s)*:(\s)*(\S|\w)+"
COMMIT_MSG=`cat $1 | egrep "$REGULAR"`

if [ "$COMMIT_MSG" = "" ]; then
    echo "Commit message irregular，Please check. regular pattern as follow：\n"
    echo "\t<type>(<scope>): <version>: <subject>"
    echo "\t<BLANK LINE>"
    echo "\t<body>"
    echo "\t<BLANK LINE>"
    echo "\t<extend>\n"
    echo "More details, Please see the wiki: http://www.baidu.com"
    exit 1
fi

#找到实际的内容
SUBJECT=""
i=1
while((1==1))
do
  split=`echo ${COMMIT_MSG}|cut -d ":" -f$i`
  if [ "$split" != "" ]
  then
      # 实际的内容在第3个位置上
      if [ ${i} -eq 3 ]; then
        SUBJECT=$split
        break
      fi
      ((i++))
  else
      break
  fi
done
if [ ${#SUBJECT} -lt 15 ]; then
    echo "Commit message too short, at least greater than 10 characters，Please show more detail."
    exit 1
fi
