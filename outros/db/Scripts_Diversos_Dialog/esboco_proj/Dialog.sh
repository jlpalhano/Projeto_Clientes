#!/bin/bash
NOME=$( dialog --stdout  --inputbox "Digite sua busca de Cliente:" 0 0)
. ./shell_db.sh
seleciona_dados $NOME
>dados.result
echo  "$RESP" >> dados.result
#dialog --title "Results:" --msgbox "$RESP" 0 0 
#dialog --menu 'Dois campos por linha, sem espaços nos itens' \
#	0 0 10 $( cat dados.result | tr "|" " " )

> /tmp/output.txt
IFS=$''
#$for pkg in `cat dados.result`
for i in `cat dados.result`
do
  /bin/echo  $i | awk -F"|" '{print $1}' > cod
  /bin/echo  $i | awk -F"|" '{print $2}' > nome
done
paste cod nome | sed 's/.*/& ON/'
 #   do
  #     /bin/echo  $pkg 
      #  echo "$pkg"  | awk -F"|" '{print $1 "\t" $2 "\t"}' | sed 's/.*/ & off/';s@      @\ "@g'#>> /tmp/output.txt
	#/bin/echo -e "$pkg" | tr -d "\n" | sed 's/^[0-9]*/ & "/' 
# | awk -F"|" '{print $1 "\t" $2 "\t"}'  
#done
#echo $( /usr/bin/paste cod nome | sed 's/.*/& ON/' )
#dados=$(
dialog --stdout \
--checklist "Escolha os itens" \
0 0 0 \
$( /usr/bin/paste cod nome | sed 's/.*/& ON/' )
# )

#dialog --title "Result" --msgbox "$dados" 0 0 

