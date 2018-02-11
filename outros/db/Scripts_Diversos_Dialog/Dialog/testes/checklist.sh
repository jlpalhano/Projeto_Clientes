
#estilos=$( dialog --stdout \
#	--checklist "Voce gosta de:" 0 0 0 \
	for i in $( cat c.l ); do
		echo $i | xargs -L3
	done
