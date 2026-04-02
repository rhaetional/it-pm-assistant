# SCAFFOLD: doc/system/Data Model.md

> **Purpose of this template:** Defines the required structure and content standard for `doc/system/Data Model.md`.
> This document specifies the data structures, entities, and persistence model of the system.
> It is derived from Architecture.md and is a prerequisite for implementation.
>
> **Derives from:** `doc/Architecture.md` (must be locked before this document begins)
>
> **Definition of done:**
> - Every entity referenced in Architecture.md is defined here.
> - Every field has a type, nullability, and description.
> - All relationships between entities are explicit and directional.
> - Constraints (uniqueness, referential integrity, business rules) are documented.
> - Persistence mechanism is identified for each entity.
>
> **Skill:** `/system-design`

---

<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->

# Data Model

## Overview

<!--
Summarise the data model in 2–3 sentences.
Identify the persistence mechanism(s) used (e.g. SQLite, file system, in-memory, external API).
Reference the Architecture.md component(s) responsible for data ownership.
-->

---

## Entity Summary

<!--
Quick reference table of all entities. Full definitions follow below.

| Entity | Description | Persistence | Owner Component |
|---|---|---|---|
| [EntityName] | | | |
-->

---

## Entities

<!--
One section per entity.

### [EntityName]

**Description:** What this entity represents in the domain.
**Persistence:** Where and how it is stored.
**Owner:** Which component is responsible for reads and writes.

#### Fields

| Field | Type | Required | Description | Constraints |
|---|---|---|---|---|
| id | string | Yes | Unique identifier | Unique, non-null |
| created_at | datetime | Yes | Creation timestamp | ISO 8601 |
| | | | | |

#### Business Rules

<!--
Rules that govern valid states of this entity.
These are not schema constraints — they are domain rules enforced in logic.
Examples: "status may only transition from DRAFT to REVIEW, never backwards"
-->

#### Notes

<!--
Edge cases, known limitations, or design decisions specific to this entity.
Reference ADRs where relevant.
-->
-->

### [EntityName]

**Description:**
**Persistence:**
**Owner:**

#### Fields

| Field | Type | Required | Description | Constraints |
|---|---|---|---|---|
| | | | | |

#### Business Rules

#### Notes

---

## Relationships

<!--
Document relationships between entities explicitly.
Do not leave relationships implicit in field names.

| From | Relationship | To | Cardinality | Notes |
|---|---|---|---|---|
| [Entity A] | has many | [Entity B] | 1:N | |
| [Entity A] | belongs to | [Entity C] | N:1 | |
-->

---

## Persistence Strategy

<!--
For each persistence mechanism in use:
- What is stored there and why?
- What are the consistency guarantees?
- What happens on failure or restart?
- What migration or versioning approach applies?

Reference Spec.md NFR IDs for durability or availability requirements.
-->

---

## Open Questions

<!--
| # | Question | Owner | Target | Status |
|---|---|---|---|---|
| OQ-001 | | | | OPEN |
-->
