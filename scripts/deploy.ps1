$OriginalLocation = Get-Location
try {
    $PARENT_DIR = Split-Path -Parent $PSScriptRoot

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

    $buildFlag = ""
    if ($args -contains "--build") {
        $buildFlag = "--build"
    } 

    Set-Location $PARENT_DIR

    Write-Host "Starting $env:APP_NAME..."
    docker compose -f docker-compose.yaml up -d $buildFlag
} catch {
    exit 1
} finally {
    Set-Location $OriginalLocation
}