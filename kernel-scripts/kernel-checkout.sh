#!/bin/bash

# This script ensures that /ide/work/linux contains a linux source tree

set -e

BRANCH=${BRANCH:-master}

if [ ! -e "/ide/work/linux" ]; then
  echo "/ide/work/linux does not exist - will copy from torvalds/linux master at /ide/linux"
  cp -R /ide/linux /ide/work/linux
fi

cd /ide/work
if [ -z "$REPO" ]; then
  # repository is not set, just built with local contents
  echo "Building kernel from local workspace at /ide/work"
elif [ -n "$COMMIT" ]; then
  echo "Building kernel from ${REPO} commit ${COMMIT}"
  git remote add -f build "${REPO}"
  git fetch build
  git checkout "$COMMIT"
else
  echo "Building kernel from ${REPO} branch ${BRANCH}"
  git fetch "${REPO}" "${BRANCH}"
  git reset --hard FETCH_HEAD
fi
