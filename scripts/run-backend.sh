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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../backend" || { exit 1; }

if [ ! -d "node_modules" ]; then
    npm install || { exit 1; }
fi

echo "Starte $APP_NAME Backend..."
npm run dev