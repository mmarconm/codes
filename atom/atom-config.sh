#!/bin/bash

echo ">>> Coping the Files"
cp {keymap,config}.cson $HOME/.atom/
echo ">>> Config Copied"

cp line-colors.less $HOME/.atom/packages/highlight-line/styles/

echo ">>> Config Git"
cp gitconfig $HOME/.gitconfig

echo ">>> Done !!"
