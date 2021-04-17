#!/bin/sh

SCRIPT_PATH=`pwd`
${SCRIPT_PATH}/gradlew -PcheckCommit="true" checkstyle
if [ $? -ne 0 ]; then
    echo "checkstyle FAILED, please read "
    exit 1
else
    echo "checkstyle OK!"
fi
