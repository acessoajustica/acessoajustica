#! /bin/bash
#
# Builds the Docker image using Docker-Compose,
# Wraps running bundler and rspec tests,
# Starts and Restarts the app;
# (requires docker, docker-compose and sudo privileges)
#

DOCKER='docker'
DOCKER_COMPOSE='docker-compose'
GEMS='Gemfile'

function check_deps {
    # Check dependencies.
    command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
    command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }
    return 0
}
function build_clean {
    sudo docker stop $(sudo docker ps -a -q)    # Stops old containers.
    sudo docker rm $(sudo docker ps -a -q)      # Remove old containers.
    sudo rm ./tmp/pid/server.pid
}
function app_restart {
    sudo docker stop $(sudo docker ps -a -q)    # Stops old containers.
    sudo docker-compose up                      # Starts the app.
}
function app_migrate {
    sudo docker-compose run web rake db:create  # Creates all databases.
    sudo docker-compose run web rake db:migrate # Runs migrations.
}
function app_test {
    app_migrate
    sudo docker-compose run web rake db:create  # Creates all databases.
    sudo docker-compose run web rake spec       # Runs tests.
}
function app_run {
    app_migrate
    sudo docker-compose run web rake db:seed    # Adds admin user.
    sudo docker-compose up                      # Starts the app.
}
function build_update {
    sudo docker-compose run web bundle update   # Updating gems.
    app_test
}
function build_all {
    PROJECT_DIR=${PWD##*/}                      # Gets current dir name.
    build_clean
    rm ${GEMS}.lock                             # Purges the lock.
    sudo docker rmi ${PROJECT_DIR}_web:latest   # Removes old project image.

    sudo docker-compose build                   # Builds a new image.
    app_test
}
if check_deps; then
    if [[ $1 == all ]]; then build_all;
    elif [[ $1 == update ]]; then build_update;
    elif [[ $1 == clean ]]; then build_clean;
    elif [[ $1 == restart ]]; then app_restart;
    elif [[ $1 == run ]]; then app_run;
    elif [[ $1 == migrate ]]; then app_migrate;
    elif [[ $1 == test ]]; then app_test;
    else { echo "No valid arguments, exiting."; exit 0; }
    fi
fi
