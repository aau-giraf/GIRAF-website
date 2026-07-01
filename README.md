# GIRAF website

The public GIRAF site — a Jekyll static site (project info, app overviews, news). Not the technical
wiki (that's `aau-giraf/wiki`, MkDocs).

- **URL:** `https://giraf.cs.aau.dk` (canonical, set in `_config.yml`). Live at
  `https://aau-giraf.github.io/GIRAF-website/` until DNS is cut over.

## Local development

```bash
bundle install
./site.sh serve       # http://127.0.0.1:4000
```

`./site.sh` with no argument lists every command.

## Content

- **Pages** — markdown files at the repo root, each with its own `permalink`.
- **App pages** — `apps/` (`apps.md` indexes them).
- **Blog posts** — `_posts/YYYY-MM-DD-title.md` (or `./site.sh post "Title"`); the homepage lists the
  5 most recent.
- **Navigation** — `_data/settings.yml` (`menu:`).

## Deploy

Push to `main`. `.github/workflows/pages.yml` builds and publishes to GitHub Pages.
