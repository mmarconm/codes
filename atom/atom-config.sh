#!/bin/bash

echo ">>> Installing Packages on Atom"
apm install --packages-file apm-packages.log
echo ">>> Packages Installed"

echo ">>> Coping the Files"
cp {keymap,config}.cson $HOME/.atom/
echo ">>> Config Copied"

echo ">>> Config Git"
cp gitconfig $HOME/.gitconfig

echo ">>> Done !!"
