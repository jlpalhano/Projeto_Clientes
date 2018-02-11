#!/bin/bash
DB="/var/dados/db/banco.db"
table_exists(){
	QUERY="SELECT name FROM sqlite_master WHERE type='table' AND name='$1'"
	RESP=`sqlite3 $DB "$QUERY"`

	case $RESP in
	"") echo "Nao encontrei qualquer valor!";
	break;;
	usuarios) echo "Encontrei $RESP";
	break;;
	esac
}
insere_dados(){
NOME=$1
EMAIL=$2
#echo "Digite um nome"
#read NOME
#echo "Digite um email"
#read EMAIL
QUERY="INSERT INTO usuarios VALUES (NULL, '$NOME', '$EMAIL');"
RESP=`sqlite3 $DB "$QUERY"`
case $? in
	0) echo Dados inseridos com sucesso;
	break;;
	*) echo "Um erro ocorreu";
	break;;
esac
}

seleciona_dados(){

#Yes_No ()
#{
#	echo "Deseja continuar pesquisando?[s/n]";
#	read YnAnswer
#  	YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')
#
#	case "$YnAnswer" in
#		s|S|y|Y)  seleciona_dados ;;
#		n|N)	  echo "Saindo";
#			  exit;;
#    		*) 	  echo "Vim para ca"; Yes_No;;
#  	esac
#}



#echo "Informe o nome da pessoa que procura"
NOME=$1
#read NOME
QUERY="SELECT cod, Nome, email FROM usuarios WHERE Nome like '$NOME%'"
RESP=`sqlite3 $DB "$QUERY"`
case $? in
        0) echo Dados encontrados: $RESP;
#	Yes_No;
        break;;
        *) echo "Um erro ocorreu";
        break;;
esac
}

deleta_dados(){
	echo "Informe o nome da pessoa que deseja apagar"
	read NOME

	QUERY="DELETE FROM usuarios WHERE Nome like '$NOME%'"
RESP=`sqlite3 $DB "$QUERY"`
case $? in
        0) echo Dados apagados: $RESP;
        break;;
        *) echo "Um erro ocorreu";
        break;;
esac


}

