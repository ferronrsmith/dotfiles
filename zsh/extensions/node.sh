#!/bin/sh

export DOCKER_HOST_PORT="192.168.99.100"
export REDIS_HOST="${DOCKER_HOST_PORT}"
export MQ_HOST="${DOCKER_HOST_PORT}"
export INDEX_SERVICES_HOST="${DOCKER_HOST_PORT}"
export DATAFILE_SERVICE_HOST="${DOCKER_HOST_PORT}"
export DATAREPO_SERVICE_HOST="${DOCKER_HOST_PORT}"
export DATAREPO_HOST="${DOCKER_HOST_PORT}"
export AUTH_SERVICE_HOST="${DOCKER_HOST_PORT}"