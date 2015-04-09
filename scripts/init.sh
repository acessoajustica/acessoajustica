#! /bin/bash
#
# Builds the Docker image using Docker-Compose,
# Wraps running bundler and rspec tests,
# Starts and Restarts the app;
# (requires docker, docker-compose and sudo privileges)
#
set -e

DOCKER='docker'
DOCKER_COMPOSE='docker-compose'

function check_deps {
    # Check dependencies.
    command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
    command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }
    return 0
}
function build_update {
    sudo docker-compose run web bundle update   # Updating gems.
    sudo docker-compose run web rake spec       # Runs tests.
}
function build_all {
    PROJECT_DIR=${PWD##*/}                      # Gets current dir name.
    sudo docker stop $(sudo docker ps -a -q)    # Stops old containers.
    sudo docker rm $(sudo docker ps -a -q)      # Remove old containers.
    rm ${GEMS}.lock                             # Purges the lock.
    sudo docker rmi ${PROJECT_DIR}_web:latest   # Removes old project image.

    sudo docker-compose build                   # Builds a new image.
    sudo docker-compose run web rake db:create  # Creates test database.
    sudo chown -R ${USER} .                     # Owns created files.
    sudo docker-compose run web rake db:migrate # Runs migrations.
    sudo docker-compose run web rake spec       # Runs tests.
}
function app_restart {
    sudo docker stop $(sudo docker ps -a -q)    # Stops old containers.
    sudo docker-compose up                      # Starts the app.
}
function app_run {
    sudo docker-compose up                      # Starts the app.
}
function app_migrate {
    sudo docker-compose run web rake db:migrate # Runs migrations.
}
function app_test {
    sudo docker-compose run web rake db:create  # Creates test database.
    sudo docker-compose run web rake spec       # Runs tests.
}
if check_deps; then
    [[ $1 == all ]] && build_all ||
    [[ $1 == update ]] && build_update ||
    [[ $1 == restart ]] && app_restart ||
    [[ $1 == run ]] && app_run ||
    [[ $1 == migrate ]] && app_migrate ||
    [[ $1 == test ]] && app_test ||
    { echo "No arguments, exiting."; exit 0; }
fi
