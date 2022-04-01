#!/bin/bash

#Script pour importer ou exporter une base de donée pour le projet Furet du nord

echo "! Vous devez être en root pour que le script marche ! !"
echo "Que souhaitez-vous faire ?"
echo "------------------------------"
echo "|[1] Importer base de donnée |"
echo "|[2] Exporter base de donnée |"
echo "|[3] Quitter le programme    |"
echo "------------------------------"
read reponse
valide=false;
while [ "$valide" = false ];do
	if [ "$reponse" == 1 ];then 
		valide=true
		#Installation de mariadb 
		apt install mariadb-server
		echo "Indiquez le chemin ou ce trouve la base de donnée (/home/eleve/..)"
		read chemin
		echo "Indiquez le nom du fichier SQL(nomduficher.sql)"
		read bdd
		cd $chemin
		mysql -e "GRANT ALL PRIVILEGES ON furet.* to 'furet'@localhost identified by 'btsinfo';"
		mysql -e "Create database if not exists furet;"
		mysql -h localhost -u root -btsinfo furet < $bdd
	elif [ "$reponse" == 2 ]
	then
		valide=true
		echo "Indiquez le nom de la base de donnée"
		read resp
		mysqldump $resp > $resp.sql
	elif [ "$reponse" == 3 ]
	then
		valide=true
	else
		echo "Saisir une valeur valide"
		read reponse
	fi
done

