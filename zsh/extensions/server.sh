#!/bin/bash

# simple python server
function pserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  python3 -m http.server $PORT
}

# simple ruby server
function rserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  ruby -run -e httpd . -p $PORT
}

# simple php server
function phpserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  php -S 0.0.0.0:$PORT
}
