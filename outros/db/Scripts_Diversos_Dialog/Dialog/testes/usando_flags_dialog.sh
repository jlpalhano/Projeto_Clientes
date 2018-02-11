cor= ; ocultos= ; subdir= ; detalhes=

dialog --yesno "Usar cor?" 0 0 && cor="--color=yes"
dialog --yesno "Mostrar ocultos?" 0 0 && ocultos="-a"
dialog --yesno "Mostrar Subdiretorios?" 0 0 && subdir="-R"
dialog --yesno "Mostar Detalhes?" 0 0 && detalhes="-l"

ls $cor $ocultos $subdir $detalhes /
