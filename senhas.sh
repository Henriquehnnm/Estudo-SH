#!/usr/bin/env bash

echo -e "== Gerador de senhas =="

read -p "Digite o numero de 1 - 50 de caracteres para gerar sua senha: " car
echo

if (( ${car} < 1 || ${car} > 50 )); then
    echo -e "Digite um numero de 1 - 50"
    exit 1
fi

openssl rand -base64 48 | head -c "${car}"
echo
