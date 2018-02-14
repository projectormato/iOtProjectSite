FROM ruby:2.5.0
MAINTAINER uutarou <kota.kaicho@gmail.com>

ENV PORT 8000

WORKDIR /jekyll

ADD ./Gemfile .
ADD ./Gemfile.lock .
ADD ./*.gemspec .

RUN bundle install --path vendor/bundle

ADD . .

RUN bundle exec jekyll build

CMD ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => "./_site", :Port => ENV["PORT"]).start'