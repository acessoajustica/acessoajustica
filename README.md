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

If docker fails to download the images, or the ruby bundler
fail due to problems in the internet connection, you'll have
to restart the docker daemon. Run:

```
sudo service docker restart
```

Or:

```
sudo systemctl restart docker.service
```

Finally, apply the database migrations with:

```
sudo docker-compose run web rake db:migrate
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

Finally, run from the project's main directory:

```
sudo docker-compose up
```

The app should now be running at <code>localhost:3000</code>.

## Troubleshooting

Refer to https://docs.docker.com/compose/rails/.
