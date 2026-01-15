---
layout: page
title: News
permalink: /blog/
---

All updates from the GIRAF project.

{% for post in site.posts %}
<article class="post-card">
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
  <p>{{ post.excerpt | strip_html | truncate: 200 }}</p>
</article>
{% endfor %}
