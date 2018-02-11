#!/bin/bash
if whiptail --title "Testanco caixa Yes/No" --yesno "Escolha uma alternativa Yes e No." --fb 10 50
then
	echo "Voce escolheu Yes. O stauts de saida eh $?."
else
	echo "Voce escolheu No. O status de saida eh $?."
fi 
