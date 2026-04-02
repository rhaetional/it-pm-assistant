# Triage — 001-Inferred-ServiceNow-Structure

Source: `work/inputs/001-Inferred-ServiceNow-Structure.md`
Source type: inferred
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

---

| #  | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|----|-----------------------------------|----------------|---------------|-------|-------------------|
| 1  | Process model: PRJ → RLSE → CHG with distinct control scopes | A | [CONSTRAINT] | Maps to Spec.md (system constraints) and Architecture.md (integration points) — primary home is Spec; confirmed single target | |
| 2  | Lifecycle crosswalk table: PRJ phases Pipeline→Closed | A | [REQUIREMENT] | Feeds Spec.md domain/operations (initiative lifecycle must be tracked) | |
| 3  | Lifecycle crosswalk table: RLSE stages Draft→Cancelled | A | [REQUIREMENT] | Feeds Spec.md domain/operations (release lifecycle must be tracked) | |
| 4  | Lifecycle crosswalk table: CHG stages New→Closed | A | [REQUIREMENT] | Feeds Spec.md domain/operations (change lifecycle must be tracked) | |
| 5  | Relationship model: PRJ owns initiative, can parent RLSE | A | [CONSTRAINT] | ServiceNow structural constraint — Architecture.md integration points | |
| 6  | Relationship model: RLSE links to one or more CHG records | A | [CONSTRAINT] | ServiceNow structural constraint — Architecture.md integration points | |
| 7  | Evidence: RLSE "Source of Release = Project", Parent = PRJ02755 | A | [CONSTRAINT] | Low confidence — inferred from screenshot sample, not documentation; Architecture.md integration | |
| 8  | Evidence: RLSE has related list "Change Requests (1)" | A | [CONSTRAINT] | Low confidence — single sample; supports item 6 | |
| 9  | RACI matrix: work intake / demand capture owned by PRJ | A | [REQUIREMENT] | Spec.md operations — initiative domain | |
| 10 | RACI matrix: portfolio alignment / prioritisation owned by PRJ | A | [REQUIREMENT] | Spec.md operations — initiative domain | |
| 11 | RACI matrix: scoping release contents owned by RLSE | A | [REQUIREMENT] | Spec.md operations — delivery domain | |
| 12 | RACI matrix: delivery task orchestration owned by RLSE | A | [REQUIREMENT] | Spec.md operations — delivery domain | |
| 13 | RACI matrix: formal authorisation for implementation owned by CHG | A | [REQUIREMENT] | Spec.md operations — change control domain | |
| 14 | RACI matrix: conflict detection / calendar control owned by CHG | A | [REQUIREMENT] | Spec.md operations — change control domain | |
| 15 | RACI matrix: post-implementation review owned by CHG | A | [REQUIREMENT] | Spec.md operations — change control domain | |
| 16 | Entry/exit criteria tables for PRJ, RLSE, CHG | B | [REQUIREMENT] | Spec.md (operations/constraints) and Architecture.md (data flow triggers); assistant must understand gates to track state transitions | |
| 17 | Gate model: PRJ carries initiative-level gates (intake, initiation, implementation, closure) | B | [REQUIREMENT] | Spec.md operations + Architecture.md data flow; gate transitions are operation triggers | |
| 18 | Gate model: RLSE carries delivery gates (scoping, approval, testing, deployment, closure) | B | [REQUIREMENT] | Same as #17 | |
| 19 | Gate model: CHG carries operational governance gates (assessment, authorisation, scheduling, conflict, PIR) | B | [REQUIREMENT] | Same as #17 | |
| 20 | Hand-off model: PRJ→RLSE, RLSE→CHG, CHG→RLSE, RLSE→PRJ (bidirectional feedback) | B | [MECHANISM] | Architecture.md (data flow / integration) and Spec.md (cross-domain operations); assistant must reflect these hand-offs in its context model | |
| 21 | State correspondence table: PRJ/RLSE/CHG semantic near-equivalents | B | [MECHANISM] | Architecture.md (data flow) and Data Model (cross-system state mapping); low confidence — explicitly noted as non-exact | |
| 22 | "These are parallel control planes, not one shared state machine" | A | [CONSTRAINT] | Critical architectural constraint — Architecture.md guiding principles; prevents collapsing state across systems | |
| 23 | Architectural reading: three separated concerns (work governance, delivery governance, operational risk governance) | B | [DECISION] | Overview.md (scope) and Architecture.md (guiding principles); this is the foundational design choice of the source system | |
| 24 | Cardinality: PRJ → RLSE is 0..n | A | [CONSTRAINT] | Architecture.md integration points / Data Model | |
| 25 | Cardinality: RLSE → Release Tasks is 1..n | A | [CONSTRAINT] | Architecture.md / Data Model | |
| 26 | Cardinality: RLSE → CHG is typically 1:1 per release | A | [CONSTRAINT] | Low confidence — "typically" qualifier; Architecture.md / Data Model; conflicts with item 6 (see #E1) | |
| 27 | Practical process summary: need arises → INC/PRJ → project → releases → change requests | A | [MECHANISM] | Spec.md (operations: intake flow); describes end-to-end flow the assistant must navigate | |
| 28 | "Recommended phrasing for internal documentation" block | C | — | Prose artefact for human comms, not system design content; no target in document map | |
| 29 | "I can also turn this into a one-page swimlane diagram or a decision table" | C | — | Noise — meta-comment from the source author, not a design claim | |
| D1 | — | D | — | Overview.md § Purpose: no content in this source addressing what the *assistant* is, who its primary user is, or the key outcome it must deliver. This source describes ServiceNow only. | |
| D2 | — | D | — | Overview.md § Key Constraints: no organisational, regulatory, or access constraints mentioned | |
| D3 | — | D | — | Spec.md § Non-Functional Requirements: no latency, availability, auditability, or security claims | |
| D4 | — | D | — | Spec.md § Out of Scope: no explicit exclusions stated | |

---

## Contradiction Notes

**E1 — items #6 vs #26**
- Item #6 (Relationship model): "RLSE links to one or more CHG records" → implies 1..n
- Item #26 (Cardinality): "One release has typically one related change request" → implies ~1:1
- Both from the same source. The 1:1 reading is qualified with "typically"; the 1..n reading comes from the structural model. Not necessarily irreconcilable — may reflect a design intent (1:1) vs. a structural possibility (1..n) — but requires confirmation before the Data Model can be written.

---

## Reviewer Actions Required

- [ ] Confirm items #7 and #8 (screenshot-inferred evidence) are representative, not edge cases
- [ ] Resolve E1: is RLSE→CHG cardinality 1:1 by design or 1..n?
- [ ] Confirm item #21 (state correspondence) is sufficient for cross-system status mapping or whether a fuller mapping is needed
- [ ] Items #28 and #29 excluded from inventory — confirm
- [ ] D1–D4 gaps acknowledged: this source covers ServiceNow structure only; other inputs expected to address Overview and NFR sections
