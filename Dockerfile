# base on latest ruby base image
FROM ruby:2.1.2

# update and install dependencies
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential libpq-dev nodejs apt-utils

RUN /sbin/ip route|awk '/default/ { print $3 }' > /etc/host_ip

# setup app folders
RUN mkdir /webapp
WORKDIR /webapp

# copy over Gemfile and install bundle
ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock
RUN bundle install
 
# copy over remaining app files
#ADD webapp/ /webapp
VOLUME /webapp
VOLUME /webapp/log

