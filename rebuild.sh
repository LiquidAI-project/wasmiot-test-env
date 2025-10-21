#!/bin/bash


# Ensure the orchestrator has its .env copied for the build
if [[ -f ".env" ]]; then
  cp .env ./orchestrator-rust-port/.env
fi

# Build the supervisor
if docker compose --profile ABSTRACT_BASE_HACK_DO_NOT_USE build --no-cache supervisor-image; then
  echo "==> Supervisor image built"
else
  echo "==> Supervisor image build failed"
  exit 1
fi

# Build the orchestrator
if docker compose build --no-cache wasmiot-orchestrator; then
  echo "==> Orchestrator image built"
else
  echo "==> Orchestrator image build failed"
  exit 1
fi

echo "==> Done."
