Dans le cadre de la formation Master 1 ALMA de l' UFR Sciences et Techniques de Nantes, 
nous avons � r�aliser une application avec google appengine, 
en utilisant les donn�es de l'open data de Nantes.
***************************
Utilisation des jeux de donn�e de l'open data : http://data.nantes.fr/donnees/detail/localisation-des-equipements-publics-relevant-du-theme-sports-loisirs-de-nantes-metropole/
***************************
Pour l'utilisation du datastore nous avons utilis� la bibliot�que objectify : https://code.google.com/p/objectify-appengine/wiki/Concepts?tm=6
***************************
***************************

WORKING
Connection a l'appli via compte google
Inscritption d'un nouveau membre dans le datastore
Ajout des pr�f�rences d'un membre dans le datastore
Modification des pr�f�rences d'un membre dans le datastore
Cr�ation d'une activit� dans le datastore :
	Utilisation des donn�es de l'open data pour :
		- la ville de NANTES
		- les �quipements publics
	Utilisation de Jquery pour la date et l'heure
	Modification du format de date, car nous utilisons la comparaison de chaine de charact�re
Affichage des activit�es
Recherche d'activit�es par sport et lieu
Inscription d'un membre � une activit�e, ce qui d�cr�mente le nombre de place et ajoute le membre � l'activit�
Inscription une seul fois par activit�e
Envoi de mail au membre ayant pour pr�f�rence le sport et le lieu, qui est d�fini lors de la cr�ation d'une activit�e(cronJobs)
Suppresion des activit�es qui ont eu lieu la veille(cronJob).

NOT WORKING 
Exception lev� lors de l'envoi de mail d�s la cr�ation de l'activit�e,(http://blog.cloudme.org/2013/06/strange-exceptions-with-objectify-4-or-what-happens-if-you-query-unindexed-fields/)

(id�e pour plus tard)
Ajout du nom de la personne qui a cr�er l'activit�e
Ajout d'une page avec une calendrier sur lequel il y a les activit�es auquels le membre c'est inscrit
Ajout d'une page avec une map google et les lieu de pratique de sport proposer sur NIS
Ajout d'un chat pour chaque activit�e cr��, pour faciliter les pr�paratifs


By Galliot Gr�gory, Turbe Emmanuel.