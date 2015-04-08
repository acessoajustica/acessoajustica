# LabXP 2015: Acesso à Justiça 

This repository contains a ruby on rails project for the
[Legal Department XI de Agosto](http://djonzedeagosto.org.br/). The project 
started in the 
[eXtreme Programming course of 2015](http://ccsl.ime.usp.br/wiki/LabXP2015), 
of the University of São Paulo.

## Dependencies

We use Docker and Compose, but still haven't hosted a Docker 
image at DockerHub.
To get your dev environment up and running, simply follow the instructions to 
install [Docker](https://docs.docker.com/installation/) and 
[Compose](https://docs.docker.com/compose/install/) for your
operating system. Then get sure that the Docker daemon is running and 
finally, run:

```
git clone https://github.com/acessoajustica/acessoajustica.git
cd acessoajustica/build
./build.sh
```

## Running the App

First, stop and remove all docker containers:

```
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
```

Then, remove the latest image of the project:

```
sudo docker rmi acessoajustica_web
```

From the project's main directory, run:

```
sudo docker-compose up
```

The app should now be running at <code>localhost:3000</code>.

## Bootstrap

### Installing

docker-compose run web rails generate bootstrap:install less

docker-compose run web rails generate bootstrap:install static

docker-compose run web rails g bootstrap:layout Haml

### Using

docker-compose run web rails g bootstrap:themed [RESOURCE_NAME]

## Troubleshooting

Refer to https://docs.docker.com/compose/rails/.
