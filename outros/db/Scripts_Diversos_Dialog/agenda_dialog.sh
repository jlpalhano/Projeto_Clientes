#!/bin/bash
# 
#  Anderson Torres
# Analista de Suporte IBM
# chocolatet@bol.com.br
#  
#Loop que mostra o menu principal

     while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    resposta=$(
      dialog --stdout               \
             --title 'ANDY Agenda'  \
             --menu 'Escolha uma opcao:' \
            0 0 0                   \
            1 'Inserir' \
            2 'Editar'  \
            3 'Pesquisar'     	\
            4 'Apagar'        \
            0 'Sair'                )

    # saindo...
    [ $? -ne 0 ] && break

    # De acordo com a opção escolhida dispara funcoes
    case "$resposta" in




   # Inserir   
##################################################################################################
               1)
                  nome=$( dialog --stdout --inputbox 'Digite seu nome:' 0 0 )
# esta parte do programa evita que o programa continue caso o usuario digite 'cancelar'

                  if [ $? -eq 1 ];
                  then
                  echo OK
                 
                  else [ $? -eq 0 ]

                  fone=$( dialog --stdout --inputbox 'Digite seu Telefone:' 0 0   )

                  if [ $? -eq 1 ];
                  then
                  echo OK
                 
                else [ $? -eq 0 ]

                  mail=$( dialog --stdout --inputbox 'Digite seu Email:' 0 0   )

                  if [ $? -eq 1 ];
                  then
                  echo OK
                 
                else [ $? -eq 0 ]                  

dialog                                          \
     --title 'Tem certeza?'                              \
     --yesno '\nDeseja realmente inserir este contato?.\n\n'    \
     0 0


                  if [ $? -eq 0 ];
                  then
                  echo 'inserindo...';
        sleep 1


# Note que se o arquivo não existe o arquivo contacts é criado assim mesmo  
             echo $nome, $fone, $mail >> contacts;
             echo 'O endereco foi adicionado com sucesso' ;
             sleep 1
else 
            echo 'Tudo bem sem problemas...';
fi
fi
fi
fi
            sleep 1
   ;; 

# Editar
################################################################################################
  2) contato=$( dialog --stdout --inputbox 'Digite o contato que deseja editar' 0 0 )

                if [ $? -eq 1 ];
                then
                echo OK
                 
                else [ $? -eq 0 ]
                
                    
                 resultado=$(grep $contato contacts|wc -l)


if [ $resultado -eq 0 ]; 

              then
              echo 'Contato não existe';
sleep 1

              elif [ $resultado -gt 1 ];
              then

              echo 'Verificando...'
sleep 1
              grep $contato contacts;
sleep 1
echo
echo
echo
echo
echo

               echo 'O Numero de contatos encontrados excedes os parametros';
               echo 'de edicao, por favor seja mais especifico/restritivo'; 
sleep 4
               else

grep $contato contacts

sleep 2
dialog                                          \
     --title 'Tem certeza?'                              \
     --yesno '\nDeseja realmente editar este contato?.\n\n'    \
     0 0
              if [ $? = 0 ]
              then

              nome=$( dialog --stdout --inputbox 'Digite o novo nome:' 0 0 )

            if [ $? -eq 1 ];
            then
            echo OK
                 
            else [ $? -eq 0 ]              
                  
              fone=$( dialog --stdout --inputbox 'Digite o novo Telefone:' 0 0   )

            if [ $? -eq 1 ];
            then
            echo OK
                 
            else [ $? -eq 0 ] 
                 
              mail=$( dialog --stdout --inputbox 'Digite o novo Email:' 0 0   )

           if [ $? -eq 1 ];
           then
           echo OK
                 
           else [ $? -eq 0 ]
                                    
                  
             mv contacts contacts.old;
             grep -v $contato contacts.old > contacts;
             rm -f contacts.old;
             echo $nome, $fone, $mail > contacts;
             echo modificando...;
sleep 1
             echo 'Pronto!!'
             echo O contato $nome
             echo           $fone    
             echo           $mail
             echo Foi Adicionado com sucesso!  
sleep 4
             
             fi
             fi
             fi
             fi
             fi
             fi     ;;

# Pesquisar
##################################################################################################
               3) 

            name=$( dialog --stdout --inputbox 'Digite o Nome do contato:' 0 0 )

            if [ $? -eq 1 ];
            then
            echo OK
                 
            else [ $? -eq 0 ]  
            
                echo 'Verificando...'

            busca=$(cat contacts|grep $name)
            resultbusca=$(cat contacts|grep $name|wc -l)
sleep 1
          
           if [ $resultbusca = 0 ];
           then
echo;
echo;
echo;
echo "O contato não existe!!!"

sleep 1

           else
           [ $resultbusca -ge 1 ];

          echo "Resultados:
$busca";
sleep 5
           fi
           fi
;;


# Apagar
##################################################################################################
         
                     4)
 while : ; do


# Mostra o menu na tela, com as ações disponíveis
#Apagar por registro
#Apagar tudo
    
apagar=$(
      dialog --stdout               \
             --menu 'Escolha uma opcao:' \
            0 0 0                   \
            1 'Apagar registro' \
            2 'Apagar Tudo'  \
            0 'Cancelar' )

         [ $? -ne 0 ] && break

                    case "$apagar" in

                          1) echo 'Digite o nome do registro que deseja apagar'
                             read registro
                             echo Verificando ...
sleep 1;
                             resultado=$(cat contacts|grep $registro|wc -l)
                             if [ $resultado -eq 0 ];
                             then


                             echo;
                             echo;
                             echo;
                             echo;
                             echo "O Nome procurado não existe";
sleep 1;
                             elif [ $resultado -gt 1 ];
                             then

                             cat contacts |grep $registro
sleep 1;
                             echo
                             echo

                             echo 'O Numero de contatos encontrados excedes os parametros';
                             echo 'de delecão por favor seja mais especifico/restritivo';   
sleep 5;
                             else

                             cat contacts |grep $registro
sleep 2;
                             
                             dialog                     \
                                   --title 'Tem certeza?'                              \
                                   --yesno '\nDeseja realmente apagar o contato ?\n\n'    \
     0 0 
                             if [ $? -eq 0 ];
                             then
                             mv contacts contacts.old
                             echo deletando...;
                             grep -v $registro contacts.old > contacts 
                             rm -f contacts.old
sleep 1;
                             echo pronto;
sleep 1
                             else
                             echo '' 
                             fi
                             fi         
                            
                            ;;

                         2) dialog                     \
                                   --title 'Tem certeza?'                              \
                                   --yesno '\nDeseja realmente Apagar o arquivo de contatos?\n\n'    \
     0 0
                          if [ $? == 0 ];
                          then
                          echo "Apagando..."
sleep 1
                          rm -rf contacts;
                          else
   
                          echo 'O Numero de contatos encontrados excedes os parametros';
                          echo 'de delecão por favor seja mais especifico/restritivo';              echo "Uffffaaaaaa" ;

sleep 1
                          fi
;;
                         0) break ;;
                         esac
                         done
;;



                       0)break ;;
                         esac
                         done
##################################################################################################
#################################### FIM #########################################################

# Mensagem final :)
echo 'Obrigado por utilizar a ANDY agenda"'

