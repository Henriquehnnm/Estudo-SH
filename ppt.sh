#!/usr/bin/env bash

echo -e "Pedra Papel Tesoura"

read -p "Escolha uma opção (pedra, papel ou tesoura ou exit): " uop

if [[ "${uop,,}" == "exit" ]]; then
    exit 0
fi

op=('pedra' 'papel' 'tesoura')
ind=$(( RANDOM % 3 ))
mop=${op[$ind]}

echo -e "Seu oponente escolheu ${mop}!"

case "$uop-$mop" in
    pedra-pedra|papel-papel|tesoura-tesoura)
        echo -e "EMPATE!"
        exit 0
        ;;
    pedra-tesoura|papel-pedra|tesoura-papel)
        echo -e "VC GANHOU!"
        exit 0
        ;;
    pedra-papel|papel-tesoura|tesoura-pedra)
        echo -e "VC PERDEU!"
        exit 1
        ;;
esac