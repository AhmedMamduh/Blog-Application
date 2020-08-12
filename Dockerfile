FROM ruby:2.6.0

ENV HOME /home/rails/api

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs nodejs-legacy mysql-client vim
RUN mkdir /var/run/mysql

WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN gem install bundler:2.1.4
RUN bundle install

Add . $HOME

# Default command
ENTRYPOINT ["bundle", "exec"]
CMD ["bin/rake", "db:create"]
CMD ["bin/rake", "db:migrate"]
CMD ["rails", "server", "-b", "0.0.0.0"]