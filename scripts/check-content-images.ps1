# Fail if Markdown content references local images that are missing from assets/ or static/.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$contentDir = Join-Path $root 'content'

function Get-LineNumber([string]$text, [int]$index) {
    if ($index -le 0) { return 1 }
    return ($text.Substring(0, [Math]::Min($index, $text.Length)) -replace '[^\n]', '').Length + 1
}

function Normalize-LocalPath([string]$raw) {
    if ([string]::IsNullOrWhiteSpace($raw)) { return $null }
    $path = $raw.Trim().Trim('"', "'")
    if ($path -match '^(?i)(https?:|mailto:|data:|//)') { return $null }
    $path = ($path -split '[?#]', 2)[0]
    $path = $path.Replace('\', '/').TrimStart('/')
    if ([string]::IsNullOrWhiteSpace($path)) { return $null }
    return $path
}

function Test-LocalImage([string]$relativePath) {
    $normalized = $relativePath.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $candidates = @(
        (Join-Path $root (Join-Path 'assets' $normalized)),
        (Join-Path $root (Join-Path 'static' $normalized))
    )
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate) { return $true }
    }
    return $false
}

$patterns = @(
    '(?s)\{\{<\s*image\b[^>]*?\bsrc=(["''])(?<path>.*?)\1',
    '(?m)^thumbnail:\s*["'']?(?<path>[^\s"'']+)',
    '!\[(?:[^\]]*)\]\(\s*<?(?<path>[^)\s>]+)>?',
    '(?i)<img\b[^>]*?\bsrc=(["''])(?<path>.*?)\1'
)

$missing = [System.Collections.Generic.List[object]]::new()
$checked = 0

Get-ChildItem -LiteralPath $contentDir -Filter '*.md' -Recurse -File | ForEach-Object {
    $relativeFile = $_.FullName.Substring($root.Length).TrimStart('\', '/').Replace('\', '/')
    $text = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
    if ([string]::IsNullOrEmpty($text)) { return }

    $seen = @{}
    foreach ($pattern in $patterns) {
        foreach ($match in [regex]::Matches($text, $pattern)) {
            $path = Normalize-LocalPath $match.Groups['path'].Value
            if (-not $path) { continue }

            $key = '{0}:{1}' -f $relativeFile, $path
            if ($seen.ContainsKey($key)) { continue }
            $seen[$key] = $true
            $checked++

            if (-not (Test-LocalImage $path)) {
                $missing.Add([pscustomobject]@{
                    File = $relativeFile
                    Line = Get-LineNumber $text $match.Index
                    Path = $path
                })
            }
        }
    }

    foreach ($match in [regex]::Matches($text, 'icon:(?<name>[A-Za-z0-9_-]+)\[\]')) {
        $name = $match.Groups['name'].Value
        $path = "images/icons/$name.png"
        $key = '{0}:icon:{1}' -f $relativeFile, $name
        if ($seen.ContainsKey($key)) { continue }
        $seen[$key] = $true
        $checked++

        if (-not (Test-LocalImage $path) -and -not (Test-LocalImage "images/icons/$name.svg")) {
            $missing.Add([pscustomobject]@{
                File = $relativeFile
                Line = Get-LineNumber $text $match.Index
                Path = $path
            })
        }
    }
}

if ($missing.Count -gt 0) {
    Write-Host 'Missing local images referenced by content:'
    foreach ($item in $missing) {
        Write-Host ("  {0}:{1} -> {2}" -f $item.File, $item.Line, $item.Path)
        Write-Host ("    looked in assets/{0} and static/{0}" -f $item.Path)
    }
    Write-Host ("Found {0} missing image reference(s)." -f $missing.Count)
    exit 1
}

Write-Host ("Checked {0} image reference(s). All local assets were found." -f $checked)
