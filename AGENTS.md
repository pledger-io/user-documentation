# AGENTS.md

## Cursor Cloud specific instructions

This repo is the **Pledger.io user documentation** site — a Hugo Extended static site using the Hinode theme. It does **not** contain the Pledger.io application source (that lives in separate `pledger-io/*` repos). Development here means building and previewing the docs site.

### Toolchain (already installed in the VM snapshot)
- Hugo Extended `0.163.1` (must be the *extended* build; SCSS won't compile otherwise), Go (for Hugo modules), PowerShell `pwsh` (build scripts are `.ps1`), Node.js 22 (OpenAPI bundling), and `lychee` (link checker).
- The startup update script runs `hugo mod get` to refresh the Hinode theme module.

### Build/run (see `README.md` for the canonical commands)
- Generated files are **not committed** (they're gitignored): `content/releases/*.md`, `data/releases*.yaml`, `static/openapi/openapi.bundle.yaml`. You must regenerate them before a build or the site will be missing the Releases and API-docs pages:
  - `pwsh scripts/generate-releases.ps1` — regenerates the Releases pages from `scripts/releases-source.md`.
  - `pwsh scripts/bundle-openapi.ps1` — bundles `static/openapi/openapi.yml` into `openapi.bundle.yaml` via `npx --yes @redocly/cli`. This needs network access for `npx`; the Redocly bundler prints non-fatal duplicate-schema WARNINGs that can be ignored.
- Dev server: `hugo server -D` (serves on `http://localhost:1313/`). Use `--bind 0.0.0.0` if you need to reach it from outside the VM.
- Production build: `hugo --gc --minify` (outputs to `public/`). Deprecation WARNINGs are pre-existing and non-fatal.

### Lint (link checking)
- The CI "lint" is a lychee link check over the built `public/` dir. Reproduce locally:
  - `hugo --gc --minify` then `pwsh scripts/prepare-lychee-config.ps1` then `lychee --config .lychee.ci.toml --root-dir "$(pwd)/public" ./public`.
- There is no separate unit-test suite; a clean `hugo` build + a 0-error lychee run is the effective test.
