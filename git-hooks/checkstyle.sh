#!/bin/sh

SCRIPT_PATH=`pwd`
${SCRIPT_PATH}/gradlew -PcheckCommit="true" checkstyle
echo "=============$?"
ss=`$? -eq 0`
echo ss
if [ $? -eq 0 ]; then
    echo "checkstyle OK!"
else
    echo "checkstyle FAILED!"
    exit 1
fi
