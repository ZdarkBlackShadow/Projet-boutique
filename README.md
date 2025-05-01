# Projet-boutique

## Prérequis

- Git
- nodeJs
- LAMPP/XAMPP

## Installation

```bash
git clone https://github.com/ZdarkBlackShadow/Projet-boutique.git
```

```bash
cd backend
```

```bash
npm run installDependencies
```

### Instalation de la base de donnée

Dans phpMyAdmin, vous créer une nouvelle base de donnée que vous appellez test2 et en latin1_bin, puis vous importez le ficher database.sql qui se trouve dans le ficher database de ce repo.

Maintenant vous créer un nouvel utilisateur que vous appelerez 'nati' avec comme mot de passe : hgnvouihbo6465:4. Puis vous éxécuterez la commande suivante

```bash
GRANT ALL PRIVILEGES ON *.* TO 'nati'@'localhost' IDENTIFIED BY 'hgnvouihbo6465:4' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

## Lancement

```bash
cd backend && npm run start
```

## Commande pour lancer et arreter xampp sur linux

```bash
sudo /opt/lampp/xampp start
```

```bash
sudo /opt/lampp/xampp stop
```