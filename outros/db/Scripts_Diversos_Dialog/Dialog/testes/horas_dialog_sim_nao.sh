dialog --yesno "Deseja ver as horas?" 0 0
if [ $? -eq 0 ]; then
	dialog --title "Hora atual"  --msgbox "Agora sao `date`" 0 0
else
	dialog --title "Nao quero saber das hotas..." --msgbox "Mas sao: `date`" 0 0
fi
	
