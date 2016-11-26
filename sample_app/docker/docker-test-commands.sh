#!/bin/bash

/usr/local/bin/vnc.sh
set -x 
rake db:create
rake db:migrate
bundle exec rspec spec/models --fail-fast
bundle exec rspec spec/requests --fail-fast
bundle exec rspec spec/features --fail-fast
#tail -f Gemfile
