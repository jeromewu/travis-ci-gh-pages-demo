#!/bin/bash

DIR=$(dirname $0)

ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in $DIR/deploy.key.enc -out $DIR/deploy.key -d
chmod 600 $DIR/deploy.key
eval `ssh-agent -s`
ssh-add $DIR/deploy.key
