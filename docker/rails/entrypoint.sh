#!/bin/sh
set -e
bin/rails db:migrate
bin/rails db:seed
rm -f /myapp/tmp/pids/server.pid
exec "$@"
