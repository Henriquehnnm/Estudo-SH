#!/usr/bin/env bash

# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # Sem cor

echo -e "${BLUE}"
  cat <<'EOF'
         .--.
        |o_o |
        |:_/ |
       //   \ \
      (|     | )
     /'\_   _/`\
     \___)=(___/
EOF
  echo -e "${NC}"

echo -e "${YELLOW}== Calculadora 2.0 do Tux ==${NC}"

read -p "Digite o primeiro número: " n1
read -p "Digite a operação: " op
read -p "Digite o segundo número: " n2

if [[ "${n1}" == *.* || "${n2}" == *.* ]]; then
    echo -e "${RED}O tux não gosta de números decimais, só inteiros...${NC}"
    exit 1
fi

if [[ ! "$n1" =~ ^-?[0-9]+$ ]]; then
    echo -e "${RED}Isso não é número, espertão! O Tux só calcula números...${NC}"
    exit 1
fi

case "$op" in
    "+")
        res=$(( $n1 + $n2 ));
        echo -e "${GREEN}O resultado é $res...${NC}"
        exit 0
        ;;
    "-")
        res=$(( $n1 - $n2 ));
        echo -e "${GREEN}O resultado é $res...${NC}"
        exit 0
        ;;
    "*")
        res=$(( $n1 * $n2 ));
        echo -e "${GREEN}O resultado é $res...${NC}"
        exit 0
        ;;
    "/")

        if (( $n2 == 0 )); then
            echo -e "${RED}Cuidado q o Tux pode aparecer debaixo da sua cama de madrugada pra morder seu pé em...${NC}"
            exit 1
        fi

        res=$(( $n1 / $n2 ));
        echo -e "${GREEN}O resultado é $res...${NC}"
        exit 0
        ;;

    *)
    echo -e "${RED}\nQue operação é essa, Einstein? Use: +, -, *, /${NC}"
    echo "Operações disponíveis:"
    echo "  + ou soma"
    echo "  - ou subtração" 
    echo "  * ou multiplicação"
    echo "  / ou divisão"
    exit 1
    ;;
esac