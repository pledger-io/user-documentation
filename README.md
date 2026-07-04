# Pledger.io user documentation

Static documentation site for [pledger.io](https://www.pledger.io/), built with [Hugo](https://gohugo.io/) Extended and the [Hinode](https://gethinode.com/) theme.

## Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) 0.163.1 or newer
- [Go](https://go.dev/dl/) (for Hugo modules)
- PowerShell (to regenerate release notes)

## Local development

```bash
# Install theme modules
hugo mod get

# Regenerate release pages from source (required before first build)
pwsh scripts/generate-releases.ps1

# Bundle the OpenAPI spec for the interactive API reference page
pwsh scripts/bundle-openapi.ps1

# Preview with drafts
hugo server -D

# Production build
hugo --gc --minify
```

Open http://localhost:1313/

## Project layout

| Path | Purpose |
|------|---------|
| `content/` | Documentation pages (Markdown) |
| `config/_default/` | Hugo and theme configuration |
| `data/*.yaml` | Sidebar navigation per section |
| `layouts/` | Theme overrides |
| `assets/img/` | Logos and screenshots |
| `static/openapi/` | OpenAPI specification (split source files) |
| `scripts/bundle-openapi.ps1` | Bundles OpenAPI into `static/openapi/openapi.bundle.yaml` |
| `scripts/releases-source.md` | Source for release notes |
| `scripts/generate-releases.ps1` | Generates `content/releases/` and `data/releases-*.yaml` |

Generated release files (`content/releases/`, `data/releases-*.yaml`) are not committed; CI and local builds run the generator first.

## CI/CD

GitHub Actions workflows:

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| [`build-documentation.yml`](.github/workflows/build-documentation.yml) | Pull requests | Build Hugo site, check links, upload artifact |
| [`deployment.yml`](.github/workflows/deployment.yml) | Push to `master` | Build and deploy to Azure Static Web Apps |

On every pull request to `main`/`master`, the site is built and internal links are checked with [lychee](https://github.com/lycheeverse/lychee).

On push to `master`, the built site is deployed to **Azure Static Web Apps** using `PLEDGER_WEB_DEPLOY_TOKEN` (same setup as the [existing deployment workflow](https://github.com/pledger-io/user-documentation/blob/master/.github/workflows/deployment.yml)).

### Required secret

- `PLEDGER_WEB_DEPLOY_TOKEN` — Azure Static Web Apps deployment token

## Editing release notes

1. Edit `scripts/releases-source.md`
2. Run `pwsh scripts/generate-releases.ps1`
3. Commit only `scripts/releases-source.md` (generated files are recreated in CI)

Version headings: `## 5.1.0` or `== 5.1.0`. Section headings: `###` / `====` or `===` / `====`.
