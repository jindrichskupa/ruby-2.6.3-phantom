FROM ruby:2.6.3

MAINTAINER Jindrich Skupa <jindrich.skupa@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y \
  wget gnupg apt-transport-https && \
  echo "deb https://deb.nodesource.com/node_12.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_12.x buster main" >> /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -y nodejs && \
  npm -g install phantomjs-prebuilt --upgrade --unsafe-perm && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists
