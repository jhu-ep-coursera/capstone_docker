# this file creates a ruby VM that provides and environment
# running the capstone software and hosting RSpec and Capybara
# tests
FROM ejavaguy/capstone_rails-2.3.8:latest
MAINTAINER Jim Stafford <jim.stafford@jhu.edu>

# VM will be rebuilt from this point when these files change
ONBUILD COPY Gemfile $APP_HOME
ONBUILD COPY Gemfile.lock $APP_HOME
ONBUILD RUN bundle install
