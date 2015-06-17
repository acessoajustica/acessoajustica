FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /acessoajustica
WORKDIR /acessoajustica
ADD Gemfile /acessoajustica/Gemfile
RUN bundle install --jobs 8
ADD . /acessoajustica
# PhantomJS
ENV PHANTOMJS_VERSION 1.9.7
RUN wget --no-check-certificate -q -O - https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 | tar xjC /opt
RUN ln -s /opt/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /bin/phantomjs
