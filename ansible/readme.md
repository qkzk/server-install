# Débuter avec ansible

# Installation

## avec pamac

Sous arch / manjaro : dans pamac j'ai tout installé sauf 3 trucs

* python-pywinrm: connect to Windows machines
* python-ovirt-engine-sdk: trucs pour la virtualisation avec redhat, j'ai rien compris
* python-boto3: aws_s3 module

## Echec de l'installation

si l'installation foire parce que des librairies Python sont déjà là faut les virer

On teste d'abord qu'il n'y a rien de bizarre

~~~bash
pacman -Qo /usr/lib/python3.6/site-packages/pip/_internal/vcs/git.py
~~~

Normalement, personne ne s'en sert.

Copier tous les fichiers dans un fichier :`fichiers_relous` et les dégager tous d'un coup

Bien enlever tous les espaces, juste un nom de fichier par ligne

~~~bash
xargs rm -rfv <fichiers_relous.txt
~~~

**Sources**

* [manjaro forum](https://forum.manjaro.org/t/failed-to-commit-transaction-due-to-python-conflict/49818)
* [stack overflow](https://stackoverflow.com/a/21301892)

# Documentation

* [debuter](https://linuxfr.org/users/skhaen/journaux/deploiement-et-automatisation-avec-ansible-partie-1)
* [documentation officielle](https://docs.ansible.com/)
* [tuto youtube](https://www.youtube.com/playlist?list=PLFiccIuLB0OiWh7cbryhCaGPoqjQ62NpU)

# Configurer

Dans /etc/ansible/ansible.cfg

2 choses à éditer :

* `inventory      = /home/quentin/gdrive/dev/linux-misc/ansible/hosts`
* `roles_path    = /home/quentin/gdrive/dev/linux-misc/ansible/roles`

# ping

## les rpi
ansible -m ping rpi --one-line

## Tout le monde
ansible -m ping all --one-line

# uptime

# les rpi
ansible rpi -m command --args "uptime" --one-line

# tout le monde
ansible all -m command --args "uptime" --one-line

# Utiliser un recipe :

## Recipe user normal
ansible-playbook /home/quentin/gdrive/dev/linux-misc/ansible/roles/qnas_motion.yml

## Recipe sudo
ansible-playbook /home/quentin/gdrive/dev/linux-misc/ansible/roles/qnas_motion.yml --ask-become-pass
ansible-playbook ~/gdrive/dev/linux-misc/ansible/roles/emby_docker_ps.yml --ask-become-pass
