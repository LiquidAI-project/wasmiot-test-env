#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
export $(cat "${DIR}/.env" | xargs)

# Start the supervisors first in detached mode
docker compose -f "${DIR}/compose.yml" --profile device up -d --pull always
# docker compose -f "compose.yml" --profile device up --pull always

# Start the orchestrator last
docker compose -f "${DIR}/wasmiot-orchestrator/docker-compose.yml" up --build



