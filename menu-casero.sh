#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
# controlC
# Para capturr el atajo de teclado que acabo de escribir y redirijirlo a la funcion controlC
trap controlC INT

function controlC() {
  # Parametro -e para que me aplique los saltos de linea
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  # Codigo de estado no exitoso
  exit 1
}

# Main Function Principal
# Si id -u aplicado a nivelde sistema es 0 para saber si soy root
if [ "$(id -u)" == "0" ]; then
  echo "Soy root"
else
  echo "No soy root"

fi
