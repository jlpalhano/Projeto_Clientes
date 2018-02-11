#!/bin/bash
DIR=/var/dados/Projeto_Agenda
BASE="contatos.txt"
U_BASE=${DIR}/${BASE}
BKP="${U_BASE}.bkp"
TMP="${U_BASE}.tmp"
VER="0.1"

menu_pai_op=( "Listar" "Pesquisar" "Incluir" "Apagar" "Sair" )
fchamadas=( op_listar op_pesquisar op_incluir op_apagar op_sair )

[ -d ${DIR} ] || mkdir -p ${DIR}
[ -f ${U_BASE} ] || touch  ${U_BASE} 

volta_menu(){
echo "Passando por Volta Menu com $1"
[ $1 -eq 0 ] || menu
}
base_zerada(){
	echo "Entrei na fnc base zerada"
[ -s "${U_BASE}" ] || ( dialog  --stdout --title "Atenção!" --msgbox "Base Zerada" 0 0 ; op_incluir )  
}


op_listar(){
	echo Entrei sei la por que em op_listar
	base_zerada
	dialog --title "Nome|Telefone" --textbox "${U_BASE}" 0 0
	return
}

op_incluir(){
	nome=""
	#while [ "${nome}" = "" ]
	while [ -z "${nome}" ]
	do
		nome=$( dialog --stdout --inputbox "Entre com o nome" 0 30)
		volta_menu $?
		nome=$( echo ${nome} | tr "|" "_" )
		[ -z "${nome}" ] && ( dialog --msgbox "Insira um nome valido" 0 0 ; continue) || break
	done
	
	telefone=""
	while [ -z "${telefone}" ]
	do
		telefone=$( dialog --stdout --inputbox "Entre o telefone:" 0 30 )
		volta_menu $?
		telefone=$( echo ${telefone} | tr "|" "_" )
		
		[ -z "${telefone}" ] && ( dialog --msgbox "Insira um telefone valido" 0 0 ; continue ) || break
	done


registro="${nome} | ${telefone}"
echo $registro >> ${U_BASE}
dialog --infobox "Nova entrada Adicionada. \nNome: ${nome}\nTelefone: ${telefone}" 0 0
sleep 3
menu
}

op_pesquisar(){
	base_zerada
	nome=""
	while [ -z "${nome}" ]    			#Atencao: semmpre usar os "" nas variaeis com while
	do
		nome=$( dialog --stdout --inputbox "Nome ou Telefone a procurar" 0 30 )
		volta_menu $?	
#	[ "$?" = 1 ] && menu
		nome=$( echo "${nome}" | tr "|" "_" )
		[ -z ${nome} ] && ( dialog --msgbox "Insira um nome valido" 0 0 ; continue ) || break
	done

IFSOLD=$IFS
IFS=$'\n'
res=$( cat ${U_BASE} | grep ${nome} )
IFS=$IFSOLF

	if [ -z "${res}" ]; then
		dialog --title "Resultados encontrados para ${nome}:" \
			--msgbox "Nenhum resultado encontrado." 0 0
		menu
	else
		dialog --title "Resultados da pesquisa para $nome" \
			--msgbox "${res}" 0 0
		menu
	fi
}

op_apagar(){
	IFSOLD=$IFS
	IFS=$'\n'
	lista=( $(cat ${U_BASE}))
	op=""
	n=0
	for linha in ${lista[*]}
	do
		entrada=$( echo $linha | tr " " "_" )
		op="$op $n $entrada off "
		let n=n+1
	done 
	
	IFS=$IFSOLD
	resp=$( dialog --stdout --checklist "Marque os nomes que deseja apagar" \
	0 0 0 $op )
	if [ "$?" -eq 0 ]; then 
		 dialog --stdout  --title "Questão:" --yesno "tem certeza que deseja apagar?" 0 0 
		 [ "$?" -eq 0 ] || menu
	else
		menu
	fi
	[ -z "$resp" ] && return
	
for n in "$resp"
do
	
	idx=$( echo $n | tr -d "\*")
	lista[$idx]=""
done

[ -f $TMP ] && rm $TMP
touch $TMP
IFSOLD=$IFS
IFS=$'\n'

for linha in ${lista[*]}
do
	echo "$linha" >> $TMP
done
	
IFS=$IFSOLD

mv ${U_BASE} $BKP
mv $TMP ${U_BASE}


}

menu()
{
echo "Entrei no menu"
	menup=""
	while [ -z "$menup" ]
	do
		qtd_op_menu=${#menu_pai_op[@]}
		menu=""
			for i in $(seq 0 $(( qtd_op_menu - 1 )) )
			do
				op=$( echo ${menu_pai_op["$i"]} | tr " " "_" )
				menup="${menup} $i $op "
			done
		resp=$( dialog --stdout --menu "Agenda Telefonica ${VER}" 0 0 0 ${menup})
		[ "$?" = 1 ] && exit 1
		${fchamadas[$resp]}
	done
}

op_sair(){
	exit 0
}
menu

