#!/usr/bin/env bash
ORIGINAL_DIR=$(pwd)
cleanup() {
    cd "$ORIGINAL_DIR" || exit
}
trap cleanup EXIT INT TERM

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../frontend" || { echo "Fehler: 'frontend'-Ordner wurde nicht gefunden!"; exit 1; }

if [ ! -d "node_modules" ]; then
    echo "'node_modules' nicht gefunden. Installiere Abhängigkeiten..."
    npm install || { echo "Fehler bei 'npm install'!"; exit 1; }
fi

echo "Starte Frontend..."
npm run dev