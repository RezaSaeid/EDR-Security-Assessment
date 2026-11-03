[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$TestId,
    [Parameter(Mandatory=$true)][string]$TestName,
    [Parameter(Mandatory=$true)][string]$OsBuild,
    [Parameter(Mandatory=$true)][string]$ProductVersion,
    [Parameter(Mandatory=$true)][string]$OutputPath
)

# Creates an explicitly NOT-TESTED baseline record. It performs no EDR tampering,
# service control, driver interaction, network requests, or attack simulation.
$ErrorActionPreference = "Stop"
if ($TestId -notmatch '^[A-Z0-9][A-Z0-9_-]{2,40}$') {
    throw "TestId must match ^[A-Z0-9][A-Z0-9_-]{2,40}$"
}
$record = [ordered]@{
    test_id = $TestId
    test_name = $TestName
    test_date_utc = [DateTime]::UtcNow.ToString("o")
    environment = [ordered]@{
        os_build = $OsBuild
        product_version = $ProductVersion
        is_isolated_lab = $true
    }
    expected = [ordered]@{
        prevention = "Not evaluated"
        detection = "Not evaluated"
        telemetry = @()
    }
    observed = [ordered]@{
        host_events = @()
        console_events = @()
        detection_latency_seconds = $null
        recovery_time_seconds = $null
    }
    outcome = "Not-tested"
    limitations = @("Generated baseline only; no test was executed.")
    artifacts = @()
    sanitized_for_publication = $false
}
$directory = Split-Path -Parent $OutputPath
if ($directory -and -not (Test-Path -LiteralPath $directory)) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
}
$record | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Output "Created Not-tested baseline: $OutputPath"
