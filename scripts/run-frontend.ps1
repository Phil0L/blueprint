$OriginalLocation = Get-Location
try {
    $PARENT_DIR = Split-Path -Parent $PSScriptRoot
    $FrontendPath = Join-Path $PARENT_DIR "frontend"
    Set-Location $FrontendPath -ErrorAction Stop

    if (-not (Test-Path "node_modules")) {
        Write-Host "'node_modules' not found. Installing dependencies..."
        npm install
        if ($LASTEXITCODE -ne 0) {
            throw "Error during 'npm install'!"
        }
    }

    Write-Host "Starting Frontend..."
    npm run dev

} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    exit 1
} finally {
    Set-Location $OriginalLocation
}