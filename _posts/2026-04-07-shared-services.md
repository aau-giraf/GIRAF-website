---
layout: post
title: "Spring 2026: giraf-core and giraf-ai"
date: 2026-04-07
image: 'giraf-logo.png'
---

Two shared services were added to GIRAF this spring.

**giraf-core** holds what every app needs: users, organisations, citizens, grades and pictograms, and issues the login tokens the apps use. Weekplanner is the first app on it. VTA and Foodplanner still run their own backends and will move later.

**giraf-ai** generates pictograms from a text prompt and spoken titles with text-to-speech. Weekplanner uses it when adding an activity.

Weekplanner also got choice activities, where a child picks between options, and a landscape layout for iPad. The whole stack runs with one `docker compose up` from [giraf-deploy](https://github.com/aau-giraf/giraf-deploy).
