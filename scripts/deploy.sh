#!/bin/bash

set -e

TARGET_BRANCH=gh-pages

DIR=$(dirname $0)
REPO=$(git config remote.origin.url)
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=$(git rev-parse --verify HEAD)

setup_git_deploy_key() {
  ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
  ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
  ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
  ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
  openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in $DIR/deploy.key.enc -out $DIR/deploy.key -d
  chmod 600 $DIR/deploy.key
  eval `ssh-agent -s`
  ssh-add $DIR/deploy.key
}

clone_gh_pages_branch() {
  git clone $REPO $TARGET_BRANCH
  cd $TARGET_BRANCH
  git checkout $TARGET_BRANCH || git checkout -b $TARGET_BRANCH
  cd ..
}

update_content() {
  rm -rf $TARGET_BRANCH/*
  cp -rf build/* $TARGET_BRANCH/
}

do_deploy() {
  cd $TARGET_BRANCH
  git config user.name "Travis CI"
  git config user.email "$COMMIT_AUTHOR_EMAIL"
  git add -A .
  git commit -m "Deploy to Github Pages: $SHA"
  git push $SSH_REPO $TARGET_BRANCH
}

main() {
  setup_git_deploy_key
  clone_gh_pages_branch
  update_content
  do_deploy
}

main "$@"
