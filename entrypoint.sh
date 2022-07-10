#!/bin/sh
set -e
rm -f /myrecipe/tmp/pids/server.pid
exec "$@"
