# Créer un disque encrypté

La procédure suivante vise à créer une partition non root entièrement encryptée

Elle s'inspire d'[archwiki](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_a_non-root_file_system)

## Étapes

1. préparer la partition en question.

  ```bash
  $ sudo gparted # parce que je suis un être humain
  ```

  1. Repérer le bon device (c'est mieux). Disons que c'est `/dev/sdb`
  2. Démonter et effacer la partition.
  3. Si elle contenant des données sensibles, les effacer proprement. Ce n'était
      pas mon cas, je n'ai pas fait
  4. Enregistrer, quitter.
2. Créer une partition encryptée


    ```bash
    $ sudo cryptsetup luksFormat /dev/sdb
    ```

    Confirmer et entrer un pashprhrase

3.  Choisir un nom pour cette partition disons : `robert`
4.  Ouvrir la partition encryptée

      ```bash
      $ sudo cryptsetup open /dev/sdb robert
      ```

      On demande le pashprhrase

5. Vérifier qu'elle est bien ouverte

    ```
    $ ls -lah  /dev/mapper
    drwxr-xr-x  2 root root      80 25 avril 16:23 .
    drwxr-xr-x 21 root root    3,9K 25 avril 16:23 ..
    crw-------  1 root root 10, 236 25 avril 16:23 control
    lrwxrwxrwx  1 root root       7 25 avril 16:23 robert -> ../dm-0
    ```


6. Formater.

    ```bash
    sudo mkfs.ext4 /dev/mapper/robert
    ```

7.  créer le point de montage, par exemple

    ```bash
    $ sudo mkdir /run/media/user/robert
    ```

8. Monter

    ```bash
    $ sudo mount -t ext4 -o defaults /dev/mapper/robert /run/media/user/robert
    ```

Et voilà.

## Usage courant

1. Ouvrir et monter avec :

```bash
$ sudo cryptsetup open /dev/sdb qqsd
$ sudo mount -t ext4 -o defaults /dev/mapper/qqsd /run/media/quentin/qqsd
```

2. Démonter et fermer avec :

```bash
$ sudo umount /run/media/user/robert
$ sudo cryptsetup close robert
```

## Script

le script fourni permet de faire les deux avec une seule commande.

Si c'est fermé, il ouvre et cd
Si c'est ouvert il ferme.

**Attention**, `cd` n'étant pas un _programme_ il faut exécuter :
**`$ source ouvrir_fermer.sh`**
