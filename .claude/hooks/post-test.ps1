param()

$ErrorActionPreference = "Stop"

$raw = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($raw)) {
    exit 0
}

try {
    $event = $raw | ConvertFrom-Json -Depth 20
} catch {
    exit 0
}

if ($event.tool_name -ne "Bash") {
    exit 0
}

$command = $null
if ($event.tool_input -and $event.tool_input.command) {
    $command = [string]$event.tool_input.command
}

if ([string]::IsNullOrWhiteSpace($command)) {
    exit 0
}

$testPatterns = @(
    "test",
    "pytest",
    "vitest",
    "playwright",
    "npm run test",
    "pnpm test",
    "yarn test",
    "npm run lint",
    "npm run build"
)

$matched = $false
foreach ($pattern in $testPatterns) {
    if ($command -match [regex]::Escape($pattern)) {
        $matched = $true
        break
    }
}

if (-not $matched) {
    exit 0
}

$projectDir = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($projectDir)) {
    $projectDir = (Get-Location).Path
}

$worklogPath = Join-Path $projectDir "docs\worklog.md"
$timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

$entry = @"
- [$timestamp] Command executed
  - Command: $command
  - Note: Review terminal output and CI results for pass/fail evidence.
"@

if (-not (Test-Path $worklogPath)) {
    New-Item -ItemType File -Path $worklogPath -Force | Out-Null
}

Add-Content -Path $worklogPath -Value $entry
exit 0