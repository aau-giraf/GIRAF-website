---
layout: post
title: "Introducing GIRAF Core — A Shared Backend for the Platform"
date: 2025-02-13
image: 'giraf-logo.png'
---

GIRAF has grown from a single app into a platform with multiple applications — Weekplanner, Food Planner, and Visual Tangible Artefacts (VTA). Each app has its own backend, its own database, and its own deployment. But they all share the same fundamental concepts: users, organizations, citizens, pictograms.

Until now, each backend managed these shared concepts independently. That means duplicated user tables, duplicated auth logic, and no single place where "Alice is an admin at Egebakken" lives as a fact. If a new app joins the platform, it has to reimplement all of that from scratch.

**GIRAF Core** fixes this. It's a single shared service that owns the common domain data and authentication for the entire platform.

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│                    Mobile Apps (Flutter)                        │
│   Weekplanner          Food Planner          VTA               │
└──────┬──────────────────────┬───────────────────┬──────────────┘
       │ domain data          │ domain data       │ domain data
       ▼                      ▼                   ▼
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│ Weekplanner  │   │ Food Planner │   │ VTA Backend  │
│ Backend      │   │ Backend      │   │              │
│ (.NET / C#)  │   │ (TBD)        │   │ (TBD)        │
│ Activities,  │   │ Meals, Menus │   │ Exercises,   │
│ Schedules    │   │ Nutrition    │   │ Progress     │
└──────┬───────┘   └──────┬───────┘   └──────┬───────┘
       │                  │                   │
       │  users, orgs, citizens, pictograms   │
       ▼                  ▼                   ▼
┌─────────────────────────────────────────────────────────────────┐
│                       GIRAF Core API                            │
│                    (Django + Ninja, Python)                      │
│                                                                 │
│  Auth/JWT │ Users │ Orgs │ Citizens │ Grades │ Pictos │ Invites │
└─────────────────────────┬───────────────────────────────────────┘
                          │
                    ┌─────▼─────┐
                    │  Core DB  │
                    │ PostgreSQL│
                    └───────────┘
```

The idea is straightforward:

- **Apps authenticate with Core.** A mobile app calls Core's `/token/pair` endpoint and gets back a JWT.
- **JWTs carry org roles.** The token payload includes something like `{"1": "owner", "5": "member"}`, so any app backend can check permissions locally without calling Core again.
- **Each app backend only stores its own domain data.** Weekplanner stores schedules and activities. VTA stores exercises and progress. Neither needs to know about users or orgs — that's Core's job.
- **Core is the single source of truth.** One user account, one organization, one citizen record. Shared across every app on the platform.

## What It Manages

Core handles seven areas that every GIRAF app needs:

- **Users** — registration, profiles, authentication
- **Organizations** — the institutions (schools, care facilities) using GIRAF
- **Members** — who belongs to which org, and with what role (owner, admin, member)
- **Citizens** — the children who use the apps
- **Grades** — groupings of citizens within an org
- **Pictograms** — the visual symbols used across the platform, both global and org-specific
- **Invitations** — letting admins invite new users to their organization

## Tech Stack

We went with Django + Django Ninja for the API layer and PostgreSQL for the database. The codebase follows a consistent pattern across every feature: `models.py` → `schemas.py` → `services.py` → `api.py`. Business logic lives in the service layer, never directly in API endpoints.

Tests run against SQLite in-memory for speed, and the whole thing can be spun up with a single `docker compose up`.

## What's Next

The Weekplanner backend already has its own user and org tables. The migration path is to gradually point it at Core instead. New features and new apps should build against Core from the start, rather than reinventing shared domain concepts yet again.

If you're working on GIRAF this semester and want to poke around, the interactive API docs are at `http://localhost:8000/api/v1/docs` once you have the service running.
