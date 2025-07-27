# Backup 

La quête quasi eternelle d'une solution fiable de backup.

Solution actuelle :

- rclone -> google drive
- nextcloud SH 
- syncthing entre différent appareils
- google photo 
- restic
- script de backup git 

## rclone 

Google drive ne propose pas de client linux officiel. Il faut utiliser des solutions extérieures.
rclone permet de sync des dossiers locaux vers des clouds distants.

Je sync 2 trucs : mes cours & le code vers 2 dépôts différents 

## nextcloud

Je sync les mêmes dossiers que sur rclone ainsi que les calendriers

## syncthing 

Syncthing est un logiciel P2P de synchronisation entre différentes machines

Je sync mes photos de mon tel avec deux dossiers : sur mon ordi principal et mon nas. Le tel envoie les photos aux deux machines 

## Google Drive 

Je sync aussi mes photos sur google photo

## restic 

Restic permet de faire des snapshots de certains dossiers et ensuite de les monter comme des disques

Les snapshots sont faits tous les jours à 3h

## backup git 

Puisque j'ai beaucoup de dépôts sur github, je fais des backup de tous les dépôts sur 2 machines ainsi que sur gitlab


# Pourquoi autant de solutions différentes ?

Les usages ne sont pas les mêmes

Les snapshots permettent de retrouver un fichier effacé par erreur.

Cela permet aussi d'avoir 3 niveaux de sécurité différents en alternant les solutions.

Si l'une échoue, les autres existent toujours.

Enfin, j'emploie 2 machines (certes proches physiquement mais différentes) et du cloud. Perdre l'une ou perdre même ma maison ne me fera pas perdre mes fichiers.

# Détails

## restic

Fait via un cronjob à 3h

```cron 
0 3 * * * su quentin -c "restic --repo /home/quentin/nfs/backup/restic --verbose backup /home/quentin/gdrive /home/quentin/gclem --password-file /home/quentin/.config/restic_password > /var/log/restic_gclem.log"
```

## rclone 

Fait via un cronjob à 4h et 5h

```cron 
0 4 * * * su quentin -c "rclone copy /home/quentin/gdrive gdrive: --transfers 32 --progress --exclude-from /home/quentin/.config/rclone/gdrive_exclude.conf --delete-excluded"
0 5 * * * su quentin -c "rclone copy /home/quentin/gclem gclem: --transfers 32 -P --exclude-from ~/.config/rclone/gclem_exclude.conf"
```

## github 

```cron 
0 2 * * * su quentin -c "/usr/bin/sh /home/quentin/scripts/backup_git_qkzk.sh"
30 2 * * * su quentin -c "/usr/bin/python /home/quentin/gclem/dev/python/linux_utils/github_gitlab/push_to_second_origin.py"
```

et 

```cron 
0 1 * * * /usr/bin/bash /home/quentin/backup_git_qkzk.sh
```

## nextcloud

Détaillé dans un dépôt différent

## syncthing 

Suivi les tutos 

Attention je m'en sers pour "descendre" les fichiers. Lorsqu'on ajoute depuis la "source", il faut vérifier dans la "cible" qu'elle ne peut éditer les fichiers.

Autre probleme, bien faire attention au dossier de destination.

# Testé et abandonné 

- urbackup: usine à gaz. Très puissant, une fois **bien configuré** alors c'est merveilleux. Problème, peut foirer sans trop de raison compréhensible. Abandonné et testé plusieurs fois (2016, 2019, 2021, 2022, 2024, 2025 lol)...

beaucoup d'autres solutions testées et abandonnées. Généralement parce que je ne comprenais rien.
