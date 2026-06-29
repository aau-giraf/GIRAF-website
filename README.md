# GIRAF website

The public GIRAF site — a Jekyll static site (project info, app overviews, and news). Built locally
and deployed over **SSH to a Hetzner box**. It is **not** on GitHub Pages, and it is **not** the
technical wiki (that is a separate MkDocs repo, `aau-giraf/wiki`).

- **Canonical URL:** `https://giraf.cs.aau.dk` (set as `url` in `_config.yml`; this is the intended
  production home and what generated sitemap/SEO links point to).
- **Currently live (test):** `https://giraf.nbhansen.dk` — a temporary Hetzner+Cloudflare deployment.
  Don't bake this domain into config; it's not permanent.

> Note: `giraf.cs.aau.dk` today still serves an **old, unrelated WordPress site** — not this repo.
> Until DNS/hosting is cut over, this Jekyll site lives only at the nbhansen.dk test domain.

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
./site.sh build       # production build into _site/
./site.sh deploy      # build, then rsync _site/ to the Hetzner box over SSH
```

`deploy.sh` runs a production build, then `rsync -az --delete` of `_site/` to
`root@77.42.34.208:/var/www/giraf/` over SSH (key auth — no password, no `.env`). The box serves that
directory directly via `giraf-web.service` (`python3 -m http.server :8088`) behind a cloudflared
tunnel, so synced files go **live immediately — no restart**. `--delete` only ever affects files
inside `/var/www/giraf/`; nothing else on the (multi-purpose) server is touched. Override the target
with `DEPLOY_HOST` / `DEPLOY_PATH` env vars.
