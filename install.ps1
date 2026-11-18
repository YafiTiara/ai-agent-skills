param(
    [ValidateSet("claude", "antigravity", "cursor", "agents", "all")]
    [string]$Target = "claude"
)

$ErrorActionPreference = "Stop"
$SourceDir = Join-Path $PSScriptRoot "skills"

$Targets = @{
    "claude"      = Join-Path $HOME ".claude\skills"
    "antigravity" = Join-Path $HOME ".gemini\config\skills"
    "cursor"      = Join-Path $HOME ".cursor\skills"
    "agents"      = Join-Path $HOME ".agents\skills"
}

$Selected = if ($Target -eq "all") { $Targets.Keys } else { @($Target) }

foreach ($t in $Selected) {
    $dest = $Targets[$t]
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $SourceDir "*") -Destination $dest -Recurse -Force
    Write-Host "Installed skills to $dest" -ForegroundColor Green
}
