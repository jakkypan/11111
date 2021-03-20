#!/bin/sh

SCRIPT_PATH=`pwd`
${SCRIPT_PATH}/gradlew -PcheckCommit="true" checkstyle
echo "=============$?"
if [ $? -ne 0 ]; then
    echo "checkstyle FAILED!"
    exit 1
else
    echo "checkstyle OK!"
fi
