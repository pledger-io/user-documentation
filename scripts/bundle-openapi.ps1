# Bundles the split OpenAPI spec into a single file for browser-based viewers.
$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot '..' | Resolve-Path
$specDir = Join-Path (Join-Path $root 'static') 'openapi'
$inputSpec = Join-Path $specDir 'openapi.yml'
$outputSpec = Join-Path $specDir 'openapi.bundle.yaml'

& (Join-Path $PSScriptRoot 'fix-openapi-refs.ps1')

Push-Location $specDir
try {
    npx --yes @redocly/cli@1 bundle openapi.yml -o openapi.bundle.yaml
    if (-not (Test-Path $outputSpec)) {
        throw "Bundle step did not produce $outputSpec"
    }
    Write-Host "Bundled OpenAPI spec -> $outputSpec"
}
finally {
    Pop-Location
}
