escolha=$( dialog --stdout --menu "Bobiça" 0 0 1 1 um 2 dois 3 tres )
if [ $? -eq 0 ]; then

dialog --msgbox "Usuario escolheu $escolha" 0 0 
else
dialog --msgbox "Usuario cancelou a op" 0 0 
fi
