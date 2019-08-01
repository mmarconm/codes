FOLDER="venv"               # virtualenv folder
SOURCE=$FOLDER/bin/activate # activate folder in python

create_virtualenv() {
    # create a new virtualenv folder
    virtualenv -p $1 $FOLDER
    source $SOURCE
}

if [ -d $FOLDER ]; then
    echo "There is a Venv folder, What to do ? "
    echo "Delete folder"
    echo "Use this virtualenv"
else
    while :; do
        echo -n "Type a Python Version to create a new virtualenv, Ex py2, py3 "
        read pyv
        case $pyv in
        py2) # case the choice its python3
            create_virtualenv python2
            break
            ;;
        py3) # case the choice its python2
            create_virtualenv python3
            break
            ;;
        *) # case neither choice its choosen
            echo "Wrong Anwser, py3 or py2 Please !"
            ;;
        esac
    done
fi
