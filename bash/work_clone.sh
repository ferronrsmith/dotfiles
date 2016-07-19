#!/bin/bash


#shellcheck disable=SC2034
work_modules=(
  "conscia-docs"
  "adf-commons"
  "adf-widgets"
  "conscia-admin-ui"
  "data-file-service"
  "data-repository-service"
  "auth-server"
  "auth-server"
  "conscia-express-auth"
  "conscia-elastic"
  "conscia-store"
  "api-docs"
  "node"
  "config"
  "node-redis-messagepack",
  "conscia-license",
  "conscia-test-data"
  "passport-conscia"
)

function clone () {
  declare -a modules=("${!1}")
  for module in "${modules[@]}"
  do
    git clone "git@github.com:conscia/${module}.git" &
  done
  echo "start working !"
}


clone "work_modules[@]"
