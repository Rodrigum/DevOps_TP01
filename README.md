# DevOps_TP01

## Why do we need a volume to be attached to our postgres container ?

Pour éviter de perdre les modifications faites à la base de donnée lorsque l'on ferme le terminal.

## Why do we need a multistage build ? And explain each steps of this dockerfile ?

Le build en multistage permet de build et de run l'application avec un seul fichier/pts d'entrée.

## Why do we need a reverse proxy ?
Pour permettre aux utilisateurs de n'avoir accès qu'au site web, sans pouvoir aller voir directement l'API ou la base de donnée. 

## Docker-compose most important commands
docker-compose up -d (containers[facultatif])
docker-compose down (containers)
docker-compose rm (containers)
docker-compose logs (containers)

## Why do we put our images into an online repository ?
Pour pouvoir y accéder depuis plusieurs PC différents et pour qu'une équipe puisse travailler dessus sans soucis

# TP02 :

## What are testcontainers?
Test library

## Document your Github Actions configurations
name: CI devops 2022 CPE
on:
  #to begin you want to launch this job in main and develop
  push:
    branches: #TODO
      - main
      - develop
  pull_request:
      
jobs:
  test-backend:
    runs-on: ubuntu-18.04
    steps:
      #checkout your github code using actions/checkout@v2.3.3
      - uses: actions/checkout@v2.3.3
      #do the same with another action (actions/setup-java@v2) that enable to setup jdk 11
      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'
          distribution: 'adopt'
      #finally build your app with the latest command
      - name: Build and test with Maven
        run: mvn clean verify --file ./simple-api/simple-api/pom.xml

## For what purpose do we need to push docker images?
Pour sauvegarder les modifications des images dockers et les utilisés sur n'importe quel poste.


# Notes : bdd

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

