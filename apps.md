---
layout: page
title: Our Applications
permalink: /apps/
---

GIRAF is three apps for autistic children with little or no verbal speech. Each covers one part of
the day. Weekplanner runs on the shared giraf-core service for users, organisations and pictograms;
VTA and Foodplanner still run their own backends.

## Weekplanner

<a href="{{ '/apps/weekplanner/' | relative_url }}">
  <img src="{{ '/assets/screenshots/weekplanner/02-day-cards.jpg' | relative_url }}" alt="Four pictogram activity cards in a row: lunch, the zoo, a bus ride and home, each with a tick circle to mark it done">
</a>

A visual weekly schedule. Caregivers build a child's day and week from **pictograms**, so the child
can see what is happening, in what order, and when, ticking off each activity as the day goes.

**Technology:** Flutter (iOS/Android/Web) + ASP.NET API + PostgreSQL, users and pictograms via giraf-core

[View screenshots & details →]({{ '/apps/weekplanner/' | relative_url }})

## Foodplanner

<a href="{{ '/apps/foodplanner/' | relative_url }}">
  <img src="{{ '/assets/screenshots/foodplanner/07-madpakke-sandwich.jpg' | relative_url }}" alt="A Foodplanner lunchbox: a photo of a ham-and-bacon sandwich, its name, and the start of its ingredient list">
</a>

A meal-planning app for children with selective eating habits. Parents and teachers build visual
meal plans ("madpakker") with realistic food images, a PECS-inspired approach, so a child knows
exactly what to expect at mealtimes.

**Technology:** Flutter (iOS/Android/Web) + ASP.NET API + PostgreSQL + MinIO

[View screenshots & details →]({{ '/apps/foodplanner/' | relative_url }})

## Visual Tangible Artefacts (VTA)

<a href="{{ '/apps/vta/' | relative_url }}">
  <img src="{{ '/assets/screenshots/vta/03-board.png' | relative_url }}" alt="An artefact placed on a VTA communication board">
</a>

A digital communication tool built around **boards** of visual artefacts (image + label + sound).
Boards can be shared live between a child and caregiver, with built-in video calling and
text-to-speech.

**Technology:** Flutter (iOS/Android/Web) + Vue 3 admin + ASP.NET API + SignalR + MySQL

[View screenshots & details →]({{ '/apps/vta/' | relative_url }})

All GIRAF code is open source at [github.com/aau-giraf](https://github.com/aau-giraf).
