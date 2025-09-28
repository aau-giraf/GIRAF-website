---
layout: page
title: Documentation
permalink: /wiki/
---

# Giraf Documentation

Welcome to the Giraf project documentation.

## Wiki Pages

{% for page in site.wiki %}
- [{{ page.title }}]({{ page.url }})
{% endfor %}

## Quick Start

1. **Setup Development Environment**
   - Follow the [README](../README.md) setup instructions

2. **Create Content**
   - Use `./wiki-helper.sh new "Page Title"` for wiki pages
   - Use `./new-post.sh "Title"` for blog posts

3. **Deploy**
   - Use `./wiki-helper.sh deploy` to publish

## Organization

- `_wiki/` - Wiki pages and documentation
- `_posts/` - Blog posts and updates
- `_drafts/` - Work in progress content