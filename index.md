---
layout: home
title: Welcome to GIRAF
---

## Latest News

{% for post in site.posts limit:5 %}
<article class="post-card">
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
  <p>{{ post.excerpt | strip_html | truncate: 150 }}</p>
</article>
{% endfor %}

[View all news →](/blog/)
