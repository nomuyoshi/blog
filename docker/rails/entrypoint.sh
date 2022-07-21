#!/bin/sh
set -e
echo "start migrate"
rm -f /myapp/tmp/pids/server.pid
bundle exec rails db:migrate
bundle exec rails db:seed
exec "$@"
