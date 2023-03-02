#!/bin/bash

# read -p "Introduce el primer número: " start_num
# read -p "Introduce el último número: " end_num
# read -p "Introduce el contenido para cada archivo: " content

# echo "¿Deseas crear o eliminar los archivos?"
# read -p "(C)rear o (E)liminar: " option

# if [ "$option" == "C" ] || [ "$option" == "c" ]; then
#   for i in $(seq $start_num $end_num); do
#     filename="$i.sh"
#     echo "$content" >$filename
#     chmod +x $filename
#   done
# elif [ "$option" == "E" ] || [ "$option" == "e" ]; then
#   for i in $(seq $start_num $end_num); do
#     filename="$i.sh"
#     rm $filename
#   done
# fi

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

# Este script permite crear o eliminar archivos con nombres numerados y contenido específico.

#     Pide al usuario que introduzca el primer número, el último número y el contenido para cada archivo.
#     Pide al usuario si desea crear o eliminar los archivos.
#     Si la opción es "C" o "c", se crean los archivos con nombres numerados (por ejemplo, 1.sh, 2.sh, etc.) y contenido específico, y se les otorga permiso de ejecución.
#     Si la opción es "E" o "e", se eliminan los archivos con nombres numerados.
