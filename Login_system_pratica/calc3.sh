#!/usr/bin/env bash
touch ./login.toml

if [[ "$1" == "-h" ]]; then
  echo -e "
  Comandos disponíveis:
  -n: Cria um novo usuário
  -h: Mostra este menu de ajuda
  "
  exit 0
fi

if [[ "$1" == "-n" ]]; then
echo -e "== Seja bem vindo! Crie sua conta para continuar =="

read -p "Digite seu nome: " user

if grep -q "^\[user\.${user}\]" login.toml; then
  echo -e "Esse usuário já existe, tente outro nome..."
  exit 1
fi

read -s -p "Crie uma senha: " p1
echo
read -s -p "Confirme sua senha: " p2
echo

if [[ "${p1}" == "$p2" ]]; then
  echo -e "[user.${user}]\npass = ${p2}\n" >> ./login.toml
  echo -e "Usuário ${user} criado com sucesso!"
  exit 0
else
  echo -e "As senhas não são as mesmas..."
  exit 1
fi
fi

read -p "Digite o nome de usuário: " user

if grep -q "^\[user\.${user}\]" login.toml; then
  pf=$(grep -A1 "\[user.${user}\]" login.toml | tail -n1 | awk -F '=' '{print $2}' | sed 's/^ *//;s/ *$//')
else
  echo -e "Usuário não encontrado..."
  exit 1
fi

echo -e "Bem-vindo de volta ${user}!"
read -s -p "Digite sua senha: " lp

if [[ "${lp}" == "${pf}" ]]; then
  ./src/main.sh
else
  echo -e "\nSenha incorreta, tente novamente..."
  exit 1
fi