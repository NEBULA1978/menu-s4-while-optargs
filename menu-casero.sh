#!/bin/bash
# Control de interrupción

trap controlC INT

function controlC() {
  echo -e "\n\n[!] Saliendo...\n"
  exit 1
}

function helpPanel() {
  echo -e "\n[*] Uso: ./script.sh"
  echo -e "\n\t-a Modo de ataque"
  echo -e "\t-n Nombre de la tarjeta de red"
  echo -e "\t-h Mostrar este panel de ayuda\n"
  exit 0
}

function startAttack() {
  echo "Empezando con el ataque(atacmode=$atacmode || networkcard=$networkcard)"
}

if [ "$(id -u)" == "0" ]; then
  echo -e "Soy root"
  declare -i parameter_counter=0
  while getopts ":a:n:h" arg; do
    case $arg in
    a)
      atacmode="$OPTARG"
      let parameter_counter+=1
      ;;
    n)
      networkcard="$OPTARG"
      let parameter_counter+=1
      ;;
    h) helpPanel ;;
    esac
  done

  if [ $parameter_counter -ne 2 ]; then
    helpPanel
  else
    startAttack
  fi
else
  echo -e "\n[+] No soy root\n"
fi
