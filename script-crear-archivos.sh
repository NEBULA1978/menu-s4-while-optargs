#!/bin/bash

read -p "Introduce el primer número: " start_num
read -p "Introduce el último número: " end_num
read -p "Introduce el contenido para cada archivo: " content

for i in $(seq $start_num $end_num); do
  filename="$i.sh"
  echo "$content" >$filename
  chmod +x $filename
done

# Este script utiliza la función read para pedir al usuario que introduzca el primer número, el último número y el contenido que se desea agregar a cada archivo. Luego, utiliza un bucle for para crear un archivo con el nombre correspondiente y el contenido especificado para cada número en la secuencia. Finalmente, se cambia el permiso del archivo para que pueda ser ejecutado con chmod +x.

# Puedes guardar este script en un archivo con una extensión de nombre .sh y ejecutarlo en la línea de comandos con ./nombre_del_archivo.sh.
