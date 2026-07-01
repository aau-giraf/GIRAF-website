# GIRAF website

The public GIRAF site — a Jekyll static site (project info, app overviews, and news). Deployed to
**GitHub Pages via GitHub Actions**: pushing to `main` builds and publishes automatically. It is
**not** the technical wiki (that is a separate MkDocs repo, `aau-giraf/wiki`).

- **Canonical URL:** `https://giraf.cs.aau.dk` (set as `url` in `_config.yml`; the intended
  production home and what generated sitemap/SEO links point to).
- **Currently live:** `https://aau-giraf.github.io/GIRAF-website/` until AAU IT points DNS
  (`giraf.cs.aau.dk CNAME aau-giraf.github.io`) and the custom domain is set in Settings → Pages.

> Note: `giraf.cs.aau.dk` today still serves an **old, unrelated WordPress site** — not this repo,
> until the DNS cutover happens.

## Local development

Requires Ruby and Bundler.

```bash
bundle install        # install gems
./site.sh serve       # dev server at http://127.0.0.1:4000, rebuilds on change
```

`./site.sh` with no argument lists every command.

## Content

- **Pages** are markdown files at the repo root (`about.md`, `apps.md`, `history.md`,
  `students.md`, `contact.md`, `index.md`, `blog.md`), each with its own `permalink`.
- **App pages** live in `apps/` (`weekplanner.md`, `foodplanner.md`, `vta.md`); `apps.md` indexes them.
- **Blog posts** live in `_posts/` as `YYYY-MM-DD-title.md`. Create one with:
  ```bash
  ./site.sh post "Your Post Title"     # or:  ./site.sh draft "..."  (into _drafts/)
  ```
  The homepage (`index.md`) automatically lists the 5 most recent posts by date.
- **Navigation** is defined in `_data/settings.yml` (`menu:`) — edit it there, not in the templates.

## Build and deploy

```bash
./site.sh build       # production build into _site/ (the same build CI runs)
```

**Deploying is just pushing to `main`.** `.github/workflows/pages.yml` builds the site with
`bundle exec jekyll build` (`JEKYLL_ENV=production`, Ruby 3.4) and publishes `_site/` to GitHub Pages
on every push (or via the Actions tab → "Run workflow"). No SSH, no server to restart. `Gemfile.lock`
is committed so CI resolves identical gem versions. Pages uses build type "GitHub Actions" on the
public `aau-giraf/GIRAF-website` repo; the `CNAME` file carries the custom domain.
