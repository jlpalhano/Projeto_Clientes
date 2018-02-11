nome=$( dialog --stdout --inputbox "Digite seu nome:" 0 0 )

dialog --title "Results" --msgbox "Seu nome eh $nome" 0 0 
