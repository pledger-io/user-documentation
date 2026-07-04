# Parses scripts/releases-source.md and generates the releases section.
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent

$source = Join-Path $root "scripts/releases-source.md"
if (-not (Test-Path $source)) {
    $source = Join-Path $root "content/architecture/releases.md"
}
$releasesDir = Join-Path $root "content/releases"
$dataDir = Join-Path $root "data"

if (-not (Test-Path $source)) {
    Write-Error "Source file not found: $source"
}

$raw = Get-Content $source -Raw -Encoding UTF8
$body = $raw -replace '(?s)^#.*?\r?\n\r?\n', ''
$body = ($body -replace '(?s)^Edit this file.*?\r?\n\r?\n', '').Trim()

function Normalize-ReleaseMarkdown([string]$text) {
    $out = New-Object System.Collections.Generic.List[string]
    foreach ($line in ($text -split "\r?\n")) {
        if ($line -match '^== (\d+\.\d+\.\d+)\s*$') {
            $out.Add("## $($Matches[1])")
        } elseif ($line -match '^=== (.+?)\s*$') {
            $out.Add("### $($Matches[1])")
        } elseif ($line -match '^==== (.+?)\s*$') {
            $out.Add("#### $($Matches[1])")
        } else {
            $out.Add($line)
        }
    }
    return ($out -join "`n")
}

$body = Normalize-ReleaseMarkdown $body

$releases = [System.Collections.Generic.List[object]]::new()
foreach ($chunk in ($body -split '(?m)^## (?=\d+\.\d+\.\d+\s*$)')) {
    if ([string]::IsNullOrWhiteSpace($chunk)) { continue }
    $lines = $chunk -split "\r?\n"
    $version = $lines[0].Trim()
    if ($version -notmatch '^\d+\.\d+\.\d+$') { continue }

    $rest = (($lines | Select-Object -Skip 1) -join "`n").Trim()
    $date = $null
    if ($rest -match '\*Release date:\s*(\d{4}-\d{2}-\d{2})\*') {
        $date = $Matches[1]
        $rest = ($rest -replace '\*Release date:\s*\d{4}-\d{2}-\d{2}\*\s*', '').Trim()
    }

    $parts = $version.Split('.')
    $major = [int]$parts[0]
    $minor = [int]$parts[1]
    $patch = [int]$parts[2]
    $isMajor = ($minor -eq 0 -and $patch -eq 0)

    $summary = ""
    if ($rest -match '(?ms)^###?\s+([^\r\n]+)\s*\r?\n\r?\n-\s+([^\r\n]+)') {
        $summary = "$($Matches[1]): $($Matches[2])"
    } elseif ($rest -match '(?m)^-\s+([^\r\n]+)') {
        $summary = $Matches[1]
    }
    if ($summary.Length -gt 140) {
        $summary = $summary.Substring(0, 137) + "..."
    }

    $releases.Add([pscustomobject]@{
        Version = $version
        Major   = $major
        Date    = $date
        Body    = $rest
        Summary = $summary
        IsMajor = $isMajor
    })
}

if ($releases.Count -eq 0) {
    Write-Error "No releases parsed from $source"
}

$releases = @($releases | Sort-Object { [version]$_.Version } -Descending)

function Get-ReleaseColor($release) {
    if ($release.IsMajor) { return "primary" }
    if ($release.Body -match '(?mi)^###?\s+Added') { return "success" }
    if ($release.Body -match '(?mi)^WARNING:') { return "warning" }
    if ($release.Body -match '(?mi)^###?\s+Dependency') { return "secondary" }
    return "info"
}

function Get-ReleaseIcon($release) {
    if ($release.IsMajor) { return "fas rocket" }
    if ($release.Body -match '(?mi)^###?\s+Added') { return "fas plus" }
    if ($release.Body -match '(?mi)^WARNING:') { return "fas triangle-exclamation" }
    return "fas tag"
}

function Format-ReleaseDate($date) {
    if (-not $date) { return "Unknown date" }
    try {
        return ([datetime]::ParseExact($date, 'yyyy-MM-dd', $null)).ToString('d MMMM yyyy')
    } catch {
        return $date
    }
}

