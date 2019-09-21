# Débuter avec ansible

# Installation

## avec pamac

Sous arch / manjaro : dans pamac j'ai tout installé sauf 3 trucs

* python-pywinrm: connect to Windows machines
* python-ovirt-engine-sdk: trucs pour la virtualisation avec redhat, j'ai rien compris
* python-boto3: aws_s3 module

## tester l'installation

~~~sh
ansible --version
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/quentin/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.7.4 (default, Jul 16 2019, 07:12:58) [GCC 9.1.0]
~~~

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

## Les hosts

Ansible utilise une liste de machines pour communiquer
Il est préférable de se logguer directement sur les machines.

Pour ça il faut configurer correctement le fichier hosts

Exemple : [hosts](hosts)

Ensuite on doit configurer ssh

Pour chaque machine : [ssh login without password](http://www.linuxproblem.org/art_9.html)

Attention aux permissions sur les fichiers, bien s'assurer que personne ne peut les lire (`chmod 600 hosts`)


## Ansible

**Dans /etc/ansible/ansible.cfg**

2 choses à éditer :

* `inventory      = /home/quentin/gdrive/dev/linux-misc/ansible/hosts`
* `roles_path    = /home/quentin/gdrive/dev/linux-misc/ansible/roles`

# Quelques commandes

## ping

### les rpi
~~~sh
ansible -m ping rpi --one-line
~~~

### Tout le monde
~~~sh
ansible -m ping all --one-line
~~~

## uptime

### les rpi
~~~sh
ansible rpi -m command --args "uptime" --one-line
~~~

## tout le monde
~~~ sh
ansible all -m command --args "uptime" --one-line
~~~

## Utiliser un recipe :

### Recipe user normal
~~~sh
ansible-playbook /home/quentin/gdrive/dev/linux-misc/ansible/roles/qnas_motion.yml
~~~

### Recipe sudo
~~~sh
ansible-playbook /home/quentin/gdrive/dev/linux-misc/ansible/roles/qnas_motion.yml --ask-become-pass
ansible-playbook ~/gdrive/dev/linux-misc/ansible/roles/emby_docker_ps.yml --ask-become-pass
~~~
