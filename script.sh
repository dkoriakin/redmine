#!/bin/bash
cd redmine-master
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
bundle exec rails server webrick -e production 
