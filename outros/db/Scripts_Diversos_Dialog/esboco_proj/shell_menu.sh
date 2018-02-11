#!/bin/dash
clear

 . `pwd`/shell_db.sh
echo Escolha uma opcao:
echo "\n1 - Insere dados\n2 - Consulta Dados\n3 - Deleta Dados\n0 - Sair"
read op
while [ $op != "0" ] ; 
do
case $op in
	1) insere_dados;
	break;;
	2) seleciona_dados;
	break;;
	3) deleta_dados;
	break;;
	*) 
esac
done
