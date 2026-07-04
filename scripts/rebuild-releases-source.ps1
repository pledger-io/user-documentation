# Rebuild data/releases-source.md from generated per-major release pages.
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$releasesDir = Join-Path $root "content\releases"
$target = Join-Path $root "scripts\releases-source.md"

function Convert-AccordionToMarkdown([string]$accordion) {
    $items = [regex]::Matches($accordion, '(?s)\{\{< accordion-item title="([^"]+)"[^>]*>\}\}(.*?)\{\{< /accordion-item >\}\}')
    $out = New-Object System.Collections.Generic.List[string]
    foreach ($item in $items) {
        $titleParts = $item.Groups[1].Value -split ' - ', 2
        $version = $titleParts[0].Trim()
        $dateLabel = if ($titleParts.Length -gt 1) { $titleParts[1].Trim() } else { "" }
        $date = $null
        if ($dateLabel) {
            try {
                $culture = [System.Globalization.CultureInfo]::GetCultureInfo('nl-NL')
                $date = ([datetime]::Parse($dateLabel, $culture)).ToString('yyyy-MM-dd')
            } catch {
                try {
                    $culture = [System.Globalization.CultureInfo]::GetCultureInfo('en-US')
                    $date = ([datetime]::Parse($dateLabel, $culture)).ToString('yyyy-MM-dd')
                } catch {
                    $date = $null
                }
            }
        }
        $out.Add("## $version")
        $out.Add("")
        if ($date) {
            $out.Add("*Release date: $date*")
            $out.Add("")
        }
        $body = $item.Groups[2].Value.Trim()
        if ($body) { $out.Add($body) }
        $out.Add("")
    }
    return ($out -join "`n")
}

$chunks = New-Object System.Collections.Generic.List[string]
Get-ChildItem $releasesDir -Filter "v*.md" | Sort-Object { [int]($_.BaseName.Substring(1)) } -Descending | ForEach-Object {
    $raw = Get-Content $_.FullName -Raw -Encoding UTF8
    $body = ($raw -replace '(?s)^---.*?---\s*', '').Trim()
    $body = ($body -replace '(?s)^Browse all.*?\{\{< /button >\}\}\s*', '')
    $body = [regex]::Replace($body, '(?s)\{\{< accordion[^>]*>\}\}.*?\{\{< /accordion >\}\}', {
        param($match)
        Convert-AccordionToMarkdown $match.Value
    })
    $body = ($body -replace '(?s)Download from.*$', '').Trim()
    if ($body) { $chunks.Add($body) }
}

$header = "# Pledger.io release history (source)`n`nEdit this file, then run: ``scripts/generate-releases.ps1```n`n"
$content = $header + ($chunks -join "`n`n")
[System.IO.File]::WriteAllText($target, $content, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Wrote $target"
