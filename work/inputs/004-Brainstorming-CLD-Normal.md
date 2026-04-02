## Updated Proposal: Jira + Confluence alongside ServiceNow ITIL

### Revised Mental Model

The SNOW Release process is the **authoritative delivery pipeline** for anything touching production. Jira and Confluence operate *upstream* of it — feeding it, not competing with it.

```
Confluence          Jira                    ServiceNow
─────────────       ──────────────────      ──────────────────────
Architecture   →    Initiative/Task    →    Release → CHG
Documentation       (decision work,         (approval gates,
                    improvement backlog,     design doc review,
                    pre-CR elaboration)      post-impl review)
```

The SNOW Release process already has the gates you need for controlled delivery. Don't replicate them in Jira. Jira's job is to get work to the point where a Release record can be raised with confidence.

---

### Jira Projects (Revised)

#### `ARCH` — Architecture & Design

Kanban. Covers everything from exploratory thinking to an artefact ready for SNOW design doc review.

**Workflow:**

```
Backlog → In Progress → In Review → Approved → Release Raised → Done
```

- `In Review` — internal architecture peer review
- `Approved` — architecture sign-off; Confluence page updated
- `Release Raised` — SNOW Release record exists; link added to Jira task
- `Done` — post-implementation review complete in SNOW; Confluence updated to reflect actual state

**Custom Fields:**

| Field | Type | Purpose |
|---|---|---|
| `Architecture Domain` | Select | Application / Data / Integration / Infrastructure / Security |
| `Artefact Type` | Select | ADR / Diagram / Standard / Runbook / Policy |
| `SNOW Release` | URL | Deep link to SNOW Release record |
| `SNOW CHG` | URL | Deep link to CHG once spawned |
| `Confluence Page` | URL | Canonical doc for this work item |
| `Review Status` | Select | Draft / Approved / Superseded |

---

#### `PROC` — Process Improvement

Kanban. Covers process analysis, redesign, and automation initiatives. Some will result in a SNOW Release; many won't (e.g. improving a Confluence template, rewriting a runbook, changing a team practice).

**Workflow:**

```
Backlog → In Progress → In Review → Approved → [Release Raised →] Done
```

The `Release Raised` step is optional here — only relevant when the process change requires a production deployment.

**Custom Fields:** subset of ARCH — drop `Architecture Domain`, keep `SNOW Release`, `SNOW CHG`, `Confluence Page`.

---

#### `INIT` — Strategic Initiatives *(optional, add when needed)*

For cross-cutting programmes (e.g. JDE→Azure migration) that spawn multiple `ARCH` and `PROC` tasks and need their own stakeholder/budget tracking. Epics here act as containers; actual work lives in `ARCH` and `PROC` and is linked up.

---

### Confluence Structure (Revised)

#### Space Layout

```
Enterprise Architecture (EA)
  ├── Principles & Standards
  ├── Architecture Decisions (ADR Index)
  │     └── ADR-NNN: [title]
  ├── Domain Architecture
  │     ├── Application
  │     ├── Data
  │     ├── Integration
  │     └── Infrastructure
  ├── Current State (As-Is)
  ├── Target State (To-Be)
  └── Transition Roadmap

Process & Improvement (PROC)
  ├── Process Inventory
  ├── Process Maps (by domain)
  └── Improvement Register

Project Working Spaces (per initiative)
  ├── [Initiative Name]
  │     ├── Brief & Scope
  │     ├── Design Documents          ← feeds SNOW design doc review gate
  │     ├── Decision Log
  │     ├── Meeting Notes
  │     └── Post-Implementation Review ← populated after SNOW post-impl review
```

---

### The SNOW Integration Points

This is where the seams need to be explicit and disciplined, given no API.

#### Upstream (Jira/Confluence → SNOW)

| Trigger | Action |
|---|---|
| Jira task reaches `Approved` | Raise SNOW Release record; paste URL into Jira `SNOW Release` field |
| SNOW Release design doc review gate | Link to Confluence design document page — this *is* the design doc |
| CHG spawned by Release | Paste CHG URL into Jira `SNOW CHG` field |

#### Downstream (SNOW → Confluence)

| Trigger | Action |
|---|---|
| SNOW post-implementation review complete | Update Confluence page to reflect actual delivered state; update ADR status if applicable |
| SNOW Release closed | Set Jira task to `Done`; confirm Confluence page status is `Approved` or `Superseded` |

#### The Critical Discipline Point

The design document that SNOW's Release process reviews **must live in Confluence**, not as a SNOW attachment or email. This gives you version history, linkability, and it keeps the canonical record in the right place. The SNOW Release record holds a link to it, not a copy.

---

### Workflow Summary — End to End

```
1. ARCH/PROC backlog item identified
2. Jira task created; Confluence page stub created and linked
3. Work elaborated in Confluence; reviewed in Jira (In Review)
4. Architecture sign-off → Jira: Approved
5. SNOW Release record raised → Jira: Release Raised; URL fields populated
6. SNOW design doc review gate → reviewer opens Confluence link
7. SNOW spawns CHG → change manager tracks to production
8. Post-implementation → SNOW review complete; Confluence updated; Jira: Done
```

---

### What This Buys You

- **No duplication of approval workflow** — SNOW owns that; Jira owns the pre-work
- **Confluence as single doc source** — SNOW and Jira both point to it; nothing lives in email or attachments
- **Traceability without automation** — every Jira task can be traced to a SNOW record and a Confluence page manually, consistently
- **ITIL-compatible framing** — Jira covers Service Design and Continual Improvement; SNOW covers Transition and Operation; Confluence spans all phases as the knowledge layer