DB="../banco.db"
bla(){
dialog --inputbox 'Digite seu nome:' 0 0 2>/tmp/nome.txt
nome=$( cat /tmp/nome.txt )
#echo "O seu nome é: $nome"
}
table_exists(){
        QUERY="SELECT name FROM sqlite_master WHERE type='table' AND name='$nome'"
        RESP=`sqlite3 $DB "$QUERY"`

        case $RESP in
        "") echo "Nao encontrei qualquer valor!";
        break;;
        usuarios) echo "Encontrei $RESP";
        break;;
        esac
}

seleciona_dados(){

dialog --title "Busca desenfreada"  --inputbox 'echo "Informe o nome da pessoa que procura"' 0 0 2> /tmp/nome.txt 
NOME=$( cat /tmp/nome.txt )
QUERY="SELECT count(nome) FROM usuarios WHERE Nome like '$NOME%'"
QUERY2="SELECT nome FROM usuarios WHERE Nome like '$NOME%'"
RESP=`sqlite3 $DB "$QUERY"`
RESP2=`sqlite3 $DB "$QUERY2"`
case $RESP in
        [1-9]|[1-9][0-9])  dialog --title "Resultado:" --msgbox "$RESP2" 10 30;
        break;;
        *)      dialog --title "Resultado:" --msgbox "Desculpe! Não achei nada!" 5 41;
        break;;
esac
}
seleciona_dados
#table_exists
