# SCAFFOLD: doc/Architecture.md

> **Purpose of this template:** Defines the required structure and content standard for `doc/Architecture.md`.
> This document translates the Spec into a technical structure. It records component boundaries,
> integration points, and the reasoning behind key structural decisions.
>
> **Derives from:** `doc/Spec.md` (must be locked before this document begins)
>
> **Definition of done:**
> - Every Spec domain maps to one or more components. No unmapped domains.
> - Every constraint from Spec.md (CON-xxx) is addressed — either satisfied, mitigated, or escalated.
> - Every NFR from Spec.md (NFR-xxx) is addressed in the NFR Traceability table.
> - Every significant structural choice references an ADR.
> - Data flow covers all operation triggers defined in Spec.md.
> - No implementation detail (libraries, specific syntax) — that belongs in system/*.
>
> **Skills:** `/system-design` for drafting; `/tech-debt` for adversarial critique

---

<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->

# Architecture

## Guiding Principles

<!--
2–5 principles that constrain architectural decisions throughout this document.
Each principle should be a trade-off statement: "We prefer X over Y because Z."
Avoid generic principles (e.g. "keep it simple") unless you define what simple means here.

These are the architectural equivalent of the guiding star — test every decision against them.
-->

---

## Component Overview

<!--
A named list of the top-level components in the system.
Do not describe them here — descriptions follow below.
This section provides a quick map.

Optionally include an ASCII or Mermaid diagram if the relationships benefit from visualisation.

```
[Component A] ──→ [Component B]
      ↓
[Component C]
```
-->

---

## Components

<!--
One section per component.

### [Component Name]
- **Responsibility:** What this component owns. One sentence.
- **Interfaces:** What it exposes to other components (inputs it accepts, outputs it produces).
- **Dependencies:** Other components or external systems it depends on.
- **Constraints satisfied:** Reference Spec.md constraint IDs (CON-xxx) this component addresses.
- **Key decisions:** Reference relevant ADRs (decisions/NNN-*.md).
- **Notes:** Deferreds, known limitations, or open design questions.
-->

### [Component Name]

- **Responsibility:**
- **Interfaces:**
- **Dependencies:**
- **Constraints satisfied:**
- **Key decisions:**
- **Notes:**

---

## Data Flow

<!--
Describe how data moves through the system for each major operation class.
Group by Spec.md domain if that aids clarity.

For each flow:
- Name the trigger (from Spec.md)
- Trace the path through components
- Identify where state is written or read
- Note any transformation steps

Keep this at the data-movement level, not the implementation level.
-->

---

## Integration Points

<!--
External systems this architecture connects to.
For each integration:

| System | Direction | Protocol / Method | Auth | Constraints | ADR |
|---|---|---|---|---|---|
| [System name] | Inbound / Outbound / Both | | | | |
-->

---

## Constraint Traceability

<!--
Verify every CON-xxx from Spec.md is addressed.
This table must be complete before the document can be locked.

| Constraint ID | How addressed | Component(s) | Notes |
|---|---|---|---|
| CON-001 | | | |
-->

---

## NFR Traceability

<!--
Verify every NFR-xxx from Spec.md is addressed at the architectural level.
For each NFR, describe which component(s) and structural decision(s) satisfy it.
This table must be complete before the document can be locked.

NFRs often impose cross-cutting structural choices (e.g. replication strategy for
availability, request routing for latency). If an NFR cannot be satisfied at the
architecture level, escalate it as an open question.

| NFR ID | How addressed | Component(s) | Notes |
|---|---|---|---|
| NFR-001 | | | |
-->

---

## Key Decisions

<!--
Summary of significant architectural decisions made in this document.
Each must have a corresponding ADR in decisions/.

| Decision | ADR | Status |
|---|---|---|
| [Decision summary] | decisions/NNN-*.md | LOCKED |
-->

---

## Open Questions

<!--
| # | Question | Owner | Target | Status |
|---|---|---|---|---|
| OQ-001 | | | | OPEN |
-->
