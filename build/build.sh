#! /bin/bash
#
# Builds our docker image.
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

command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }

cp ${GEMS} build_${GEMS}

sudo docker-compose run web rails new . --force --database=postgresql --skip-bundle

# Uncomment racer line
sed -i "/${RUBY_RACER}/s/^${COMMENT_STYLE}//g" ${GEMS}

sudo docker-compose build

sudo chown -R ${USER} .
rm ${CONFIG}/${DATABASE}
cp ${DATABASE} ${CONFIG}/

yes | rm -r ${REMOVE}
mv build_${GEMS} ${GEMS}
