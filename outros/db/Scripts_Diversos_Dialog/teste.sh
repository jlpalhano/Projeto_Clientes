#!/bin/sh

############################################
#        Simples Script - Dialog                                                     #
#                                                                                              #
# Hugo Branquinho de Carvalho - 09/06/2005                               #
############################################


proxima=bem_vindo

while : ; do

case "$proxima" in

bem_vindo)
    proxima=nome
    dialog --backtitle "Program 1.0" --msgbox "Bem vindo \nao meu primeiro programa!!!" 0 0
;;

nome)
    anterior=bem_vindo
    proxima=sexo
    nome=$( dialog --stdout --backtitle "Program 1.0" --inputbox "Digite seu nome:" 0 0 )
;;

sexo)
    anterior=nome
    proxima=fim
    sexo=$( dialog --stdout --backtitle "Program 1.0" --radiolist "Escolha seu sexo:" 0 0 0  \
    masculino 'macho chê' ON \
    feminino 'muié' OFF \
    não-sabe 'viado, gay, lésbica, bicha,...' OFF )
;;

fim)

    dialog \
    --cr-wrap \
    --sleep 5 \
    --backtitle "Program 1.0" \
    --infobox "
    OBRIGADO POR INFORMAR SEUS DADOS

    nome=$nome
    sexo=$sexo
    " 0 0

break
;;
*)
exit

esac

retorno=$?

[ $retorno -eq 1 ] && proxima=$anterior
[ $retorno -eq 255 ] && break

done
