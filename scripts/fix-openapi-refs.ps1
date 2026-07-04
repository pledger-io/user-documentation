# Rewrites #/components/... refs in split OpenAPI files to point at the root spec.
$ErrorActionPreference = 'Stop'
$rootDir = Join-Path (Join-Path (Join-Path $PSScriptRoot '..') 'static') 'openapi' | Resolve-Path

Get-ChildItem -Path $rootDir -Recurse -Filter '*.yaml' |
    Where-Object { $_.Name -notin @('openapi.yml', 'openapi.bundle.yaml') } |
    ForEach-Object {
        $relativeDir = $_.DirectoryName.Substring($rootDir.Path.Length).TrimStart('\', '/').Trim('\', '/')
        $depth = @(($relativeDir -split '[\\/]') | Where-Object { $_ }).Count
        $prefix = if ($depth -eq 0) {
            './openapi.yml'
        }
        else {
            ('../' * $depth) + 'openapi.yml'
        }

        $content = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
        $new = $content -replace "\`$ref: '#/components/", "`$ref: '$prefix#/components/"
        $new = $new -replace '\$ref: "#/components/', "`$ref: `"$prefix#/components/"
        if ($new -ne $content) {
            [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.UTF8Encoding]::new($false))
            Write-Host "Updated $($_.Name)"
        }
    }
