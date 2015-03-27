#! /bin/bash
#
# Builds our docker image.
#
set -e

DOCKER='docker'
DOCKER_COMPOSE='diocker_compose'
RUBY_RACER="gem 'therubyracer', platforms: :ruby"
GEMS='Gemfile'

command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }

docker-compose web rails new . --force --database=postgresql --skip-bundle
# Uncomment racer line
docker-compose build
# Replace database.yml
docker-compose up
# Create db in another terminal
