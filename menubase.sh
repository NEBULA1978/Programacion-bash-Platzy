#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar dato"
    echo "4. Salir"
    echo "5. Buscar carpeta"
    echo "6. Mostrar archivos y seleccionar"
    echo "7. Volver a la carpeta actual despues de haber pulsado la opcion 6"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrando datos"
        date
        read foo
        ;;

    4) exit 0 ;;
    5)
        echo "Introduce el nombre de la carpeta a buscar: "
        read carpeta
        if [ -d "$carpeta" ]; then
          echo "Carpeta encontrada: $carpeta"
          
        else
          echo "Carpeta no encontrada"
        fi
        read foo
        ;;
    6)
       echo "Mostrando carpetas en la ruta actual"
        ls -d * .

        echo "Selecciona la carpeta a entrar: "
        read carpeta
        if [ -d "$carpeta" ]; then
          echo "Carpeta encontrada: $carpeta"
          cd $carpeta
          echo "Mostrando archivos en la carpeta $carpeta"
          ls
          echo "Selecciona el archivo a ejecutar: "
          read archivo
          if [ -f "$archivo" ]; then
            echo "Archivo encontrado: $archivo"
            ./$archivo
          
          else
            echo "Archivo no encontrado"
          fi
        else
          echo "Carpeta no encontrada"
        fi
        read foo
        ;;
    7)
        echo "Volver a la carpeta actual despues de haber pulsado la opcion 6"
        cd ..
        read foo
        ;;    
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
