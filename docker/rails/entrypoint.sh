#!/bin/sh
set -e
bin/rails db:seed
rm -f /myapp/tmp/pids/server.pid
exec "$@"
