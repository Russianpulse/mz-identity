#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  rm -rf tmp/pids/*
  bundle exec rackup -p 80 --host 0.0.0.0
fi

exec "$@"
