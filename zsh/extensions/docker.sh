#!/bin/bash


function download_docker_tools () {
  tool="${1}"
  if [ ! -f "$(which jq)" ]; then
    echo 'jq was not found'
    return;
  fi

  if [ -z "$1" ]; then
    echo 'tool name is required!'
    return
  fi

  tag_name=$(curl -Ls https://api.github.com/repos/docker/${tool}/releases/latest | jq .tag_name -r)

  echo "latest docker ${tool} version : ${tag_name}"

  rm -rf "/tmp/docker-${tool}" &&
  curl -L https://github.com/docker/${tool}/releases/download/${tag_name}/docker-${tool}-`uname -s`-`uname -m` > "/tmp/docker-${tool}" &&
  chmod +x "/tmp/docker-${tool}" &&
  sudo cp "/tmp/docker-${tool}" "/usr/local/bin/docker-${tool}"
}

function upgrade_docker_machine () {
  download_docker_tools "machine"
}

function upgrade_docker_compose () {
  download_docker_tools "compose"
}