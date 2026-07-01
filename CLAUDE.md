# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The **public-facing GIRAF website** — a Jekyll 4.3 static site (marketing / project info / news),
repo `github.com/aau-giraf/GIRAF-website`. Deployed to **GitHub Pages via GitHub Actions** — a push
to `main` builds and publishes automatically (see *Deployment* below).

**URLs (don't confuse these):**
- **Canonical** = `https://giraf.cs.aau.dk` — set as `url` in `_config.yml`, the intended production
  home; generated sitemap/SEO links use it. **Keep it as-is** even though it's not live there yet.
- **Currently live (temporary test)** = `https://giraf.nbhansen.dk` (Hetzner + Cloudflare). Do NOT
  promote this into config — it's a test domain.
- `giraf.cs.aau.dk` *today* serves an unrelated legacy **WordPress** site, not this repo; the cutover
  hasn't happened, so this Jekyll site is reachable only at the nbhansen.dk test URL right now.

> This is the info site, **not a wiki** — the technical wiki is a *separate* MkDocs repo
> (`aau-giraf/wiki`). The repo itself is the source of truth: verify against the real files before
> trusting any prose. (The README and `site.sh`/`new-post.sh` were rewritten to match reality; if you
> find a doc claiming a `_wiki/` directory or "Giraf Wiki", it has regressed — fix it.)

## Commands

`bundle` lives in Ruby's user gem bindir (`~/.local/share/gem/ruby/<ver>/bin`), added to PATH by
`~/.config/fish/config.fish`. If `bundle` is "command not found" in some other shell/env, that dir
isn't on PATH — add it (or `gem install bundler`) before the commands below.

```bash
bundle install                        # install gems (Gemfile.lock is gitignored — not committed)
./site.sh serve                       # dev server at http://127.0.0.1:4000 (auto-rebuild)
./site.sh drafts                      # serve including _drafts/ (dir does not exist yet — create if needed)
./site.sh build                       # JEKYLL_ENV=production jekyll build into _site/
./site.sh post "Title"                # scaffold _posts/YYYY-MM-DD-title.md  (or: ./site.sh draft "Title")
```

`site.sh` is a thin wrapper over `bundle exec jekyll …`; run those directly if you prefer. `site.sh`
with no argument prints every command.

There are **no tests** and no lint step — it's a static content site.

### Deployment

Deployed via **GitHub Pages + GitHub Actions**: `.github/workflows/pages.yml` runs on every push to
`main` (and manual `workflow_dispatch`), builds with `bundle exec jekyll build` (`JEKYLL_ENV=production`,
Ruby 3.4 — the same build as `./site.sh build`), and publishes `_site/` to Pages. **Deploying = pushing
to `main`.** No SSH, no server to restart.

- Pages is configured with **build type "GitHub Actions"** (not "deploy from a branch"). The repo is
  **public** on the `aau-giraf` org (free plan → Pages is free). `Gemfile.lock` **is committed** so CI
  resolves identical gem versions.
- **Custom domain** = `giraf.cs.aau.dk` (see the `CNAME` file + `url` in `_config.yml`). It goes live
  once AAU IT adds a DNS record `giraf.cs.aau.dk CNAME aau-giraf.github.io` and the domain is set in
  Settings → Pages; until then the site serves at `https://aau-giraf.github.io/GIRAF-website/`.
- **Legacy (retired):** the old path was `./site.sh deploy` → `deploy.sh` rsync over SSH to a Hetzner
  box (`giraf.nbhansen.dk`, cloudflared tunnel). `deploy.sh` still exists but is no longer the deploy
  mechanism — prefer a `main` push.
- The site's own helper scripts (`deploy.sh`, `site.sh`, `new-post.sh`) and docs are listed under
  `exclude:` in `_config.yml` so they are NOT built into `_site/` or served publicly — keep new
  non-content files excluded.

### Helper scripts

`site.sh` (task shortcuts) and `new-post.sh` (post scaffolder, called by `site.sh post`/`draft`).
`new-post.sh` is interactive (prompts for a title if omitted, offers to open an editor). Both only do
what's described above — no hidden behavior.

## Architecture

Standard Jekyll, no collections. Content is plain pages plus blog posts:

- **Pages** (root `.md` files with YAML front matter + explicit `permalink`):
  `index.md` (home), `about.md`, `apps.md`, `history.md`, `students.md`, `contact.md`, `blog.md` (News).
- **App detail pages**: `apps/weekplanner.md`, `apps/foodplanner.md`, `apps/vta.md`
  (each `layout: page`, `permalink: /apps/<name>/`). `apps.md` is the index that links to them.
- **Blog posts**: `_posts/YYYY-MM-DD-slug.md`, `layout: post`. The homepage (`index.md`) auto-lists
  the 5 most recent posts by date — there is **no** "featured" mechanism (a `featured:` flag does
  nothing; don't add one or document one).
- **Layouts** (`_layouts/`): `default.html` is the shell (head + header + main + footer); `home.html`,
  `page.html`, `post.html` all wrap `default`. Set via `_config.yml` `defaults` (pages→default,
  posts→post) or per-file front matter.
- **Includes** (`_includes/`): `head.html`, `header.html` (nav), `footer.html`, plus post helpers
  (`post-date`, `post-share`, `related-posts`, `disqus`).
- **Styles** (`_sass/`): SCSS partials imported through `assets/css/main.scss`. Edit partials, not
  generated CSS.
- **Assets**: `assets/img/` (logo, hero) and `assets/screenshots/{weekplanner,foodplanner,vta}/`
  (referenced by the app pages).

### Two things that bite

- **Navigation is a single source of truth**: the top/mobile nav is generated from
  `_data/settings.yml` → `menu` (rendered in `_includes/header.html`). Add/rename a nav item there,
  not in the header HTML. `settings.yml` also holds Disqus, social icons, and post-UI text.
- **`_site/` is build output** (gitignored, deploy artifact). Never hand-edit it; edit source and rebuild.

## Conventions

- Site is multi-page about the GIRAF *platform* (weekplanner, foodplanner, VTA) — keep app pages in
  sync with the real apps; deep technical docs belong in the MkDocs wiki, not here.
- Use `{{ '/path' | relative_url }}` for internal links/assets (the codebase does this consistently;
  `baseurl` is empty but keep the pattern).
- This repo lives under the **`aau-giraf`** org (`github.com/aau-giraf/GIRAF-website`), alongside the
  rest of the GIRAF platform. (It was transferred from the maintainer's personal account in 2026.)
