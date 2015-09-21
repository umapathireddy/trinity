FROM ruby:slim
MAINTAINER Duncan Rutland <duncan.rutland@gmail.com>

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 80
CMD ["bundle", "exec", "rackup", "-p 80"]
