$OriginalLocation = Get-Location
try {
    $PARENT_DIR = Split-Path -Parent $PSScriptRoot
    Set-Location $PARENT_DIR

    Write-Host "Starting Docker..."
    docker compose -f docker-compose.yaml up -d --build
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    exit 1
} finally {
    Set-Location $OriginalLocation
}