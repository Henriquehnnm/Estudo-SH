#!/bin/bash

echo "==CALCULADORA=="

echo "Digite o primeiro número:"
read n1

echo "Digite o segundo número:"
read n2

echo "Escolha a operação (+ - * /)"
read op

if [[ "$op" == "+" ]]; then
echo "O resultado é: $((n1 + n2))"

elif [[ "$op" == "-" ]]; then
echo "O resultado é $((n1 - n2))"

elif [[ "$op" == "*" ]]; then
echo "O resultado é $((n1 * n2))"

elif [[ "$op" == "/" ]]; then
if [[ "$n2" == "0" ]]; then
echo "KAMEEE HAMEEE HAAAAAAAAAAAA"
else
echo "O resultado é $((n1 / n2))"
fi

else
echo "Operação inválida!"
fi

