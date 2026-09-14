---
layout: page
title: About GIRAF
permalink: /about/
---

<div class="hero-section">
  <img src="{{ '/assets/img/giraf-hero.png' | relative_url }}" alt="GIRAF logo" class="hero-image">
</div>

## What is GIRAF?

**GIRAF** (Graphical Interface Resource for Autistic Folks) is a set of tablet apps for autistic children with little or no verbal speech. Since 2011, students at Aalborg University have built them with a Danish special-needs school.

---

## The applications

GIRAF is three apps: **Weekplanner** (visual schedules), **VTA** (communication boards) and **Foodplanner** (visual meal plans). Weekplanner runs on a shared service, giraf-core, for users, organisations and pictograms. VTA and Foodplanner still run their own backends. Each app is described, with screenshots, on the [applications page]({{ '/apps/' | relative_url }}).

---

## Who is it for?

Children with autism who communicate better with pictures than with words. Many have little or no verbal speech.

Teachers and caregivers build the schedules, boards and meal plans. Parents can follow along so that home and school match.

---

## Egebakken Specialskole

<div class="partner-highlight">
  <p><strong>Egebakken Specialskole</strong> in Vodskov, Aalborg Municipality, is GIRAF's partner school. The apps are tested there with a few children and teachers at a time, in the settings where they would be used.</p>
</div>

That testing changes the software. For many autistic children "lunch" does not mean roughly a cheese sandwich; it means exactly this bread, this cheese, these cucumbers. Interviews at Egebakken surfaced that, so Foodplanner got ingredients as a first-class concept: a lunchbox contains foods, and a food contains ingredients, and a child can see all the way down to what is in the sandwich.

---

## Academic home

GIRAF is a project at the **Department of Computer Science, Aalborg University**. It started in 2011. 5th semester students from Interaction Design, Software Development and Information Technology work on it every fall.

---

## Design principles

Many autistic children process pictures more easily than words. The apps follow five principles, drawn from TEACCH and PECS:

| Principle | Why it matters |
|-----------|----------------|
| **Predictability** | Knowing what comes next reduces anxiety. The child can prepare for transitions. |
| **Visual clarity** | Pictures communicate without requiring social interaction. |
| **Simplicity** | Uncluttered screens with one action at a time. |
| **Consistency** | The same action looks and works the same way everywhere. |
| **Independence** | A visual schedule lets a child follow a routine without constant verbal reminders. |

---

## Open source

All GIRAF code is open source at [github.com/aau-giraf](https://github.com/aau-giraf):

- [weekplanner](https://github.com/aau-giraf/weekplanner): Weekplanner app and backend
- [visual-tangible-artefacts](https://github.com/aau-giraf/visual-tangible-artefacts): VTA app, API and admin dashboard
- [foodplanner](https://github.com/aau-giraf/foodplanner) and [foodplanner-api](https://github.com/aau-giraf/foodplanner-api): Foodplanner app and backend
- [giraf-core](https://github.com/aau-giraf/giraf-core): shared service for users, organisations, citizens and pictograms
- [giraf-ai](https://github.com/aau-giraf/giraf-ai): pictogram generation and text-to-speech
- [giraf-deploy](https://github.com/aau-giraf/giraf-deploy): Docker Compose for the full stack

---

## Get involved

- **Students at AAU**: see [For Students]({{ '/students/' | relative_url }})
- **Developers**: open issues are on [GitHub](https://github.com/aau-giraf)
- **Institutions**: [contact us]({{ '/contact/' | relative_url }}) if you want to try the apps
