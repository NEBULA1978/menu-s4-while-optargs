#!/bin/bash

read -p "Introduce el primer número: " start_num
read -p "Introduce el último número: " end_num
read -p "Introduce el contenido para cada archivo: " content

echo "¿Deseas crear o eliminar los archivos?"
read -p "(C)rear o (E)liminar: " option

if [ "$option" == "C" ] || [ "$option" == "c" ]; then
  for i in $(seq $start_num $end_num); do
    filename="$i.sh"
    echo "$content" >$filename
    chmod +x $filename
  done
elif [ "$option" == "E" ] || [ "$option" == "e" ]; then
  for i in $(seq $start_num $end_num); do
    filename="$i.sh"
    rm $filename
  done
fi
