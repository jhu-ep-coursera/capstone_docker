# this file creates a ruby VM that provides and environment
# running the capstone software and hosting RSpec and Capybara
# tests
FROM ruby:2.2
MAINTAINER Jim Stafford <jim.stafford@jhu.edu>

# Install firefox (aka iceweasel)
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
    iceweasel

# Install LXDE and VNC server to be able to see firefox
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
    lxde-core \
    lxterminal \
    tightvncserver
ENV USER root

# install phantomjs - download from https://bitbucket.org/ariya/phantomjs/downloads
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 .
RUN tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 
RUN mv ./phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
RUN rm -rf ./phantomjs-2.1.1-linux-x86_64
RUN phantomjs --version

# install postgres and nodejs Rails support packages
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs

# install ghostscript fonts for already installed imagemagick
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
    ghostscript

# cleanup repositories
RUN rm -rf /var/lib/apt/lists/*

# cache pertinent gems
# define a directory within the VM for the application
ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# VM will be rebuilt from this point when these files change
ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME
RUN bundle config --global --jobs 4
RUN bundle install

# copy this last since has the most likely changes
ENV DISPLAY :0
COPY vnc.sh /usr/local/bin

EXPOSE 3000 5900
