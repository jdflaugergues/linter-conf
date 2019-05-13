#!/bin/bash

target_branch=${1:-develop}

echo "Linting changes against $target_branch branch"

BASE_REV=`git merge-base ${target_branch} $(git rev-parse --abbrev-ref HEAD)`

UPDATED=`git diff --diff-filter=ACMR --name-only $BASE_REV HEAD | grep -e '\.js$'`

if [[ -n $UPDATED ]]
then
  node_modules/.bin/eslint --fix $UPDATED
  exit
else
  echo "Nothing to Lint"
fi
exit 1
