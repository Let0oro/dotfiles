#!/bin/bash


inotifywait -m /home/juanma/Downloads -e create -e moved_to |
while read path action file; do
  if [[ "$file" =~ \.(jpg|png)$ ]]; then
  mv "$path$file" /home/usuario/Imagenes/
  echo "$file movido a imágenes"
  fi
done
