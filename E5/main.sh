#!/bin/bash

#API Key: 237d199916384e0aaef2a6508410d82b

function Non_VisibleKey(){ #Se crea la función para que cuando el usuario ingrese su información no se muestre
  sa=`stty -g`
  stty -echo
  echo
  echo -n "Introduzca su APIkey: " #Introduce el texto junto con un salto de linea(-n)
  read apikey #Intruducir apikey
  stty $sa #restablecer sesion anterior
  echo
}

function Mails_An(){ #Se crea la función que analizará el txt de los correos
  while IFS= read -r line
  do
    Mails=$line
    API= $(curl -s https://haveibeenpwned.com/api/v3/breachedaccount/$correo -H 'hibp-api-key':$apikey)
    if [[ "$API" = "" ]]; then
      echo -e "El correo $Mails no ha sido vulnerado,\n ¡Sigue navegando con precaución! :)"
    else
      echo -e "\n El correo $Mails ha sido vulnerado por: $API \n ¡Ten cuidado donde registras tu correo (>//< )!"
    fi #en toda la parte anterior se hace el analisis de los correos y se le indica al usuario si fueron o no vulnerados monstrandole los datos en pantalla
      echo 
  done < Mails.txt 
}

#Se mandan a llamar las funciones
Non_VisibleKey
Mails_An
 
