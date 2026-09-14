---
layout: page
title: Foodplanner
permalink: /apps/foodplanner/
---

[← Back to all applications]({{ '/apps/' | relative_url }})

A meal-planning application for institutions caring for children with selective eating habits: a
common challenge for many autistic individuals. The app helps caregivers create structured, visual
meal plans ("madpakker") that show children exactly what to expect at mealtimes, using realistic
food images in the spirit of the Picture Exchange Communication System (PECS).

Teachers browse their classes and pupils, parents view and edit their child's lunch plan day by day,
and a built-in feedback chat connects home and school. A lunchbox contains foods, and a food contains
ingredients, so a child can see all the way down to what is in the sandwich. Foodplanner runs its own
backend; it is not yet on giraf-core.

## Screenshots

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/07-madpakke-sandwich.jpg' | relative_url }}" alt="A Foodplanner lunchbox: a photo of a ham-and-bacon sandwich, its name, and the start of its ingredient list">
  <figcaption><em>A lunchbox ("madpakke") with a photo of the real food.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/06-madpakke-ingredients.jpg' | relative_url }}" alt="A Foodplanner lunchbox screen: a photo of a ham-and-bacon sandwich, its name, and an ingredient list below: ham, bread, bacon and tomato, each with its own picture">
  <figcaption><em>The sandwich broken down into ham, bread, bacon and tomato, each with its own picture.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/04-madpakke.png' | relative_url }}" alt="A parent's view of a child's lunch plan with a food image">
  <figcaption><em>A parent's daily lunch plan.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/05-madpakke-fruit.png' | relative_url }}" alt="Lunch plan for another day showing fruit and vegetables">
  <figcaption><em>Stepping through the days: each meal shown with its own food photo.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/02-teacher-landing.png' | relative_url }}" alt="Teacher chooses a pupil, browsing by class">
  <figcaption><em>A teacher chooses a pupil to plan for, searching or browsing by class.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/03-pupils.png' | relative_url }}" alt="A class expanded to show its pupils">
  <figcaption><em>Pupils grouped by class, ready to open an individual meal plan.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/foodplanner/01-login.png' | relative_url }}" alt="Foodplanner login screen">
  <figcaption><em>The Foodplanner sign-in screen.</em></figcaption>
</figure>

## Technology

Flutter (iOS/Android/Web) + ASP.NET API + PostgreSQL + MinIO image storage.

**Repositories:**
- [foodplanner](https://github.com/aau-giraf/foodplanner): mobile/web application
- [foodplanner-api](https://github.com/aau-giraf/foodplanner-api): backend API
