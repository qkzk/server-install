Dans KWARTZ CONTROL

~~~
172.16.0.253:9999
~~~

## PROXY

*	kwartz - réseau - raspberry (groupe)

	-> accès web externe : autorisé non filtré

*	ajouter 1 rapsberry \
		2 options

	- si la machine est connectée ethernet
		inscription automatique detectée > regler l'ip
		autorisé non filtré, MAJ

	- si on connait mac adress
		ajouter poster groupe, aucun, raspberry, OK
		nom machine (OSEF), carte réseau lan 1, ip à taper 172.16.x.x, MAC
		autorisé non filtré, MAJ

	- POUR l'INSTANT APTGET BLOQUE

## SECURITE PARE FEU

ne pas toucher au reste !!!!


ouvrir nouveau service
nom : rasptruchmuche, protocole tous
décocher kwartz

1. RAS,
2. RAS,
3. cocher "ouvrir également ce service en sortie pour" UNIQUEMENT CETTE MACHINE

	attention sinon faille de sécurité

maintenance du serveur > controle espace disque > espace disponible sur kwartz
