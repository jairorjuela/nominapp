FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /nominapp_test
WORKDIR /nominapp_test
COPY Gemfile /nominapp_test/Gemfile
COPY Gemfile.lock /nominapp_test/Gemfile.lock
RUN bundle install
COPY . /nominapp_test
