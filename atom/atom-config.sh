#!/bin/bash

echo ">>> Installing pip packages for python3"
python3 -m pip install --user -U -r requirements.txt
echo ">>> Pip packages Installed"

echo ">>> Installing Packages on Atom"
apm install --packages-file apm-packages.log
echo ">>> Packages Installed"

echo ">>> Coping the Files"
cp {keymap,config}.cson $HOME/.atom/
echo ">>> Config Copied"

cp line-colors.less $HOME/.atom/packages/highlight-line/styles/

echo ">>> Config Git"
cp gitconfig $HOME/.gitconfig

echo ">>> Done !!"
