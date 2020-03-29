---
  title: Mattermost
  subtitle: Installer et configurer un sereur Mattermost
  author: qkzk
  date: 2020/03/29
---

# Mattermost

Mattermost est une alternative à Slack. Il peut aussi servir d'alternative
à discord


Ce tutoriel vise à installer Mattermost avec **DOCKER** il ne s'applique qu'à
cette méthode.

Le container Docker fourni par mattermost intègre déjà NGINX, il est donc
inutile d'installer nginx par dessus.

## Maintenance

Se fait entièrement via **[docker-compose](https://docs.docker.com/compose/)**

* arrêter avec `$ docker-compose stop`
* relancer avec `$ docker-compose up -d` (detach)
* statut avec `$ docker-compose ps` et `docker-compose network ls`

## Machine

* Machine virtuelle sous virtual box avec debian 9
* docker
* mattermost docker (ave docker compose)

## Installation de mattermost

[Mattermost Docker](https://docs.mattermost.com/install/prod-docker.html)

### Production Docker Setup on Ubuntu

1. Install Docker using the [Ubuntu online guide](https://docs.docker.com/installation/ubuntulinux/) or these instructions:

    ```bash
    sudo apt-get update
    sudo apt-get install wget
    wget -qO- https://get.docker.com/ | sh
    sudo usermod -aG docker <username>
    sudo service docker start
    newgrp docker
    ```

2. Install Docker Compose using [the online guide](https://docs.docker.com/compose/install/). You have to download the latest release from the Docker Compose Github page and put the binary on your /usr/local/bin folder. Usually, you can use the following command, replacing $dockerComposeVersion with the Docker Compose version to install:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

3. Deploy the Mattermost Production Docker setup by running:

  ```bash
  sudo apt-get install git
  git clone https://github.com/mattermost/mattermost-docker.git
  cd mattermost-docker
  docker-compose build
  mkdir -pv ./volumes/app/mattermost/{data,logs,config,plugins,client-plugins}
  sudo chown -R 2000:2000 ./volumes/app/mattermost/
  docker-compose up -d
  ```

4. Configure TLS by following [the instructions](https://github.com/mattermost/mattermost-docker#install-with-ssl-certificate).

5. Configure Email by following the [SMTP email setup guide](http://docs.mattermost.com/install/smtp-email-setup.html).

## Hostname

[Attribuer un nom de machine](https://debian-handbook.info/browse/fr-FR/stable/sect.hostname-name-service.html)

## SSL

### Résumé :

**Install with SSL certificate**

Put your SSL certificate as `./volumes/web/cert/cert.pem` and the private key that has
no password as `./volumes/web/cert/key-no-password.pem`.
If you don't have them you may generate a self-signed SSL certificate.

---

### En plus clair

Les certificats sont fournis par [letsencrypt = cerbot](https://certbot.eff.org/)

Il faut penser à copier les bons fichiers au bon endroit

Le post [qui m'a sauvé](https://forum.mattermost.org/t/mattermost-recipe-using-lets-encrypt-for-tls-certificates-with-mattermost-docker/7596)

Il suffit de le suivre jusqu'au bout.

**Remarque** c'est `--standalone` avec **2** tirets

### Validité des certificats

Attention les certificats ne sont valables qu'un mois.
Il faut les [renouveler](https://community.letsencrypt.org/t/how-to-automatically-renew-certificates/4393)

> You can also add that command to your crontab:
>
> `$ sudo crontab -e`
>
> ```bash
> # Add this to the crontab and save it:
> * 7,19 * * * certbot -q renew
> ```



## email

Les emails servent essentiellement à la réinitialisation des MDP

* Le FAI semble bloquer le serveur mail que j'ai mis en place... Enfin quand il veut. Parfois ça passe, parfois non...
* Donc on utilise les mails de gmail :( à défaut d'une meilleure solution

**steps**

1. choisir une adresse `email@gmail`, paramètres du compte, donner un mot de passe d'application
2. configurer avec :

  * `smtp.gmail.com`
  * port: `465`
  * email@gmail.com
  * Connexion sécurisée : TLS



## Configuration de mattermost

**console système**

* serveur web :

  * url du site: l'url de votre domaine `mattermost.exemple.com`

* paramètres linguistiques

  * langue par défaut du serveur : `Français`
  * langue par défaut du client : `Français`
  * langues disponibles: `Français`, `English`

* utilisateurs et équipe

  * autoriser la création d'équipes : `non`
  * nb max d'utilisateurs par équipes: `100`
  * nombre max de canaux par équipe : `2000`
  * permettre aux users d'ouvrirs des MP avec : `tous les membres de l'équipe`
  * autoriser les admins d'équipe à modifier les messages des autres users: `oui`

* messages

  * activer le rendu latex : **`oui`** :) yeah

## Source

Merci MM pour m'avoir lancé là dessus :)
