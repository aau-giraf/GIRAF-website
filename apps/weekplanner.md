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

Schedules are managed per child or per class, across organisations. Users, citizens and pictograms
come from the shared **giraf-core** service; pictograms can also be generated through giraf-ai.

## Screenshots

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/02-day-cards.jpg' | relative_url }}" alt="Four pictogram activity cards in a row: lunch, the zoo, a bus ride and home, each with a picture and a tick circle to mark it done">
  <figcaption><em>A child's day: each activity is a pictogram card they can check off.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/03-weekplan.png' | relative_url }}" alt="A day plan of pictogram activity cards with times, the first two completed">
  <figcaption><em>The day view with times, the first two activities ticked off.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/04-week-overview.png' | relative_url }}" alt="Week overview with all seven days side by side">
  <figcaption><em>The week overview: a calm look at the whole week at a glance.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/05-add-activity.jpg' | relative_url }}" alt="Add-activity form with pictogram search, upload and AI generation">
  <figcaption><em>Adding an activity: search the pictogram library, upload an image, or generate one with AI. The spoken title can be generated too.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/weekplanner/01-login.png' | relative_url }}" alt="GIRAF Ugeplan login screen">
  <figcaption><em>Signing in to GIRAF Ugeplan.</em></figcaption>
</figure>

## Technology

Flutter (iOS/Android/Web) + ASP.NET API + PostgreSQL, with JWT authentication via giraf-core.

**Repository:** [weekplanner](https://github.com/aau-giraf/weekplanner)
