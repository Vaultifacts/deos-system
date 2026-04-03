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

$projectDir = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($projectDir)) {
    $projectDir = (Get-Location).Path
}

$worklogPath = Join-Path $projectDir "docs\worklog.md"
$timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

$toolName = $event.tool_name
$pathValue = $null

if ($event.tool_input) {
    if ($event.tool_input.file_path) { $pathValue = $event.tool_input.file_path }
    elseif ($event.tool_input.path) { $pathValue = $event.tool_input.path }
    elseif ($event.tool_input.target_file) { $pathValue = $event.tool_input.target_file }
}

if ([string]::IsNullOrWhiteSpace($pathValue)) {
    $pathValue = "(unknown path)"
}

$entry = @"
- [$timestamp] Edit event
  - Tool: $toolName
  - Path: $pathValue
"@

if (-not (Test-Path $worklogPath)) {
    New-Item -ItemType File -Path $worklogPath -Force | Out-Null
}

Add-Content -Path $worklogPath -Value $entry
exit 0