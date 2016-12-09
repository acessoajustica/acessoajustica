LabXP 2015: Acesso à Justiça
==============================

[![Build Status](https://img.shields.io/travis/acessoajustica/acessoajustica.svg)]
                (https://travis-ci.org/acessoajustica/acessoajustica)
[![Coverage Status](https://img.shields.io/coveralls/acessoajustica/acessoajustica.svg)]
                   (https://coveralls.io/r/acessoajustica/acessoajustica?branch=dev)
[![Dependency Status](https://img.shields.io/gemnasium/acessoajustica/acessoajustica.svg)]
                     (https://gemnasium.com/acessoajustica/acessoajustica)
[![Code Climate](https://img.shields.io/codeclimate/github/acessoajustica/acessoajustica.svg)]
                (https://codeclimate.com/github/acessoajustica/acessoajustica)
[![Scrutinizer](https://img.shields.io/scrutinizer/g/acessoajustica/acessoajustica.svg)]
               (https://scrutinizer-ci.com/g/acessoajustica/acessoajustica)
[![License](https://img.shields.io/github/license/acessoajustica/acessoajustica.svg)]
           (https://github.com/acessoajustica/acessoajustica/blob/master/LICENSE)

This repository contains a ruby on rails project for the
[Legal Department XI de Agosto](http://djonzedeagosto.org.br/). The project
started in the
[eXtreme Programming course of 2015](http://ccsl.ime.usp.br/wiki/LabXP2015) and continued
in the [eXtreme Programming course of 2016](http://ccsl.ime.usp.br/wiki/LabXP2016)
of the University of São Paulo.

## Dependencies ##

We use Docker and Compose, but still haven't hosted a Docker
image at DockerHub.

To get your dev environment up and running, simply follow the instructions to
install [Docker](https://docs.docker.com/installation/) and
[Compose](https://docs.docker.com/compose/install/) for your
operating system.

## Building and running ##

Get the source code:
```
git clone https://github.com/acessoajustica/acessoajustica.git
cd acessoajustica
```

Then make sure that the Docker daemon is running.

The bootstrap process is like any other Rails app, except that it is wrapped with
Docker, for maximum portability. Don't worry, we got [Alfredo](script/alfredo) to help us!

To run the app, you will have to:

1) Build your Docker images. As simple as

```
./script/alfredo build
```

This might take some time at the first run. It gets better, I promise.

2) Create the database

As usual at the early development stage at any Rails app. We have wrapped the usual `bundle exec` at Alfredo too.
To create the database:
```
./script/alfredo exec rake db:create
```

3) Run the migrations and seed the database

With the database created, run the migrations and seed your fresh tables:
```
./script/alfredo exec rake db:migrate
./script/alfredo exec rake db:seed
```

(As you can see, these are the usual [Rake tasks](http://guides.rubyonrails.org/command_line.html#db) for the database management. Any task should work, and if one
doesn't, you are encouraged to make it work and then contribute to this guide. You can always run the good old `rake db:reset` if you mess with the database schema
any time)

Finally you can start the app with
```
./script/alfredo run
```

The app container output should attach to your terminal, and you should see the server logs, along some database logs too. It should be running at http://localhost:3000/. Stop it with `ctrl+C`.

## Running tests ##
Before running tests, you must setup the test environment. Just repeat the setup steps changing the Rails environment:
```
./script/alfredo exec rake db:create RAILS_ENV=test
./script/alfredo exec rake db:migrate RAILS_ENV=test
./script/alfredo exec rake db:seed RAILS_ENV=test
```

### Unit tests ###

Run the unit tests with rspec:
```
./script/alfredo exec rake spec RAILS_ENV=test
```

You can run single unit tests, too. Just tell rspec which spec file you want to run. For example, to run
the Calouros Controller unit tests:
```
./script/alfredo exec rake spec SPEC=./spec/controllers/calouros_controller_spec.rb RAILS_ENV=test
```

### Acceptance tests ###

The acceptance tests should be ran with Cucumber:
```
./script/alfredo exec rake cucumber RAILS_ENV=test
```

## The Alfredo script ##

The `alfredo` script provides the following functionalities:

```
# Build Docker images
./script/alfredo build

# Stop and remove all containers
./script/alfredo clean

# Run the app on the latest container
./script/alfredo run

# Execute Rake tasks or commands at the app container
./script/afredo exec <command>
```

For more information, run the help option:

```
./script/alfredo help
```

## Troubleshooting

If docker fails to download images or the Ruby bundler
fail due to problems in the internet connection, we suggest that you restart the Docker daemon. Run:

```
sudo service docker restart
```

Or:

```
sudo systemctl restart docker.service
```

For more help, refer to https://docs.docker.com/compose/rails/.
