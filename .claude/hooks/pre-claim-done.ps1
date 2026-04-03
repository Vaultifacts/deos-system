param()

$ErrorActionPreference = "Stop"

$projectDir = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($projectDir)) {
    $projectDir = (Get-Location).Path
}

$worklogPath = Join-Path $projectDir "docs\worklog.md"

if (-not (Test-Path $worklogPath)) {
    [Console]::Error.WriteLine("DEOS blocked completion: docs/worklog.md does not exist.")
    exit 2
}

$content = Get-Content -Path $worklogPath -Raw

$hasActiveIssue = $content -match "## Active Issue\s*[-\r\n ]*[^-\s]"
$hasEvidence = $content -match "## Evidence"
$hasNextSteps = $content -match "## Next Steps"

if (-not $hasActiveIssue) {
    [Console]::Error.WriteLine("DEOS blocked completion: docs/worklog.md is missing a real Active Issue value.")
    exit 2
}

if (-not $hasEvidence) {
    [Console]::Error.WriteLine("DEOS blocked completion: docs/worklog.md is missing the Evidence section.")
    exit 2
}

if (-not $hasNextSteps) {
    [Console]::Error.WriteLine("DEOS blocked completion: docs/worklog.md is missing the Next Steps section.")
    exit 2
}

exit 0