#!/bin/bash

function install_atom() {

    echo ">>> Installing Packages on Atom"
    apm install --packages-file new-themes.log
    echo ">>> Packages Installed"

    echo ">>> Coping the Files"
    cp {keymap,config}.cson $HOME/.atom/
    echo ">>> Config Copied"

    echo ">>> Config Git"
    cp gitconfig $HOME/.gitconfig

    echo ">>> Done !!"
    
}

echo ">>> Searching for a possible existing installation"

if [ -d /home/$USER/.atom ]; then
    echo "The folder Already Exists, what do you want to do"
    echo "Type 1 to delete the folder and rebuild the atom installation"
    echo "type 2 to exit"
    read option

    case $option in

	1)

	   rm /home/$USER/.atom -rf
	   echo "Folder Deleted" 
	   install_atom	;;

	2)
	    echo "Bye" ;;

	*)
	    echo "You must to choose 1 or 2 to install or exit" ;;
    esac 

else

    install_atom

fi


