$ErrorActionPreference = "Stop"

# Backend Engineering lane, narrowed to roughly 3 to 7 years.
# This wrapper keeps the main monitor logic intact and only adjusts the profile and notification target.
$env:ROLEPILOT_PROFILE = "backend-engineering"
$env:ROLEPILOT_MIN_YEARS = if ($env:ROLEPILOT_MIN_YEARS) { [string]$env:ROLEPILOT_MIN_YEARS } else { "3" }
$env:ROLEPILOT_MAX_YEARS = if ($env:ROLEPILOT_MAX_YEARS) { [string]$env:ROLEPILOT_MAX_YEARS } else { "7" }
$env:ROLEPILOT_WRITE_APP_OUTPUTS = "false"

if (-not $env:ROLEPILOT_NTFY_TOPIC) {
  $env:ROLEPILOT_NTFY_TOPIC = "https://ntfy.sh/Backend_engineer_jobs"
}

& (Join-Path $PSScriptRoot "run_gcc_product_monitor.ps1")
