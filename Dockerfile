FROM ruby:2.4-stretch
MAINTAINER luciacachn@gmail.com
RUN apt-get update
# RUN apt-get install -y bash build-base nodejs sqlite-dev tzdata postgresql-dev yarn

# for JS
RUN apt-get install -y bash nodejs yarn


RUN mkdir -p /app
COPY . /app
WORKDIR /app

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
