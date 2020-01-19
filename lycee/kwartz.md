
## Kwartz

**rdv avec dimitri jeudi 11 mai 2017**

* kwartz control : 172.16.0.253:9999 (local)
* logins de kwartz q.k.l

  - créer des images
  - admin
  - intégrer
  - supprimer

* Remonter une image depuis kwartz vers la machine locale ( = déployer)

    1. onglet réseau, poste client
  	2. cliquer modifier plusieurs postes
  	3. salle 113 - décocher le VP
  	4. cliquer : amorçage local - disque dur (sinon remonte l'image automatiquement) -> double choix au boot dans rembo
  	5. nommage des images : s113_typemachine_moisannee
  	6. appliquer

	les images sont stockées sur le serveur kwartz (ubuntu) /share/rembo/

* Remontée d'image dans REMBO

  * effacement disque
	*	clean le DD
	*	redl l'image sur le DD

  PB G PAS LES DROITS DS REMBO

* Création d'image dans Kwartz Control (image locale du PC local  VERS serveur de stockage des images kwartz)

  * Poste clients / images Rembo / meme nom, ok
	* rebooter le poste et elle sera crée
	* reprend celle du PC vers le serveur REMBO
	* Ensuite redéployer sur les postes

* Remarques sur les images :
	* limites de QUOTA a check dans kwartz control
	*	si alertes :

  		- suppression
			- compression

* Créer le meme profil pour tlm via windows enabler
	  necessite 2 comptes :
      * qk
			* modele (login modele, pwd : ldf)

	- programme, lancer windows enabler (systray mettre ON)
	- prop systeme avancée, profil, modele, copier dans c:\user\default
	- autoriser modif, TT LE MONDE\
	   OK, peut-être recommencer 2x !!!

	- recharger le profil par défaut

* avant de créer une image :

	* virer les comptes eleves
	* garder local
	* garder modele
	* garder winadmin
	* garder profil/default
	* virer le reste
