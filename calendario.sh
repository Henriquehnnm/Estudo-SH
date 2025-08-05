#!/usr/bin/env bash

command -v calcurse >/dev/null || { echo -e "${RED}Você precisa instalar o calcurse primeiro!${NC}"; exit 1; }


# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${BLUE}== Calendario ==\n${NC}"

echo -e "${GREEN}Digite a opção q deseja ver:${NC}\n
1) Dia atual\n
2) Mês\n
3) 3 Meses atuais\n
4) Ano\n
5) Calendário Completo\n"

read op

echo

if [[ -z "${op}" ]]; then
  exit 0
fi

if (( ${op} < 1 || ${op} > 5 )); then
  echo -e "${RED}Digite um comando válido...${NC}"
  exit 1
fi

case "${op}" in
  1) date ;;
  2) cal ;;
  3) cal -3 ;;
  4) cal -y ;;
  5) calcurse ;;
esac