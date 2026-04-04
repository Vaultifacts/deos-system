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

$targetPath = $null
if ($event.tool_input) {
    if ($event.tool_input.file_path) { $targetPath = [string]$event.tool_input.file_path }
    elseif ($event.tool_input.path) { $targetPath = [string]$event.tool_input.path }
    elseif ($event.tool_input.target_file) { $targetPath = [string]$event.tool_input.target_file }
}

if ([string]::IsNullOrWhiteSpace($targetPath)) {
    exit 0
}

$normalized = $targetPath.Replace("/", "\").ToLowerInvariant()

$protectedPatterns = @(
    "claude.md",
    "docs\launch-readiness.md",
    ".github\workflows\"
)

foreach ($pattern in $protectedPatterns) {
    if ($normalized.Contains($pattern)) {
        $result = @{
            hookSpecificOutput = @{
                hookEventName = "PreToolUse"
                permissionDecision = "deny"
                permissionDecisionReason = "DEOS protected-path rule: protected file requires explicit user-directed change."
            }
        }
        $result | ConvertTo-Json -Depth 8 -Compress
        exit 0
    }
}

exit 0