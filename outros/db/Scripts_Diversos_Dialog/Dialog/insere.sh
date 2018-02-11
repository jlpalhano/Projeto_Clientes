#!/bin/bash
t=$(mktemp -t inputbox.XXXXXXXXX) || exit
trap 'rm -f "$t"' EXIT         # remove temp file when done
trap 'exit 127' HUP STOP TERM  # remove if interrupted, too
dialog --inputbox \
    "Qual seu Nome" 0 0 2>"$t"
retval=$?
nome=$(cat "$t")  # Prefer $(...) over `...`
case $retval in
  0)    echo "Seu nome eh '$nome'";;
  1)    echo "Cancel pressed.";;
esac

installa(){

. ../shell_db.sh

insere_dados $nome $email

}



c=$(mktemp -t inputbox2.XXXXXXXXX) || exit
trap 'rm -f "$c"' EXIT         # remove temp file when done
trap 'exit 127' HUP STOP TERM  # remove if interrupted, too
dialog --inputbox \
    "Qual seu Email" 0 0 2>"$c"
retval=$?
email=$(cat "$c")  # Prefer $(...) over `...`
case $retval in
  0)    echo "Seu Email eh '$email'";
	installa;;
  1)    echo "Cancel pressed.";;
esac

