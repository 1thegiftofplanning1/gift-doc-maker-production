#!/bin/bash
git pull
bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
