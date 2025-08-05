#!/usr/bin/env bash

na=$(( (RANDOM % 10) + 1 ))

read -p "Digite um numero de 1 a 10: " un

if (( un == na )); then
  echo "Parabens, vc acertou!"
  exit 0
else
  echo "Vc errou..."
  exit 1
fi