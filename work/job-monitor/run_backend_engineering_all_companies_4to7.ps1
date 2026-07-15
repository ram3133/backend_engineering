$ErrorActionPreference = "Stop"

# Backend Engineering lane for all companies, widened beyond GCC/product only.
$env:ROLEPILOT_PROFILE = "backend-all-companies"
$env:ROLEPILOT_MIN_YEARS = if ($env:ROLEPILOT_MIN_YEARS) { [string]$env:ROLEPILOT_MIN_YEARS } else { "4" }
$env:ROLEPILOT_MAX_YEARS = if ($env:ROLEPILOT_MAX_YEARS) { [string]$env:ROLEPILOT_MAX_YEARS } else { "7" }
$env:ROLEPILOT_WRITE_APP_OUTPUTS = "false"

if (-not $env:ROLEPILOT_NTFY_TOPIC) {
  $env:ROLEPILOT_NTFY_TOPIC = "https://ntfy.sh/Backend_engineer_jobs"
}

& (Join-Path $PSScriptRoot "run_gcc_product_monitor.ps1")
