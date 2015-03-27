#! /bin/bash
#
# Builds our Docker image using Docker-Compose.
# (requires sudo)
#
set -e

DOCKER='docker'
DOCKER_COMPOSE='docker-compose'
RUBY_RACER="gem 'therubyracer', platforms: :ruby"
COMMENT_STYLE="# "
GEMS='Gemfile'
DATABASE='database.yml'
CONFIG='config'
REMOVE='app bin config config.ru db Gemfile.lock .gitignore lib log public Rakefile README.rdoc test tmp vendor'

# Check dependencies.
command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }

cp ${GEMS} build_${GEMS}

# Create a bare rails app.
sudo docker-compose run web rails new . --force --database=postgresql --skip-bundle

sed -i "/${RUBY_RACER}/s/^${COMMENT_STYLE}//g" ${GEMS}

# Building the required images.
sudo docker-compose build

sudo chown -R ${USER} .
rm ${CONFIG}/${DATABASE}
cp ${DATABASE} ${CONFIG}/

yes | rm -r ${REMOVE}
mv build_${GEMS} ${GEMS}

cd ..
# Building our image.
sudo docker-compose build
cd -
