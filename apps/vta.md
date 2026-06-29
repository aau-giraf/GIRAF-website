---
layout: page
title: Visual Tangible Artefacts
permalink: /apps/vta/
---

[← Back to all applications]({{ '/apps/' | relative_url }})

A digital communication tool built around **boards** of visual artefacts. Each artefact is a card
with an image, a label, and an optional sound, and boards can be laid out freely as a "talking mat"
or in fixed slots for simpler, sequential communication.

VTA is designed for shared use between a child and a caregiver: a board can be **shared live** so
that changes appear on both screens at once, and the app includes built-in **video calling** and
**text-to-speech** so an artefact can speak its label aloud. A separate web dashboard lets
administrators manage users and the pairings that link caregivers to the children they support.

## Screenshots

<figure>
  <img src="{{ '/assets/screenshots/vta/04-artefact-library.png' | relative_url }}" alt="A library of communication artefacts: food, toys and everyday items">
  <figcaption><em>The artefact library — food, toys and everyday items a child can communicate with.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/vta/03-board.png' | relative_url }}" alt="An artefact placed on a communication board">
  <figcaption><em>Building a board — an artefact placed on the talking mat with its spoken label.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/vta/05-create-artefact.png' | relative_url }}" alt="Creating a new artefact by photo, upload or AI">
  <figcaption><em>Creating a new artefact — take a photo, upload an image, or generate one with AI.</em></figcaption>
</figure>

<figure>
  <img src="{{ '/assets/screenshots/vta/01-login.png' | relative_url }}" alt="VTA app login screen">
  <figcaption><em>Signing in to the VTA app.</em></figcaption>
</figure>

## Technology

Flutter (iOS/Android/Web) + Vue 3 admin dashboard + ASP.NET API + SignalR (real-time) + MySQL.

**Repository:** [visual-tangible-artefacts](https://github.com/aau-giraf/visual-tangible-artefacts)
