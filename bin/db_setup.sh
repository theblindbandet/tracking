#!/bin/bash
set -e

# Tracking DB setup
docker-compose exec web-tracking rake db:drop
docker-compose exec web-tracking rake db:create
docker-compose exec web-tracking rake db:migrate
docker-compose exec web-tracking rake db:migrate RAILS_ENV=test
