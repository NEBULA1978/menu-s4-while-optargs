#!/bin/bash

echo "Archivos en la carpeta actual:"
ls

echo "¿Deseas eliminar algún archivo existente antes de crear los nuevos?"
read -p "(S)í o (N)o: " delete_option

if [ "$delete_option" == "S" ] || [ "$delete_option" == "s" ]; then
  echo "Introduce el nombre del archivo que deseas eliminar:"
  read -p "Nombre: " delete_file
  rm $delete_file
fi

read -p "Introduce el primer número: " start_num
read -p "Introduce el último número: " end_num
read -p "Introduce el contenido para cada archivo: " content

echo "¿Deseas crear los archivos?"
read -p "(S)í o (N)o: " create_option

if [ "$create_option" == "S" ] || [ "$create_option" == "s" ]; then
  for i in $(seq $start_num $end_num); do
    filename="$i.sh"
    echo "$content" >$filename
    chmod +x $filename
  done
fi

#  el código que muestra los archivos de la carpeta actual y pregunta al usuario qué archivo desea eliminar antes de crear los archivos numerados.
