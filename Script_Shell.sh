#!bin/bash

# 1

# Para criar variavel basta digitar um nome(não pode começar com numero) e
#colocar um igual(=), o igual vai atribuir algo a variavel

# nome_da_variavel=$(comando +"formula")

# Para formatar você precisa pegar os elementos da data e separa-los
#Ex: %d <-> dia
#    %m <-> mês
#    %y <-> ano simplificado 19
#    %Y <-> ano extenso 2019

data=$(date +"%d/%m/%Y")

# Para imprimir na tela basta digitar 'echo' junto com algo que queira
#escrever sendo texto ou uma variavel

echo $data

#------------------------------------------------------------------------------

# 2

#Obs: o comando 'date' pega tanto data quanto hora, basta formatar comforme
#necessario

# Para formatar você precisa pegar os elementos da hora e separa-los
#Ex: %H <-> horas
#    %M <-> minutos

# nome_da_variavel=$(comando +"formula")

hora=$(date +"%H:%M")

echo $hora

#------------------------------------------------------------------------------

# 3

# O comando 'test' verificar a existencia de algo
# O sub comando '-d' define como alvo diretorios, 
# 'test -d' busca por diretorio

# nome_da_variavel=$(comando +"formula")
diretorio=$(test -d /tmp ; echo $?)


# $? retorna o resultado da ultima operação
# 0=verdadeiro ou 1=falso
# fazer a condicional

# O comando 'if' é validador de codição, caso uma determinada condição seja
#atendida ele executara um bloco, caso contrario executa outro

if [ $diretorio == 0 ];
then
    echo "O diretório existe"
else
    echo "O diretório não existe"
fi

#------------------------------------------------------------------------------

# 4

diretorio=$(test -d /tmp/jandira ; echo $?)

# fazer a condicional


if [ $diretorio == 1 ];
then
    echo "O diretório não existe, criando diretório"
    # O comando 'mkdir' cria um pasta, após o 'mkdir' vem o caminho 
	    mkdir /tmp/jandira
fi

#------------------------------------------------------------------------------

# 5

arquivo=$(test -f /tmp/jandira/jandira.txt ; echo $?)

# fazer a condicional

if [ $arquivo == 1 ];
then
    echo "O arquivo não existe, criando arquivo"
    # O comando 'touch' cria um arquivo, após 'touch' vem o caminho 
    touch /tmp/jandira/jandira.txt
fi

#------------------------------------------------------------------------------

# 6

# nome_da_variavel=$(comando "formula")
usuario=$(who | awk '{print $1}')

# nome_da_variavel=$(comando +"formula")
mes=$(date +"%m")

# O comando 'read' indica que o usuario precisa digitar algo,
# o comando '-p' faz que o codigo espera o 'enter' do usuario 

read -p "Digite o mês do seu aniversário: " aniversario;

# O comanda '-ge' é utilizado para numero, e ele verifica se o primeiro valor
# maior ou igual ao segundo

# fazer a condicional

if [ $aniversario -ge $mes ];
then
    # para fazer conta precisa colocar dentro de '$(())' 
	# precisa de dois parenteses pois o primeiro busca comandos integrados ao shell e o
    # segundo vai efetivamente fazer a conta
	
    echo "$usuario, falta $(($aniversario - $mes)) meses para o seu aniversário"
else
    echo "$usuario, falta $((12 - $aniversario)) meses para o seu aniversário"
fi

