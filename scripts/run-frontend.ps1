$OriginalLocation = Get-Location
try {
    $PARENT_DIR = Split-Path -Parent $PSScriptRoot
    $FrontendPath = Join-Path $PARENT_DIR "frontend"

    $EnvFile = Join-Path $PARENT_DIR ".env"
    if (Test-Path $EnvFile) {
        Get-Content $EnvFile | ForEach-Object {
            $line = $_.Trim()
            if ($line -and -not $line.StartsWith("#")) {
                $key, $value = $line -split '=', 2
                if ($key -and $value) {
                    [System.Environment]::SetEnvironmentVariable($key.Trim(), $value.Trim(), "Process")
                }
            }
        }
    } 

    Set-Location $FrontendPath -ErrorAction Stop

    if (-not (Test-Path "node_modules")) {
        npm install
    }

    Write-Host "Starting $env:APP_NAME Frontend..."
    npm run dev

} catch {
    exit 1
} finally {
    Set-Location $OriginalLocation
}