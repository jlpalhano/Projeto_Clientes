dialog --yesno 'sim ou não?' 0 0
if [ $? -eq 0 ]; then

	dialog --title "Resposta Positiva" --msgbox "Digitou Aceitar" 0 0
else
	dialog --title "Resposta Negativa" --msgbox "Digitou cancelar" 0 0
fi
