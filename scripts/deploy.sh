#!/usr/bin/env bash
ORIGINAL_DIR=$(pwd)
cleanup() {
    cd "$ORIGINAL_DIR" || exit
}
trap cleanup EXIT INT TERM

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || { echo "Fehler: Hauptverzeichnis nicht gefunden!"; exit 1; }

docker compose -f docker-compose.yaml up -d --build