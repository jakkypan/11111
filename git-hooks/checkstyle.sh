#!/bin/sh

SCRIPT_PATH=`pwd`
${SCRIPT_PATH}/gradlew -PcheckCommit="true" checkstyle
echo "=============$?"
if [ "$?" -eq 0 ]; then
    echo "checkstyle OK!"
else
    echo "checkstyle FAILED!"
    exit 1
fi
