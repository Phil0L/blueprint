#!/usr/bin/env bash
ORIGINAL_DIR=$(pwd)
cleanup() {
    cd "$ORIGINAL_DIR" || exit
}
trap cleanup EXIT INT TERM

ENV_FILE="$SCRIPT_DIR/../.env"
if [ -f "$ENV_FILE" ]; then
    export $(grep -v '^#' "$ENV_FILE" | xargs)
fi

BUILD_FLAG=""
if [ "$1" == "--build" ]; then
    BUILD_FLAG="--build"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || { echo "Error: Root directory not found!"; exit 1; }

echo "Starting $APP_NAME..."
docker compose -f docker-compose.yaml up -d $BUILD_FLAG