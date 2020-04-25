#!/bin/sh

#
# Ouvrir et fermer une partition encryptée correctement configurée (voir readme)
# avec une seule commande
#
# remplacer "user" par son nom d'utilisateur
# à la racine la partition contient un dossier appelé "mon_dossier"


if [ -L "/dev/mapper/robert" ] # le dossier est déjà monté
then
  echo "robert is opened."
  sudo umount /run/media/user/robert
  sudo cryptsetup close robert
  if [ -d "/run/media/user/robert/mon_dossier" ]
  then
    echo "something went wrong when closing mapper"
  else
    echo "robert closed correctly"
  fi
else
  echo "robert is closed"
  sudo cryptsetup open /dev/sdb robert
  sudo mount -t ext4 -o defaults /dev/mapper/robert /run/media/user/robert
  if [ -d "/run/media/user/robert/robert" ]
  then
    cd "/run/media/user/robert/robert"
    pwd
    echo "robert opened correctly"
  else
    echo "something went wrong when opening mapper"
  fi
fi
