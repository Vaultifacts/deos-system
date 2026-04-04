param()

$ErrorActionPreference = "Stop"

$context = [Console]::In.ReadToEnd()
$projectDir = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($projectDir)) {
    $projectDir = (Get-Location).Path
}

$worklogPath = Join-Path $projectDir "docs\worklog.md"
$launchPath  = Join-Path $projectDir "docs\launch-readiness.md"
$statePath   = Join-Path $projectDir "docs\state.md"

$additionalContext = @"
Read these files before meaningful work:
- $worklogPath
- $launchPath
- $statePath

Enforce DEOS:
- GitHub is execution truth
- repo docs are Claude truth
- no completion without evidence
- update worklog after meaningful edits and test runs
"@

$result = @{
    hookSpecificOutput = @{
        hookEventName     = "SessionStart"
        additionalContext = $additionalContext
    }
}

$result | ConvertTo-Json -Depth 8 -Compress