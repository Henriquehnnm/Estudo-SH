#!/usr/bin/env bash

touch ./list.txt
read -p "Vc deseja adicionar algo ou visualizar o arquivo 'list.txt'? (a/v) " act

if [[ "${act,,}" != "a" && "${act,,}" != "v" ]]; then
  echo "Vc digitou algo errado..."
  exit 1
fi

if [[ "${act,,}" == a ]]; then
  read -p "Escreva oq vc quer adicionar no arquivo: " add
  echo "${add}" >> ./list.txt
  exit 0
fi

if [[ "${act,,}" == v ]]; then
  cat ./list.txt
  exit 0
fi