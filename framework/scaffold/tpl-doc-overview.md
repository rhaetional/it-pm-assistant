# SCAFFOLD: doc/Overview.md

> **Purpose of this template:** Defines the required structure and content standard for `doc/Overview.md`.
> This is the guiding star document. Every subsequent document derives from it.
> It must be the first document written and the last to be questioned.
>
> **Definition of done:**
> - Purpose is one paragraph, not a list.
> - Primary user is a single named role, not a category.
> - Key outcome is a measurable or falsifiable statement.
> - Scope boundaries explicitly state what is out of scope.
> - All downstream documents can be validated against this without ambiguity.
>
> **Skill:** `/documentation` — writing quality only (clarity, register, precision).
> This template is the authoritative structure. Do not apply the skill's "Architecture Doc"
> outline; it does not match this document type.

---

<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->

# Overview

## Purpose

<!--
One paragraph. Answer three questions in order:
1. What is this system?
2. Who is its primary user?
3. What is the key outcome it must deliver?

This paragraph is the guiding star. Every design decision is tested against it.
Do not use bullet points. Do not hedge. Commit to a statement.
-->

## Primary User

<!--
Name a single role. If multiple roles exist, identify the primary one — the one whose
needs take precedence when they conflict.

Format:
**Primary:** [Role name] — [one sentence describing their context and goal]
**Secondary:** [Role name] — [one sentence] (only if genuinely distinct)
-->

## Key Outcome

<!--
What does success look like? State it as a condition that can be evaluated.
Avoid "improves", "streamlines", "enables". Use "allows X to do Y in Z time"
or "replaces manual process X with automated equivalent".
-->

## Scope

### In Scope

<!--
List the capabilities and concerns this system owns.
Each item should be a noun phrase, not a sentence.
-->

### Out of Scope

<!--
Explicitly name what this system does not do.
This is as important as what it does — it prevents scope creep and
clarifies integration boundaries.
-->

## Key Constraints

<!--
High-level constraints only — system-level, organisational, or regulatory.
Detailed constraints belong in Spec.md.
Each constraint must be sourced: attributed to a system, decision, or organisational requirement.
Do not list assumptions as constraints.

Format:
- [Constraint statement] — Source: [system / decision / policy]
-->

## Document Status

<!--
List the status of all dependent documents.
Update this section when documents are locked.

| Document | Status | Locked |
|---|---|---|
| doc/Spec.md | DRAFT | — |
| doc/Architecture.md | NOT STARTED | — |
| doc/system/API.md | NOT STARTED | — |
| doc/system/Data Model.md | NOT STARTED | — |
| doc/Roadmap.md | NOT STARTED | — |
-->
