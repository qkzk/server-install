---
title: AERC - Client mail
subtitle: Cheatsheet
author: qkzk + chatGPT
date: 2026-01-14
theme: metropolis
geometry: "margin=1.5cm"

---
# aerc – Cheatsheet d’usage courant

## Sources

[Blog](https://bence.ferdinandy.com/2023/07/20/email-in-the-terminal-a-complete-guide-to-the-unix-way-of-email/)


## Principes généraux

* aerc est **entièrement piloté au clavier**
* Les commandes commencent par `:` (mode commande, comme Vim)
* Les raccourcis dépendent du **contexte** (liste de messages, vue message, composer, etc.)
* Les “labels” au sens Gmail n’existent pas : on utilise des **dossiers (mailboxes)** ou des **tags** (si backend compatible, ex. Notmuch)

---

## Navigation globale

### Se déplacer

| Action                     | Raccourci           |
| -------------------------- | ------------------- |
| Monter / descendre         | `j` / `k`           |
| Page suivante / précédente | `Ctrl-d` / `Ctrl-u` |
| Aller au premier message   | `gg`                |
| Aller au dernier message   | `G`                 |
| tab suivant                | `Ctrl-n`            |
| tab précédent              | `Ctrl-p`            |

### Changer de dossier

| Action                       | Commande    |
| ---------------------------- | ----------- |
| Lister les dossiers          | `:cf`       |
| Aller dans un dossier        | `:cd INBOX` |
| Revenir au dossier précédent | `:cd -`     |

---

## Rafraîchissement

| Action                        | Raccourci / Commande |
| ----------------------------- | -------------------- |
| Rafraîchir le dossier courant | `:check-mail`        |
| Rafraîchir tous les comptes   | `:check-mail -a`     |

---

## Lecture des messages

### Ouvrir / fermer

| Action             | Raccourci |
| ------------------ | --------- |
| Ouvrir le message  | `Enter`   |
| Revenir à la liste | `q`       |

### Dans la vue message

| Action                      | Raccourci            |
| --------------------------- | -------------------- |
| Message suivant / précédent | `J` / `K`            |
| Faire défiler               | `j` / `k`            |
| Ouvrir une pièce jointe     | `Enter` sur la pièce |
| Sauver une pièce jointe     | `S`                  |

---

## Marquage et états

| Action                    | Raccourci |
| ------------------------- | --------- |
| Marquer comme lu / non lu | `l`       |
| Marquer pour suppression  | `d`       |
| Annuler la suppression    | `u`       |
| Appliquer les changements | `:commit` |

---

## Nouveau message

### Composer

| Action                          | Raccourci / Commande       |
| ------------------------------- | -------------------------- |
| Nouveau message                 | `:compose`                 |
| Nouveau message (compte précis) | `:compose -a account_name` |

### Dans l’éditeur (vim / nvim par défaut)

| Action             | Raccourci |
| ------------------ | --------- |
| Envoyer le message | `:wq`     |
| Abandonner         | `:q!`     |

---

## Répondre / transférer

| Action                  | Raccourci |
| ----------------------- | --------- |
| Répondre à l’expéditeur | `r`       |
| Répondre à tous         | `R`       |
| Transférer              | `f`       |

---

## Suppression et déplacement (équivalent “labels”)

### Déplacer un message (approche dossiers)

| Action                   | Commande        |
| ------------------------ | --------------- |
| Déplacer vers un dossier | `:move Archive` |
| Copier vers un dossier   | `:copy Archive` |

### Supprimer

| Action           | Raccourci |
| ---------------- | --------- |
| Marquer supprimé | `d`       |
| Valider          | `:commit` |

---

## Recherche

### Recherche simple

| Action                | Commande              |
| --------------------- | --------------------- |
| Recherche plein texte | `:search mot`         |
| Sujet                 | `:search subject:foo` |
| Expéditeur            | `:search from:alice`  |
| Destinataire          | `:search to:bob`      |

### Navigation dans les résultats

| Action                       | Raccourci    |
| ---------------------------- | ------------ |
| Résultat suivant / précédent | `n` / `N`    |
| Quitter la recherche         | `:search -c` |

---

## Tags (si backend compatible, ex. Notmuch)

| Action           | Commande           |
| ---------------- | ------------------ |
| Ajouter un tag   | `:tag +work`       |
| Supprimer un tag | `:tag -work`       |
| Lister par tag   | `:search tag:work` |

---

## Comptes

### Ajouter un compte

Les comptes se configurent dans :

```text
~/.config/aerc/accounts.conf
```

Exemple minimal :

```ini
[IMAP]
source = imaps://user@mail.example.com
outgoing = smtps://user@mail.example.com
default = INBOX
from = User <user@mail.example.com>
```

Puis recharger :

```text
:reload
```

---

## Contacts / Adresses

* aerc **n’intègre pas de carnet d’adresses natif**
* Utilise :

  * `abook`
  * `khard`
  * ou l’auto-complétion via les mails précédents
* L’auto-complétion fonctionne dans les champs `To`, `Cc`, `Bcc`

---

## Raccourcis utiles divers

| Action              | Raccourci |
| ------------------- | --------- |
| Aide contextuelle   | `?`       |
| Quitter aerc        | `:quit`   |
| Recharger la config | `:reload` |

---

## Fichiers de configuration clés

| Fichier         | Rôle                  |
| --------------- | --------------------- |
| `aerc.conf`     | Configuration globale |
| `accounts.conf` | Comptes mail          |
| `binds.conf`    | Raccourcis clavier    |
| `stylesets/*`   | Thèmes                |

---

## Philosophie à retenir

* **Dossiers > labels**, sauf avec Notmuch
* Workflow proche de **mutt / vim**
* Tout est scriptable et configurable
* Idéal pour IMAP + SMTP classiques

