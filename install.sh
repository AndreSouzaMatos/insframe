#!/bin/bash
pasta=$(pwd)
verificar_integridade()
{
	
	if [ ! -d frameworks ]
	then
		echo "false"
	else
		if [ ! -d bin ]
		then
			echo "false"
		else
			echo 'true'
		fi
	fi
}
criando_pasta()
{
	cd ~/
	if [ ! -d .frameworks ]
	then
		echo "criando pasta dos frameworks"
		mkdir .frameworks
		
	fi
	$(cp -r $pasta/frameworks/* ~/.frameworks/)
}
instalando_bin()
{
	echo "instalando o bin"
	cd /bin/
	sudo cp $pasta/bin/insframe /bin/insframe
}
instalar()
{
	ok=$( verificar_integridade )
	echo 'verificando integridade dos arquivos'
	if [ $ok == "false" ]
	then
		echo 'integridade comprometida...'
		echo 'finalizando'
		
	else
		echo 'integridade confirmada'
		echo 'continuando...'
		criando_pasta
		instalando_bin
	fi
}
instalar
