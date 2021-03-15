#!/bin/sh

COMMIT_MSG=`cat $1`
echo ${COMMIT_MSG}
if [ ${#MSG} -lt 10 ]
  then
    echo "-------------------------------------------------------------------"
    echo "commit message 只有${#MSG}字符"
    echo "message的长度不能小于10, 本次提交失败，请完善commit message，再提交"
    echo "-------------------------------------------------------------------"
    exit 1
fi
