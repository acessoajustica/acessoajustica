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
./scripts/init.sh all
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

Finally, run:

```
./scripts/init.sh run
```

## The init script

The ```init.sh``` script provides the following functionalities:

```
# Builds the image from scratch, creates a new Gemfile.lock, runs all tests.
./scripts/init.sh all 

#  Runs bundle update, does not remove containers nor Gemfile.lock, runs all tests and migrations.
./scripts/init.sh update

# Stops and removes all containers.
./scripts/init.sh clean

# Restarts the app container if its running, starts it otherwise.
./scripts/init.sh restart

# Runs migrations and starts the app container.
./scripts/init.sh run

# Runs the migrations.
./scripts/init.sh migrate

# Runs all migrations and tests.
./scripts/init.sh test
```

The app runs at ```localhost:3000```.

## Troubleshooting

Refer to https://docs.docker.com/compose/rails/.

## Bootstrap

### Installing

docker-compose run web rails generate bootstrap:install less

docker-compose run web rails generate bootstrap:install static

docker-compose run web rails g bootstrap:layout Haml

### Using

docker-compose run web rails g bootstrap:themed [RESOURCE_NAME]

