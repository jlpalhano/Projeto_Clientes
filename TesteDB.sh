table_exists(){
        QUERY="SELECT name FROM sqlite_master WHERE type='table' AND name='$1'"
        RESP=`sqlite3 $DB "$QUERY"`

        case $RESP in
        "") echo "Nao encontrei qualquer valor!";
        break;;
        clientes) echo "Encontrei $RESP";
        break;;
        esac
}

