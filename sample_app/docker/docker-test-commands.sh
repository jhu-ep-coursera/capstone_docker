#!/bin/bash

/usr/local/bin/vnc.sh
set -x 
rake db:create RAILS_ENV=test
rake db:migrate RAILS_ENV=test
bundle exec rspec spec/models --fail-fast
bundle exec rspec spec/requests --fail-fast
bundle exec rspec spec/features --fail-fast
#tail -f Gemfile
