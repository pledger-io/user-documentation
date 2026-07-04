# Pledger.io documentation audit & task list

Audit date: 2026-07-04  
Stack: Hugo Extended 0.163.1 + [Hinode](https://gethinode.com/) v1.23.7 (Go modules)

Use the checkboxes below to track progress. Tasks are grouped by priority.

---

## Current setup (reference)

| Area | State |
|------|-------|
| Generator | Hugo Extended + Hinode theme via Go modules |
| Content model | Diátaxis-inspired: Getting Started, How-To, Concepts, Architecture |
| Navigation | Top menu (`config/_default/menus/menus.en.toml`) + section sidebars (`data/*.yaml`) |
| Customization | Layout overrides, PlantUML shortcode, empty social footer |
| API docs | OpenAPI spec in `static/openapi/` |
| Build | `hugo --gc --minify` succeeds (~78 pages) |

---

## Already done (since audit)

- [x] Brand colors in `config/_default/params.toml` (`primary`, `success`, `info`)
- [x] Tagline override in `config/_default/languages.toml`

---

## P0 — Critical (do first)

### Project hygiene

- [x] Add `resources/` and `.hugo_build.lock` to `.gitignore` (keep `public/` and `_vendor/` ignored)
- [ ] Make initial git commit with source files only (no `public/`, `resources/`, `_vendor/`)
- [x] Add `README.md` with prerequisites, `hugo server -D`, sidebar YAML explanation, screenshot locations

### Missing tutorial screenshots

Tutorial pages reference PNGs that are **not** in the repo. Only logos + 3 SVG thumbnails exist under `assets/img/`.

- [ ] Restore `assets/img/getting-started/create-user/` (2 PNGs referenced in `create-user.md`)
- [ ] Restore `assets/img/getting-started/first-accounts/` (6 PNGs referenced in `first-account.md`)
- [x] Restore `assets/img/getting-started/catagorizing/` (7 PNGs; legacy folder name matches image paths in `categorizing.md`)
- [ ] Add `assets/img/architecture/data-model.png` (referenced in `architecture/design/domain.md`)
- [ ] Audit how-to pages for missing images (`accounts.md`, `budgeting.md`, `liabilities.md`)
- [ ] Run link/image check after restore (manual or CI)

### Home page & messaging

- [ ] Change home hero CTA from `/architecture/` to `/getting-started/` (or `/getting-started/installation/docker/`)
- [ ] Rewrite home hero copy: align with personal finance positioning (not “teams” / “operational finance”)
- [ ] Fix home page link: Docker install is under Getting Started, not How-To (`content/_index.md` line ~43)
- [ ] Unify terminology: home uses “Reference guide” / “Explanations” but nav uses “Architecture” / “Financial concepts”

### Brand assets

- [ ] Add `assets/img/favicon.png` (16, 32, 48 px — configure in `params.toml` under `[favicon]`)
- [ ] Add `assets/img/logo1280x640.png` for Open Graph / social sharing
- [ ] Add `assets/img/logo512x512.png` for schema.org metadata
- [ ] Configure `[schema]` in `params.toml` (name, logo, image URLs pointing to Pledger assets)

---

## P1 — High impact (next)

### Empty or stub pages

Hide incomplete content until written, or add “Coming soon” placeholders.

| File | Issue |
|------|-------|
| `content/how-to/advanced/rules.md` | Empty body |
| `content/how-to/advanced/scheduling.md` | Empty body |
| `content/how-to/your-finances/transactions.md` | Empty body |
| `content/how-to/your-finances/overview.md` | Empty body |
| `content/how-to/your-finances/contracts.md` | `draft: true`, empty |
| `content/getting-started/advanced/schedule-bills.md` | `draft: true`, empty |
| `content/architecture/api-docs/_index.md` | Raw YAML link only |
| `content/getting-started/first-steps/_index.md` | Missing `title` in front matter |

- [ ] Set `draft: true` on all empty how-to pages OR write content OR add placeholder text
- [ ] Uncomment or remove sidebar entries in `data/how-to.yaml` (Transactions, Contracts commented out but pages exist)
- [x] Fix typo: `rules.md` title “catagorize” → “categorize”
- [x] Fix typo: `domain.md` title “bussiness” → “business”
- [x] Fix folder/path typo: image folder kept as `catagorizing/` (legacy asset paths); prose uses correct spelling `categorizing`

### PlantUML & diagrams

- [ ] Convert `content/concepts/financial/transactions.md` fenced ` ```plantuml ` blocks to `{{< plantuml >}}` shortcode (only the shortcode renders)
- [ ] Verify all architecture PlantUML pages render (`backend-design.md`, `ui-design.md`, `account-reconcile.md`)

### Naming consistency

- [x] Replace “Personal Ledger” with “Pledger.io” in installation docs (`docker.md`, `compose.md`, `kubernetes.md`, `windows.md`)
- [x] “Rest API” → “REST API” in `architecture/api-docs/_index.md`

### Promo page

- [ ] Decide fate of `/promo/`: remove, rewrite for OSS/community, or keep separate from docs
- [ ] Replace placeholder `mailto:sales@example.org` if page is kept
- [ ] Remove enterprise copy (“teams”, “operational finance”, “Contact sales”) unless intentional

### Navigation & usability

- [ ] Enable breadcrumbs: `navigation.breadcrumb = true` in `params.toml`
- [ ] Add “Edit this page” / GitHub issue link in footer (Hinode supports via `params.docs.github`)
- [ ] Consider enabling search modal: `navigation.search.modal = true`
- [ ] Enable page metadata: change `pages.docs.metadata` from `"none"` to show last-updated dates
- [ ] Enable `enableGitInfo = true` in `hugo.toml` for git-based last modified dates

---

## P2 — Medium term

### CI/CD

- [x] Add GitHub Actions workflow: `hugo --gc --minify` on push/PR
- [x] Pin Hugo version in CI (0.163.1 extended)
- [x] Add link checker step (internal links with lychee)
- [x] Configure deploy (Azure Static Web Apps via `deployment.yml`)
- [x] Add `README.md` with local dev and CI instructions

### API documentation

- [ ] Embed Swagger UI or Redoc for `static/openapi/openapi.yml`
- [ ] Expand `architecture/api-docs/_index.md` beyond a single YAML download link

### Release notes

- [ ] Split `content/architecture/releases.md` (~850 lines) by major version, paginate, or move to GitHub Releases only
- [ ] Consider moving releases out of Architecture section into top-level `/releases/`

### Information architecture

- [ ] Separate user docs (Getting Started, How-To, Concepts) from developer docs (Architecture, ADRs, API) in top nav or landing page
- [ ] Add cross-links: Concepts ↔ How-To (e.g. transactions concept → how-to transactions page)
- [ ] Add “New here?” onboarding path on home: Install → Create user → First account → Categorize

### Custom 404

- [ ] Customize `404` page with links to Getting Started and search

---

## P3 — Polish & long term

### Visual design

- [ ] Reduce hero fatigue: remove duplicate heroes on every First Steps leaf page; use card grids on section indexes instead
- [ ] Redesign home page: hero + 4 section cards + optional app screenshot carousel
- [ ] Add `assets/scss/custom.scss` for:
  - Body font weight 400 (Inter at 300 is quite light)
  - Styled TIP / WARNING / NOTE callouts in tutorials
  - Screenshot frames (border-radius, shadow)
  - Slightly wider content column on large screens
- [ ] Test dark mode: logo contrast, screenshot visibility
- [ ] Align live site ([pledger.io](https://www.pledger.io/)) messaging with docs if both are maintained

### Hugo / theme maintenance

- [ ] Monitor Hinode updates for deprecated Hugo APIs (build currently warns about `.Site.Data`, libsass, module mounts)
- [ ] Plan migration to Dart Sass before Hugo drops libsass

### Release notes

- [x] Split monolithic `releases.md` into `/releases/` section with per-major-version pages
- [x] Add visual timeline for the 8 most recent releases
- [x] Use collapsible accordions for patch releases within each major version
- [x] Add **Releases** to main navigation; remove from Architecture sidebar
- [x] Redirect `/architecture/releases/` to `/releases/`
- [x] Add `scripts/generate-releases.ps1` workflow (edit `scripts/releases-source.md`, then regenerate)

### Future enhancements

- [ ] Versioned docs tied to app releases
- [ ] i18n (e.g. Dutch) if needed
- [ ] Analytics (optional, privacy-respecting)

---

## File reference — key locations

```
config/_default/
  hugo.toml          # base URL, title, modules, markup
  params.toml        # theme, navigation, colors, docs links
  languages.toml     # tagline override
  menus/menus.en.toml

data/
  getting-started.yaml   # sidebar for Getting Started
  how-to.yaml
  concepts.yaml
  architecture.yaml

content/
  _index.md              # home page
  getting-started/       # installation + first steps
  how-to/                # task guides
  concepts/              # explanations
  architecture/          # technical docs, ADRs, API, releases
  promo/                 # marketing page (review needed)

assets/img/              # logos, screenshots (many missing)
static/openapi/          # OpenAPI spec
layouts/                 # theme overrides
```

---

## Quick commands

```bash
# Local preview (includes drafts)
hugo server -D

# Production build
hugo --gc --minify

# Clean generated cache
hugo --gc
```

---

## Summary

**Strengths:** Solid Diátaxis structure, good Getting Started prose, sensible Hugo/Hinode setup, OpenAPI spec included.

**Main gaps:** Missing tutorial screenshots, empty how-to pages, brand/theming partially fixed, mixed personal-finance vs enterprise messaging, no CI/README/git hygiene.

**Highest ROI:** Restore screenshots → fix home page journey → hide incomplete pages → add CI + README.
