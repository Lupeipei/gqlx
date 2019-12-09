FROM ruby:2.4-stretch
MAINTAINER luciacachn@gmail.com
RUN apt-get update && apt-get install -y build-essential
RUN apk add --update --no-cache bash build-base nodejs sqlite-dev tzdata postgresql-dev yarn

# for JS
RUN apt-get install -y nodejs yarn

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn install --check-files

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . ./

EXPOSE 3003

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
