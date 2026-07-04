# Rewrites #/components/... refs in split OpenAPI files to point at the root spec.
$ErrorActionPreference = 'Stop'
$rootDir = Join-Path $PSScriptRoot '..' 'static' 'openapi' | Resolve-Path

Get-ChildItem -Path $rootDir -Recurse -Filter '*.yaml' |
    Where-Object { $_.Name -notin @('openapi.yml', 'openapi.bundle.yaml') } |
    ForEach-Object {
        $relativeDir = $_.DirectoryName.Substring($rootDir.Path.Length).Trim('\', '/')
        $prefix = if ([string]::IsNullOrEmpty($relativeDir)) {
            './openapi.yml'
        }
        elseif ($relativeDir -notmatch '[\\/]') {
            '../openapi.yml'
        }
        else {
            '../../openapi.yml'
        }

        $content = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
        $new = $content -replace "\`$ref: '#/components/", "`$ref: '$prefix#/components/"
        $new = $new -replace '\$ref: "#/components/', "`$ref: `"$prefix#/components/"
        if ($new -ne $content) {
            [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.UTF8Encoding]::new($false))
            Write-Host "Updated $($_.Name)"
        }
    }
