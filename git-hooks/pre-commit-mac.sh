#!/bin/sh

SCRIPT_PATH=`pwd`
#${SCRIPT_PATH}/gradlew -PcheckCommit="true" checkstyle
#if [ $? -ne 0 ]; then
#    echo "checkstyle FAILED, please read the codestyle report."
#    exit 1
#else
#    echo "checkstyle OK!"
#fi

${SCRIPT_PATH}/gradlew -PcheckPmd="true" pmd
if [ $? -ne 0 ]; then
    echo "pmd check FAILED, please read the pmd report."
    exit 1
else
    echo "pmd OK!"
fi
