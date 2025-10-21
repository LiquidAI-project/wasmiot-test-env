#!/bin/bash
mkdir -p instance/orchestrator/files
mkdir -p instance/orchestrator/init

mkdir -p instance/supervisor-1/configs
mkdir -p instance/supervisor-1/outputs
mkdir -p instance/supervisor-1/wasm-modules
mkdir -p instance/supervisor-1/wasm-params
cp init/*.json instance/supervisor-1/configs/

mkdir -p instance/supervisor-2/configs
mkdir -p instance/supervisor-2/outputs
mkdir -p instance/supervisor-2/wasm-modules
mkdir -p instance/supervisor-2/wasm-params
cp init/*.json instance/supervisor-2/configs/

cp .env ./orchestrator-rust-port/.env
docker compose up --no-attach mongo --no-attach mongo-express



