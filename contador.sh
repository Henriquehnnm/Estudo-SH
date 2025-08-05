#!/usr/bin/env bash

echo -e "== Contador de Palavras =="

if [[ "$1" == "-f" ]]; then
  read -p "Digite o caminho de um arquivo de texto para contar suas palavras: " txt
  txtn=$(wc -w < "${txt}")
  echo -e "Seu texto tem ${txtn} palavras..."
  exit 0
else
  read -p "Digite um texto para contar o numero de palavras: " txt
  txtn=$(wc -w <<< "$txt")
  echo -e "Seu texto tem ${txtn} palavras..."
  exit 0
fi