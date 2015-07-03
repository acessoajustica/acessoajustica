LabXP 2015: Acesso à Justiça
==============================

[![Code Climate](https://codeclimate.com/github/acessoajustica/acessoajustica/badges/gpa.svg)](https://codeclimate.com/github/acessoajustica/acessoajustica)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/acessoajustica/acessoajustica/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/acessoajustica/acessoajustica/?branch=dev)
[![Build Status](https://travis-ci.org/acessoajustica/acessoajustica.svg?branch=dev)](https://travis-ci.org/acessoajustica/acessoajustica)
[![Coverage Status](https://coveralls.io/repos/acessoajustica/acessoajustica/badge.svg?branch=dev)](https://coveralls.io/r/acessoajustica/acessoajustica?branch=dev)
[![Dependency Status](https://gemnasium.com/acessoajustica/acessoajustica.svg)](https://gemnasium.com/acessoajustica/acessoajustica)
[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/acessoajustica/acessoajustica/blob/master/LICENSE)

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
./script/alfredo build
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
./script/alfredo run
```

## The alfredo script

The ```alfredo``` script provides the following functionalities:

```
# Builds the image from scratch, creates a new Gemfile.lock, runs all tests.
./script/alfredo build

#  Runs bundle update, does not remove containers or Gemfile.lock, runs all tests and migrations.
./script/alfredo update

# Stops and removes all containers.
./script/alfredo clean

# Restarts the app container if its running, starts it otherwise.
./script/alfredo restart

# Runs migrations and starts the app container.
./script/alfredo run

# Runs the migrations.
./script/alfredo migrate

# Runs unit and acceptance tests.
./script/alfredo test
```
For more information, run the help option:
```
./script/alfredo help
```

The app runs at ```localhost:3000```.

## Troubleshooting

Refer to https://docs.docker.com/compose/rails/.

