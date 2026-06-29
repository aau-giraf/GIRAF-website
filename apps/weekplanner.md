---
layout: page
title: Weekplanner
permalink: /apps/weekplanner/
---

[← Back to all applications]({{ '/apps/' | relative_url }})

The visual weekly schedule at the heart of GIRAF. Caregivers build a child's day and week from
**pictograms**, so the child can see what is happening, in what order, and when. Each activity can
carry a start and end time, a title, a pictogram, and a completion toggle the child ticks off as the
day progresses. "Choice activities" let a child pick between options when a task allows it.

Schedules are managed per individual child or per class, across multiple organisations, with users,
citizens and pictograms shared through the central **giraf-core** service. Originally developed from
2011, Weekplanner has been rebuilt as a modern Flutter and .NET application.

## Screenshots

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/03-weekplan.png' | relative_url }}" alt="A day plan of pictogram activity cards with times, the first two completed">
  <figcaption><em>A child's day: pictogram activity cards with times, the first two ticked off as done.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/04-week-overview.png' | relative_url }}" alt="Week overview with all seven days side by side">
  <figcaption><em>The week overview: a calm look at the whole week at a glance.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/05-add-activity.png' | relative_url }}" alt="Add-activity form with pictogram search, upload and AI generation">
  <figcaption><em>Adding an activity: search the pictogram library, upload an image, or generate one with AI.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/01-login.png' | relative_url }}" alt="GIRAF Ugeplan login screen">
  <figcaption><em>Signing in to GIRAF Ugeplan.</em></figcaption>
</figure>

## Technology

Flutter (iOS/Android/Web) + ASP.NET API + PostgreSQL, with JWT authentication via giraf-core.

**Repository:** [weekplanner](https://github.com/aau-giraf/weekplanner)
