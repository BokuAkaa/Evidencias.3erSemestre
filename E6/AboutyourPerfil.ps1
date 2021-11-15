# Author: Melissa Mendieta, Gerson Alcocer y Ana Sarmiento :)
# Este script contiene un ciclo con do-until con las opciones para ver y cambiar el statusperfil y Perfilredactual
# todas las funciones estan guardadas en AbouyourPerfil.psm1  

do{
  menú
  $input = Read-Host "Selecciona una opción"
  switch($input)
  {
    '1' { #funcion Ver-StatusPerfil
      'Ha seleccionado la opcion #1'
      Ver-StatusPerfil
    } 
    '2' { #funcion Cambiar-StatusPerfil
      'Ha seleccionado la opcion #2'
      Cambiar-StatusPerfil
    } 
    '3' { #funcion Ver-PerfilRedActual
      'Ha seleccionado la opcion #3'
      Ver-PerfilRedActual
    } 
    '4' {   #funcion Cambiar-PerfilRedActual
      'Ha seleccionado la opcion #4'
      Cambiar-PerfilRedActual
    } 
    'Q' { #el ciclo continuara hasta que el usuario decida salir
      return
    }
  }
  Pause
}
until($input -eq 'Q')