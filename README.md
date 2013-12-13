Dans le cadre de la formation Master 1 ALMA de l' UFR Sciences et Techniques de Nantes, 
nous avons à réaliser une application avec google appengine, 
en utilisant les données de l'open data de Nantes.
***************************
Utilisation des jeux de donnée de l'open data : http://data.nantes.fr/donnees/detail/localisation-des-equipements-publics-relevant-du-theme-sports-loisirs-de-nantes-metropole/
***************************
Pour l'utilisation du datastore nous avons utilisé la bibliotèque objectify : https://code.google.com/p/objectify-appengine/wiki/Concepts?tm=6
***************************
***************************
Description Fonctionnelle
***************************
Lors de la première inscription l'utilisateur accepte les droits google
Ensuite on l'invite à renseigner ses préférences : 3 Sports et 3 Lieux, 1 sport pour chaque lieu
Il arrive sur la page d'acceuil, où l'on affiche les 5 activités qui auront lieux le plus rapidement dans le temps.
Il peut, créer une activité, mettre à jour ses préférences, et faire une recherche d'activité.
La création d'activité est divisé en 4 : activité, localisation, date, et places restantes.
La mise à jour des préférences est divisé en 6, 3 Sport, 3 Lieux, 1 sport pour chaque lieu
La recherche d'activité, en fonction d'un sport et d'un lieu.
***************************
WORKING
****************************
Connection a l'appli via compte google
Envoi de mail une fois l'inscription effectué
Inscritption d'un nouveau membre dans le datastore
Ajout des préférences d'un membre dans le datastore
Modification des préférences d'un membre dans le datastore
Création d'une activité dans le datastore :
	Utilisation des données de l'open data pour :
		- la ville de NANTES
		- les équipements publics
	Utilisation de Jquery pour la date et l'heure
	Modification du format de date, car nous utilisons la comparaison de chaine de charactère
Affichage des activités
Recherche d'activités par sport et lieu
Inscription d'un membre à une activité, ce qui décrémente le nombre de place et ajoute le membre à l'activité
Inscription une seul fois par activité
Envoi d'un mail lors de l'inscription à une activité.
Envoi de mail au membre ayant pour préférence le sport et le lieu, qui est défini lors de la création d'une activité(cronJobs)
Suppresion des activités qui ont eu lieu la veille(cronJob).
********************
NOT WORKING 
********************
Exception levé lors de l'envoi de mail dès la création de l'activité(mais l'activité est créer et le mail est envoyé !!! ),(http://blog.cloudme.org/2013/06/strange-exceptions-with-objectify-4-or-what-happens-if-you-query-unindexed-fields/)

(idée pour plus tard)
Ajout du nom de la personne qui a créer l'activité
Ajout d'une page avec une calendrier sur lequel il y a les activités auquels le membre c'est inscrit
Ajout d'une page avec une map google et les lieu de pratique de sport proposer sur NIS
Ajout d'un chat pour chaque activité créé, pour faciliter les préparatifs
Gestion des lieux en fonction du sport choisi.


By Galliot Grégory, Turbe Emmanuel.