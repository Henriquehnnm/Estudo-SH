#!/usr/bin/env bash

# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

# Pontuação
pont=0

echo -e "${MAGENTA}Responda as perguntas a seguir:${NC}
"

# Pergunta 1
echo -e "Em que ano o linux foi criado?

a) 1992
b) 1988
c) 1990
d) 1991
"

read res

if [[ "${res,,}" == "d" ]]; then
  echo -e "${BLUE}Resposta correta, parabens!${NC}"
  pont=$((pont + 1))
else
 echo -e "${RED}Precisa melhorar...${NC}"
fi

# Pergunta 2
echo -e "O que o comando chmod +x script.sh faz?

a) Deleta o arquivo
b) Compila o script
c) Torna o script executável
d) Abre o script no editor
"

read res

if [[ "${res,,}" == "c" ]]; then
  echo -e "${BLUE}Resposta correta, parabens!${NC}"
  pont=$((pont + 1))
else
  echo -e "${RED}Precisa melhorar...${NC}"
fi

# Pergunta 3
echo -e "Qual comando é usado para listar todos os arquivos e diretórios, incluindo os ocultos?

a) ls -l
b) ls -a
c) ls -h
d) ls -r
"

read res

if [[ "${res,,}" == "b" ]]; then
  echo -e "${BLUE}Resposta correta, parabens!${NC}"
  pont=$((pont + 1))
else
  echo -e "${RED}Precisa melhorar...${NC}"
fi

# Pergunta 4
echo -e "Qual diretório contém os arquivos de configuração do sistema no Linux?

a) /home
b) /var
c) /etc
d) /usr
"

read res

if [[ "${res,,}" == "c" ]]; then
  echo -e "${BLUE}Resposta correta, parabens!${NC}"
  pont=$((pont + 1))
else
  echo -e "${RED}Precisa melhorar...${NC}"
fi

# Pergunta 5
echo -e "Qual comando é usado para procurar por texto dentro de arquivos?

a) grep
b) locate
c) find
d) search
"

read res

if [[ "${res,,}" == "a" ]]; then
  echo -e "${BLUE}Resposta correta, parabens!${NC}"
  pont=$((pont + 1))
else
  echo -e "${RED}Precisa melhorar...${NC}"
fi

# Final

if (( pont >= 3 )); then
  echo -e "${BLUE}Parabens! Vc acertou ${pont} respostas!${NC}"
else
  echo -e "${RED}Vc acertou ${pont} respostas, continue estudando, não desista!${NC}"
fi