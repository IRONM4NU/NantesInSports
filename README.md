Dans le cadre de la formation Master 1 ALMA de l' UFR Sciences et Techniques de Nantes, 
nous avons à réaliser une application avec google appengine, 
en utilisant les données de l'open data de Nantes.
***************************
Utilisation des jeux de donnée de l'open data : http://data.nantes.fr/donnees/detail/localisation-des-equipements-publics-relevant-du-theme-sports-loisirs-de-nantes-metropole/
***************************
Pour l'utilisation du datastore nous avons utilisé la bibliotèque objectify : https://code.google.com/p/objectify-appengine/wiki/Concepts?tm=6
***************************
***************************

WORKING
Connection a l'appli via compte google
Inscritption d'un nouveau membre dans le datastore
Ajout des préférences d'un membre dans le datastore
Modification des préférences d'un membre dans le datastore
Création d'une activité dans le datastore :
	Utilisation des données de l'open data pour :
		- la ville de NANTES
		- les équipements publics
	Utilisation de Jquery pour la date et l'heure
	Modification du format de date, car nous utilisons la comparaison de chaine de charactère
Affichage des activitées
Recherche d'activitées par sport et lieu
Inscription d'un membre à une activitée, ce qui décrémente le nombre de place et ajoute le membre à l'activité
Inscription une seul fois par activitée
Envoi de mail au membre ayant pour préférence le sport et le lieu, qui est défini lors de la création d'une activitée(cronJobs)
Suppresion des activitées qui ont eu lieu la veille(cronJob).

NOT WORKING 
Exception levé lors de l'envoi de mail dès la création de l'activitée,(http://blog.cloudme.org/2013/06/strange-exceptions-with-objectify-4-or-what-happens-if-you-query-unindexed-fields/)

(idée pour plus tard)
Ajout du nom de la personne qui a créer l'activitée
Ajout d'une page avec une calendrier sur lequel il y a les activitées auquels le membre c'est inscrit
Ajout d'une page avec une map google et les lieu de pratique de sport proposer sur NIS
Ajout d'un chat pour chaque activitée créé, pour faciliter les préparatifs


By Galliot Grégory, Turbe Emmanuel.