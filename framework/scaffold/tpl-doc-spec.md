# SCAFFOLD: doc/Spec.md

> **Purpose of this template:** Defines the required structure and content standard for `doc/Spec.md`.
> This is the requirements document. It translates the guiding star into operations, constraints,
> and boundaries that Architecture.md must satisfy.
>
> **Derives from:** `doc/Overview.md` (must be locked before this document begins)
>
> **Definition of done:**
> - Every operation is assigned to a domain. No orphaned operations.
> - Every constraint is sourced (system, process, or decision — not assumed).
> - Every domain has at least one operation.
> - No open questions without a resolution note or explicit deferral.
> - Out-of-scope items explicitly stated.
>
> **Skills:**
> - `/system-design` — production loop steps 1–5: scope analysis, domain decomposition,
>   operation elicitation, NFR framing, constraint sourcing. Use to drive content decisions.
> - `/documentation` — production loop step 5 (writing pass) and step 7: clarity, precision,
>   sourcing discipline. Do not let this skill override the Domains → Operations → Constraints → NFRs
>   structure defined here.

---

<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->

# Specification

## Domains

<!--
Define the operational domains before listing operations.
Domains are the primary grouping structure for this document.
A domain is a coherent area of system responsibility — not an architectural layer.

If an operation does not fit cleanly into a domain, the domain model is wrong.
Revise domains before forcing operations into ill-fitting categories.

List candidate domains here first, validate against the operation inventory, then proceed.
-->

---

## Operations

<!--
One section per domain. Each operation is a named capability the system must provide.
Format per operation:

### [Operation Name]
- **Description:** What the system does.
- **Trigger:** What initiates this operation (user action, event, schedule, etc.).
- **Input:** What data or context is required.
- **Output:** What the system produces or changes.
- **Constraints:** Operation-specific constraints (reference global constraints by ID where applicable).
- **Priority:** Must-have | Should-have | Nice-to-have
- **Notes:** Edge cases, open questions, or dependencies.

Operations must be written as system behaviours, not implementation steps.
-->

### Domain: [Name]

#### [Operation Name]

- **Description:**
- **Trigger:**
- **Input:**
- **Output:**
- **Constraints:**
- **Priority:**
- **Notes:**

---

## Constraints

<!--
All constraints that apply across multiple operations or the system as a whole.
Assign each a short ID for cross-referencing (e.g. CON-001).

Every constraint must be sourced. An unsourced constraint is an assumption — label it as such
with <!-- ASSUMPTION --> and flag for verification.

Categories:
- System constraints: imposed by existing infrastructure, tools, or integrations
- Process constraints: imposed by existing workflows or organisational rules
- Regulatory / compliance constraints
- Performance / scale constraints
-->

| ID | Constraint | Category | Source |
|---|---|---|---|
| CON-001 | | | |

---

## Non-Functional Requirements

<!--
Qualities the system must exhibit, independent of specific operations.
These constrain Architecture choices.

Examples: availability, latency, auditability, recoverability, security posture.
Each NFR should be a testable statement where possible.
-->

| ID | Requirement | Rationale |
|---|---|---|
| NFR-001 | | |

---

## Out of Scope

<!--
Capabilities explicitly excluded. Reference Overview.md out-of-scope items and
add any that emerged during operation definition.
Be specific: not "reporting" but "real-time dashboards for end users".
-->

---

## Open Questions

<!--
Unresolved items that could affect the spec. Each must have an owner and a target resolution date
or an explicit deferral note.

| # | Question | Owner | Target | Status |
|---|---|---|---|---|
| OQ-001 | | | | OPEN |
-->
