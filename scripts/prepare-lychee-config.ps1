# Merge .lychee.toml with auto-generated excludes for Hugo draft pages.
$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot '..' | Resolve-Path
$baseConfig = Join-Path $root '.lychee.toml'
$outputConfig = Join-Path $root '.lychee.ci.toml'

Push-Location $root
try {
    $draftPaths = @()
    $csv = hugo list drafts 2>$null | Where-Object { $_ -match '^content/' }
    foreach ($line in $csv) {
        $permalink = ($line -split ',', 9)[7]
        if ([string]::IsNullOrWhiteSpace($permalink)) { continue }
        $path = ([Uri]$permalink).AbsolutePath.TrimEnd('/')
        if ($path) { $draftPaths += $path }
    }

    $base = Get-Content -LiteralPath $baseConfig -Raw -Encoding UTF8
    if ($draftPaths.Count -eq 0) {
        Set-Content -LiteralPath $outputConfig -Value $base -Encoding utf8NoBOM
        Write-Host 'No draft pages; wrote .lychee.ci.toml from base config.'
        return
    }

    $extra = ($draftPaths | Sort-Object -Unique | ForEach-Object {
        "  '^$([regex]::Escape($_))/?',"
    }) -join "`n"

    if ($base -match '(?ms)^exclude\s*=\s*\[(.*?)^\]\s*$') {
        $merged = [regex]::Replace($base, '(?ms)^exclude\s*=\s*\[(.*?)^\]\s*$', {
            param($match)
            $body = $match.Groups[1].Value.TrimEnd()
            if ($body.Length -gt 0 -and -not $body.TrimEnd().EndsWith(',')) {
                $body = "$body,"
            }
            "exclude = [`n$body`n$extra`n]"
        }, 1)
    }
    else {
        $merged = "$base`n`nexclude = [`n$extra`n]`n"
    }

    [System.IO.File]::WriteAllText($outputConfig, $merged, [System.Text.UTF8Encoding]::new($false))
    Write-Host ("Added {0} draft URL exclude(s) to .lychee.ci.toml." -f $draftPaths.Count)
}
finally {
    Pop-Location
}
