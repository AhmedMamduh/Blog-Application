FROM ruby:2.6.6

ENV BUNDLER_VERSION=2.1.4
ENV LANG=C.UTF-8

ENV HOME /home/rails/api

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.1.4
RUN bundle install
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
RUN bundle exec rails db:seed

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]