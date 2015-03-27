FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /acessoajustica
WORKDIR /acessoajustica
ADD Gemfile /acessoajustica/Gemfile
RUN bundle install --jobs 8
ADD . /acessoajustica
