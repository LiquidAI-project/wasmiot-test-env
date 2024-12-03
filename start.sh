#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
export $(cat "${DIR}/.env" | xargs)
docker compose -f "${DIR}/compose.yml" --profile device up --pull always



