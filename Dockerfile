FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /acessoajustica
WORKDIR /acessoajustica
ADD Gemfile /acessoajustica/Gemfile
# PhantomJS
RUN bundle install --jobs 8
ADD . /acessoajustica
RUN mv lib/assets/phantomjs-1.9.8-linux-x86_64 /opt/
RUN ln -s /opt/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /bin/phantomjs
