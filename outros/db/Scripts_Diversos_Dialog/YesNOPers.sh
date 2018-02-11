#!/bin/bash
if whiptail --title "Escolhendo o tipo de instalacao" --yes-button "Completa" --no-button "Personalizada" --yesno "Escolha o tipo de Instalação:" --fb 10 50
then
	echo "Voce escoheu Completa! $?"
else
	echo "Voce escolheu Personal $?"
fi

