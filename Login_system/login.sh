#!/usr/bin/env bash

# Cria o arquivo de login se ele não existir
touch ./login.toml

# ==================================
# Seção de criação de novo usuário
# ==================================
if [[ "$1" == "-n" ]]; then
echo -e "== Bem-vindo! Crie sua conta para continuar =="

read -p "Digite seu nome de usuário: " username

# Verifica se o nome de usuário já existe no arquivo
if grep -q "^\[user\.${username}\]" login.toml; then
  echo -e "Esse usuário já existe, tente outro nome..."
  exit 1
fi

read -s -p "Crie uma senha: " new_password
echo
read -s -p "Confirme sua senha: " confirm_password
echo

# Compara as senhas digitadas
if [[ "${new_password}" == "$confirm_password" ]]; then
  # Adiciona o novo usuário e a senha ao arquivo TOML
  password_hash=$(echo -n "$new_password" | sha256sum | awk '{print $1}')
  echo -e "[user.${username}]\npass = ${password_hash}\n" >> ./login.toml
  echo -e "Usuário ${username} criado com sucesso!"
  exit 0
else
  echo -e "As senhas não são as mesmas..."
  exit 1
fi
fi

# ==================================
# Seção de login
# ==================================
read -p "Digite o nome de usuário: " username

# Encontra a senha armazenada para o usuário digitado
if grep -q "^\[user\.${username}\]" login.toml; then
  stored_password=$(grep -A1 "\[user.${username}\]" login.toml | tail -n1 | awk -F '=' '{print $2}' | sed 's/^ *//;s/ *$//')
else
  echo -e "Usuário não encontrado..."
  exit 1
fi

echo -e "Bem-vindo de volta ${username}!"
read -s -p "Digite sua senha: " entered_password
sp_hash=$(echo -n "$entered_password" | sha256sum | awk '{print $1}')
echo

# Compara a senha digitada com a senha armazenada
if [[ "${sp_hash}" == "${stored_password}" ]]; then
  echo -e "Login bem-sucedido! Iniciando..."
  exit 0
else
  echo -e "Senha incorreta, tente novamente..."
  exit 1
fi
