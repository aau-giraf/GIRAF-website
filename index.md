---
layout: home
title: Welcome to GIRAF
---

<div class="post-cards">
{% for post in site.posts limit:4 %}
  <article class="post-card">
    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
    <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
    <p>{{ post.excerpt | strip_html | truncate: 150 }}</p>
  </article>
{% endfor %}
</div>

<p class="news-all"><a href="{{ '/blog/' | relative_url }}">All news →</a></p>