# Timeline data for recent releases
$recentLines = New-Object System.Collections.Generic.List[string]
foreach ($release in ($releases | Select-Object -First 8)) {
    $badge = if ($release.IsMajor) { "Major" } else { $null }
    $content = $release.Summary
    if ([string]::IsNullOrWhiteSpace($content)) {
        $content = "See release notes for details."
    }
    $content = $content.Replace('"', "'")
    $recentLines.Add("- title: $($release.Version)")
    $recentLines.Add("  date: $($release.Date)")
    $recentLines.Add("  color: $(Get-ReleaseColor $release)")
    $recentLines.Add("  icon: `"$(Get-ReleaseIcon $release)`"")
    $recentLines.Add("  url: $($release.Version)")
    if ($badge) {
        $recentLines.Add("  badge: $badge")
    }
    $recentLines.Add("  content: `"$content`"")
}
$recentPath = Join-Path $dataDir "releases-recent.yaml"
[System.IO.File]::WriteAllText($recentPath, ($recentLines -join "`n"), (New-Object System.Text.UTF8Encoding $false))

# Major version summary
$majorVersions = $releases | Group-Object Major | Sort-Object Name -Descending
$summaryLines = New-Object System.Collections.Generic.List[string]
$summaryLines.Add("majors:")
foreach ($group in $majorVersions) {
    $latest = $group.Group | Sort-Object { [version]$_.Version } -Descending | Select-Object -First 1
    $summaryLines.Add("- major: $($group.Name)")
    $summaryLines.Add("  latest: $($latest.Version)")
    $summaryLines.Add("  latestDate: $($latest.Date)")
    $summaryLines.Add("  count: $($group.Group.Count)")
}
$summaryPath = Join-Path $dataDir "releases-majors.yaml"
[System.IO.File]::WriteAllText($summaryPath, ($summaryLines -join "`n"), (New-Object System.Text.UTF8Encoding $false))

# Per-major markdown pages with accordions
New-Item -ItemType Directory -Force -Path $releasesDir | Out-Null

foreach ($group in $majorVersions) {
    $major = $group.Name
    $ordered = @($group.Group | Sort-Object { [version]$_.Version } -Descending)
    $latest = $ordered[0]
    $file = Join-Path $releasesDir "v$major.md"

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("---")
    $lines.Add("title: Version $major.x")
    $lines.Add("description: Release notes for Pledger.io $major.x (latest $($latest.Version)).")
    $lines.Add("type: docs")
    $lines.Add("weight: $major")
    $lines.Add("includeToc: false")
    $lines.Add("---")
    $lines.Add("")
    $dateLabel = Format-ReleaseDate $latest.Date
    $lines.Add("Browse all **$($ordered.Count)** releases in the $major.x line. Latest: **$($latest.Version)** ($dateLabel).")
    $lines.Add("")
    $lines.Add('{{< button href="/releases/" outline=true color="primary" >}}Back to all releases{{< /button >}}')
    $lines.Add("")
    $lines.Add('{{< accordion id="releases-v' + $major + '" >}}')

    $index = 0
    foreach ($release in $ordered) {
        $title = "$($release.Version) - $(Format-ReleaseDate $release.Date)"
        $show = if ($index -eq 0) { "true" } else { "false" }
        $lines.Add("")
        $lines.Add("{{< accordion-item title=`"$title`" show=$show >}}")
        $lines.Add($release.Body.Trim())
        $lines.Add("{{< /accordion-item >}}")
        $index++
    }

    $lines.Add("{{< /accordion >}}")
    $lines.Add("")
    $lines.Add("Download from [GitHub Releases](https://github.com/pledger-io/build-tooling/releases/tag/$($latest.Version)).")
    $lines -join "`n" | Set-Content -Path $file -Encoding UTF8
}

Write-Host "Generated $($releases.Count) releases into $releasesDir"

$latest = $releases[0]
$indexPath = Join-Path $releasesDir "_index.md"
$indexLines = New-Object System.Collections.Generic.List[string]
$indexLines.Add("---")
$indexLines.Add("title: Releases")
$indexLines.Add("description: Version history and release notes for Pledger.io.")
$indexLines.Add("type: docs")
$indexLines.Add("weight: 50")
$indexLines.Add("includeToc: false")
$indexLines.Add("---")
$indexLines.Add("")
$indexLines.Add("**Current stable:** [v$($latest.Version)](https://github.com/pledger-io/build-tooling/releases/tag/$($latest.Version))")
$indexLines.Add("")
$indexLines.Add("Download installers and changelogs from [GitHub Releases](https://github.com/pledger-io/build-tooling/releases).")
$indexLines.Add("")
$indexLines.Add("## Recent releases")
$indexLines.Add("")
$indexLines.Add('{{< timeline data="releases-recent" >}}')
$indexLines.Add("")
$indexLines.Add("## By major version")
$indexLines.Add("")
$indexLines.Add("Browse release notes grouped by major version:")
$indexLines.Add("")
$indexLines.Add('{{< card-group gutter="3" cols="2" >}}')
$indexLines.Add("")
foreach ($group in $majorVersions) {
    $major = $group.Name
    $indexLines.Add("    {{< card path=`"releases/v$major`" header-style=`"none`" />}}")
}
$indexLines.Add("")
$indexLines.Add("{{</ card-group>}}")
$indexLines.Add("")
[System.IO.File]::WriteAllText($indexPath, ($indexLines -join "`n"), (New-Object System.Text.UTF8Encoding $false))
Write-Host "Generated releases index -> $indexPath"
