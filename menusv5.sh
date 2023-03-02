#!/bin/bash

#Colours
# Definimos las variables para colorear la salida del script
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# controlC
# Definimos una función que manejará la señal de interrupción
trap controlC INT

function controlC() {
  # Parametro -e para que me aplique los saltos de linea
  # Mostramos un mensaje al usuario indicando que se ha interrumpido el script
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  # Codigo de estado no exitoso
  # Indicamos al sistema operativo que el script no se ha ejecutado correctamente
  exit 1
}

function helpPanel() {
  # Mostramos un mensaje de ayuda al usuario
  echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./s4viPwnWifi.sh${endColour}"
  echo -e "\n\t${purpleColour}a)${endColour}${yellowColour} Modo de ataque${endColour}"
  echo -e "\t\t${redColour}Handshake${endColour}"
  echo -e "\t\t${redColour}PKMID${endColour}"
  echo -e "\t${purpleColour}n)${endColour}${yellowColour} Nombre de la tarjeta de red${endColour}"
  echo -e "\t${purpleColour}h)${endColour}${yellowColour} Mostrar este panel de ayuda${endColour}\n"
  # Salimos del script con código de estado exitoso
  exit 0
}

function startAttack() {
  # Mostramos un mensaje indicando que se está iniciando el ataque
  echo "Empezando con el ataque(atacmode=$atacmode || networkcard=$networkcard)"
}

# Main Function Principal
# Comprobamos si el script se está ejecutando como root
if [ "$(id -u)" == "0" ]; then

  # Aqui ejecutamos la accion principal siendo root
  # Mostramos un mensaje al usuario indicando que el script se está ejecutando como root
  echo -e "Soy root"
  # Usamos getopts para procesar las opciones pasadas al script
  declare -i parameter_counter=0
  while getopts ":a:n:h" arg; do
    case $arg in
    a)
      atacmode="$OPTARG"
      let parameter_counter+=1
      ;;
    # Si la opción es -a, almacenamos el argumento en la variable atacmode
    n)
      networkcard="$OPTARG"
      let parameter_counter+=1
      ;;
    # Si la opción es -n, almacenamos el argumento en la variable networkcard
    h) helpPanel ;;
      # Si la opción es -h, mostramos la ayuda al usuario y salimos del script
    esac

  done

  if [ $parameter_counter -ne 2 ]; then
    helpPanel
    # Si el número de opciones procesadas no es 2, mostramos la ayuda al usuario y salimos del script
  else
    startAttack
    # Si el número de opciones procesadas es 2, iniciamos el ataque
  fi

else
  # Salto de linea con barra invertida n
  # Mostramos un mensaje al usuario indicando que el script no se está ejecutando como root
  echo -e "\n${redColour}[+] No soy root${endColour}\n"

fi

# Para ejecutar por consola

# root@next-System:/home/next/Escritorio/menu-s4-while-optargs# ./menu-casero.sh -a hola -n hola
# Soy root
# Empezando con el ataque(atacmode=hola || networkcard=hola)
# root@next-System:/home/next/Escritorio/menu-s4-while-optargs# ./menu-casero.sh -a hola -n
# Soy root

# [*] Uso: ./s4viPwnWifi.sh
# root@next-System:/home/next/Escritorio/menu-s4-while-optargs# ./menu-casero.sh -a hola -n
# Soy root

# [*] Uso: ./s4viPwnWifi.sh
# root@next-System:/home/next/Escritorio/menu-s4-while-optargs#
