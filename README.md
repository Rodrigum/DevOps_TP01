# DevOps_TP01

##Why do we need a volume to be attached to our postgres container ?

Pour éviter de perdre les modifications faites à la base de donnée lorsque l'on ferme le terminal.

##Why do we need a multistage build ? And explain each steps of this dockerfile ?

Le build en multistage permet de build et de run l'application avec un seul fichier/pts d'entrée.

##Why do we need a reverse proxy ?
Pour permettre aux utilisateurs de n'avoir accès qu'au site web, sans pouvoir aller voir directement l'API ou la base de donnée. 

##Docker-compose most important commands
docker-compose up -d (containers[facultatif])
docker-compose down (containers)
docker-compose rm (containers)
docker-compose logs (containers)

##Why do we put our images into an online repository ?
Pour pouvoir y accéder depuis plusieurs PC différents et pour qu'une équipe puisse travailler dessus sans soucis
#Notes : bdd

Pour que la connection fonctionne :
    - newgrp docker
    - build le docker (docker build -t rodrigum/bdd .) //dans le fichier courant du Dockerfile (pas oublier de se connecter)
    - créer un network (docker network create bdd)
    - ensuite faire tourner le docker avec : docker run --net bdd --p 5432:5432 -d rodrigum/bdd
    - se connecter av/data_bddec visual ou db beaver
    /!\ Création de volume pour ne pas perdre les infos /!\
    - docker volume create vol-bdd
    - docker run --net bdd --p 5432:5432 -v /fs03/share/users/matteo.rodriguez/home/DevOps_TP01/Database:vol-bdd -d rodrigum/bdd
    => NB : le path a été remplacé par /test parce qu'on as manifestement pas les droits de le mettre ailleurs

