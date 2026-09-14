---
layout: post
title: "Introducing giraf-core, a shared backend for the platform"
date: 2026-02-13
image: 'giraf-logo.png'
---

GIRAF is three apps: Weekplanner, Foodplanner and Visual Tangible Artefacts (VTA). Each has its own backend, database and deployment. They share the same concepts: users, organisations, citizens, pictograms.

Until now each backend managed those on its own. That means duplicated user tables, duplicated login code, and no single place where "Alice is an admin at Egebakken" lives as a fact.

**giraf-core** is a shared service that owns that common data and the login for the platform. Weekplanner is the first app to use it; VTA and Foodplanner still run their own users and will move later.

## How it works

```
┌─────────────────────────────────────────────────────────────────┐
│                    Mobile Apps (Flutter)                        │
│   Weekplanner          Food Planner          VTA               │
└──────┬──────────────────────┬───────────────────┬──────────────┘
       │ domain data          │ domain data       │ domain data
       ▼                      ▼                   ▼
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│ Weekplanner  │   │ Foodplanner  │   │ VTA Backend  │
│ Backend      │   │ Backend      │   │              │
│ (.NET 10)    │   │ (.NET 8)     │   │ (.NET 8)     │
│ Activities   │   │ Meal plans,  │   │ Artefacts,   │
│              │   │ ingredients  │   │ boards       │
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

- **Apps authenticate with Core.** A mobile app calls Core's `/token/pair` endpoint and gets back a JWT.
- **JWTs carry org roles.** The token payload includes something like `{"1": "owner", "5": "member"}`, so any app backend can check permissions locally without calling Core again.
- **Each app backend only stores its own domain data.** Weekplanner stores activities. VTA stores artefacts and boards. Foodplanner stores meal plans. None of them needs its own copy of users or organisations.
- **Core is the single source of truth.** One user account, one organization, one citizen record. Shared across every app on the platform.

## What it manages

Core handles seven areas:

- **Users** — registration, profiles, authentication
- **Organizations** — the institutions (schools, care facilities) using GIRAF
- **Members** — who belongs to which org, and with what role (owner, admin, member)
- **Citizens** — the children who use the apps
- **Grades** — groupings of citizens within an org
- **Pictograms** — the visual symbols used across the platform, both global and org-specific
- **Invitations** — letting admins invite new users to their organization

## Tech stack

We went with Django + Django Ninja for the API layer and PostgreSQL for the database. The codebase follows a consistent pattern across every feature: `models.py` → `schemas.py` → `services.py` → `api.py`. Business logic lives in the service layer, never directly in API endpoints.

Tests run against SQLite in-memory for speed, and the whole thing can be spun up with a single `docker compose up`.

## What's next

Weekplanner is being moved onto Core now. VTA and Foodplanner have their own user tables and will follow. New features should build against Core rather than add another copy of users and organisations.

The interactive API docs are at `http://localhost:8000/api/v1/docs` once the service is running.
