/*
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
*/

CREATE TABLE public.departments
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE public.students
(
    id SERIAL PRIMARY KEY,
    department_id INT NOT NULL REFERENCES departments (id),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);