dialog --inputbox "Digite seu nome:" 0 0 2> nome.txt
NOME=$( cat nome.txt )

dialog --title "Seu nome meu caro" --msgbox "Seu nome eh $NOME"  0 0 
