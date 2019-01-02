FROM ruby:2.2.2-slim

RUN apt-get update && apt-get install -qq -y build-essential nodejs

ENV INSTALL_PATH /nrtest
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile.lock Gemfile.lock
COPY Gemfile Gemfile
RUN bundle install

COPY . .

VOLUME ["$INSTALL_PATH/public"]

# Don't really care if this is a secret or not
ENV SECRET_KEY_BASE 41fe7f19796e5c68ef6d4bc21eb56686bcf2deafb8a26de284d1419908d4437816f0b3363cd3b11d2357fd266933222117e5d8d9ee06811e30e6d99176850545
ENV RAILS_ENV production
CMD ["bundle",  "exec", "rails", "s", "-b", "0.0.0.0"]

