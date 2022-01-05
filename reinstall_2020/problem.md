---
date: 2020/08/21
author: qkzk
title: nas problem

---

# Symptomes

Veut pas booter

configuation normale :

1. clé usb avec grub bootloader qui redirige vers le port sata optique
2. disque ssd dans le port sata optique avec debian 8
3. 4 disques 3to WD en raid 5

Déroulé normal

séquence de boot (floppy, usb, cd rom, réseau, dd)

1. boot sur le port usb et grub redirige vers le disque
2. ensuite cherche à se connecter au serveur DHCP 
3. ensuite boot sur le disque <--------------- fail >
4. (on n'arrive jamais ici) debian se lance etc.


# Tests

- [x] booter plein de fois
- [x] booter avec grub et chercher à booter à la main : je ne vois jamais les disques
- [x] booter directement sur les disques : ne fonctionne pas
- [x] booter sur une clé debian 9 : ça marche !
    il voit le disque ssd (debian 10 old install tour)
    je peux booter sur debian live usb avec le ssd dans son port sata habituel
    et le voir. J'ai accès à internet et à mes fichiers.
- [x] tester la clé usb sur une autre machine
- [x] tester encore dans un autre port sata...
- [ ] tester le ssd sur une autre machine
- [ ] relancer le process d'installation et tenter de booter sur un disque dur
    - [x] clé debian 10
    - [x] install debian 10 sur disque intel (le vieux)
    - [x] booter : marche pas
    - [x] bios enable sata AHCI
    - [x] boot jusqu'au bureau
    - [x] retry avec l'ancienne installation ...
    - [x] retry avec le boot depuis la clé usb vers le lecteur optique
    - [ ] retry avec l'ancienne configuration complète et ça marche pas
            impossible de booter avec plus d'un disque SATA.
    - [ ] j'ai l'impression qu'il n'essaie jamais de booter sur la clé usb...
        et pourtant ça marche avec une clé live. I DON'T UNDERSTAND

# Solutions selon probleme

1. le disque ssd est mort : racheter refaire :(
2. la clé usb est hs (bizarre, ça colle pas trop), en refaire une (je devrais pouvoir booter et c'est pas le cas)
3. le contrôleur sata est hs ???
