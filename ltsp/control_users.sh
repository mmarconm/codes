#!/bin/bash


function create_users() {

    echo "Entre Com a Quantidade de Usuarios voce quer Criar, Ex: 10"
    read qt
    echo "Entre com o prefixo do usuario que vai ser concatenado com o numero, Ex Aluno, Usuario"
    read prefix

    for i in `seq 1 $qt`; 
        do
            echo "Criando Usuario ", $prefix$i
            useradd -m -k /home/thin $prefix$i
            echo $prefix$i:aluno | chpasswd
        done
        
}

function create_students() {
    echo "Entre Com a Quantidade de Usuarios voce quer Criar, Ex: 10"
    read qt
    echo "Entre com o prefixo do usuario que vai ser concatenado com o numero, Ex Aluno, Usuario"
    read prefix

    for i in `seq 1 $qt`; 
        do
            useradd -m $prefix$i
            echo $prefix$i:aluno | chpasswd
        done
        
}


function remove_users() {
    echo "Entre Com a Quantidade de Usuarios voce quer Criar, Ex: 10"
    read qt
    echo "Entre com o prefixo do usuario que vai ser concatenado com o numero, Ex Aluno, Usuario"
    read prefix

    for i in `seq 1 $qt`; 
        do
            echo "Removendo ", $prefix$i
            deluser --remove-home $prefix$i
        done
        
}


echo "Type 1 For create all the Students"
read option

case $option in

    1)
        echo "Creating Users Account"
        create_users ;;
        
    2)
        echo "Removing Users Account"
        remove_users ;;

    *)
        echo "You must to choose 1 to 3 to install or exit" ;;
        
esac 
