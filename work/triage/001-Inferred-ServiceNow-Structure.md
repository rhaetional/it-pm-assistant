# Triage — 001-Inferred-ServiceNow-Structure

Source: `work/inputs/001-Inferred-ServiceNow-Structure.md`
Source type: inferred
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Pass 2 completed: 03.04.2026
Status: PASS 2 COMPLETE

---

| #  | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|----|-----------------------------------|----------------|---------------|-------|-------------------|
| 1  | Process model: PRJ → RLSE → CHG with distinct control scopes | A | [CONSTRAINT] | Maps to Spec.md (system constraints) and Architecture.md (integration points) — primary home is Spec; confirmed single target | converged: 004#1, 004#3, 006#28, 006#31 — highest weight: inferred (001) + brainstorm (004, 006); all sources agree ServiceNow owns a distinct PRJ/RLSE/CHG control model |
| 2  | Lifecycle crosswalk table: PRJ phases Pipeline→Closed | A | [REQUIREMENT] | Feeds Spec.md domain/operations (initiative lifecycle must be tracked) | overlap: 008#25 — highest weight: formal-design (008); 008 defines initiative lifecycle as Draft→Scoping→Active→Blocked→Done (assistant-level states, not ServiceNow states) |
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
| 15 | RACI matrix: post-implementation review owned by CHG | A | [REQUIREMENT] | Spec.md operations — change control domain | overlap: 004#25, 004#30 — highest weight: brainstorm (004); 004 requires PIR in Confluence and Jira closure |
| 16 | Entry/exit criteria tables for PRJ, RLSE, CHG | B | [REQUIREMENT] | Spec.md (operations/constraints) and Architecture.md (data flow triggers); assistant must understand gates to track state transitions | overlap: 008#26 — highest weight: formal-design (008); 008 defines gate criteria for initiative statuses |
| 17 | Gate model: PRJ carries initiative-level gates (intake, initiation, implementation, closure) | B | [REQUIREMENT] | Spec.md operations + Architecture.md data flow; gate transitions are operation triggers | converged: 005#62, 005#63, 005#64, 008#26 — highest weight: formal-design (008); multiple sources define initiative-level gates |
| 18 | Gate model: RLSE carries delivery gates (scoping, approval, testing, deployment, closure) | B | [REQUIREMENT] | Same as #17 | |
| 19 | Gate model: CHG carries operational governance gates (assessment, authorisation, scheduling, conflict, PIR) | B | [REQUIREMENT] | Same as #17 | |
| 20 | Hand-off model: PRJ→RLSE, RLSE→CHG, CHG→RLSE, RLSE→PRJ (bidirectional feedback) | B | [MECHANISM] | Architecture.md (data flow / integration) and Spec.md (cross-domain operations); assistant must reflect these hand-offs in its context model | overlap: 004#27, 004#29, 006#36 — highest weight: brainstorm (004, 006); 004 describes manual upstream/downstream SNOW integration steps |
| 21 | State correspondence table: PRJ/RLSE/CHG semantic near-equivalents | B | [MECHANISM] | Architecture.md (data flow) and Data Model (cross-system state mapping); low confidence — explicitly noted as non-exact | |
| 22 | "These are parallel control planes, not one shared state machine" | A | [CONSTRAINT] | Critical architectural constraint — Architecture.md guiding principles; prevents collapsing state across systems | converged: 004#4, 006#44, 006#46 — highest weight: brainstorm (004, 006); 004 states "Don't replicate SNOW gates in Jira"; 006 formalises design-time vs run-time split |
| 23 | Architectural reading: three separated concerns (work governance, delivery governance, operational risk governance) | B | [DECISION] | Overview.md (scope) and Architecture.md (guiding principles); this is the foundational design choice of the source system | converged: 003#3, 004#3, 006#2 — highest weight: brainstorm (003, 004, 006); multiple sources name three operational axes |
| 24 | Cardinality: PRJ → RLSE is 0..n | A | [CONSTRAINT] | Architecture.md integration points / Data Model | |
| 25 | Cardinality: RLSE → Release Tasks is 1..n | A | [CONSTRAINT] | Architecture.md / Data Model | |
| 26 | Cardinality: RLSE → CHG is typically 1:1 per release | A | [CONSTRAINT] | Low confidence — "typically" qualifier; Architecture.md / Data Model; conflicts with item 6 (see #E1) | |
| 27 | Practical process summary: need arises → INC/PRJ → project → releases → change requests | A | [MECHANISM] | Spec.md (operations: intake flow); describes end-to-end flow the assistant must navigate | overlap: 004#34 — highest weight: brainstorm (004); 004 describes 8-step end-to-end flow |
| 28 | "Recommended phrasing for internal documentation" block | C | — | Prose artefact for human comms, not system design content; no target in document map | |
| 29 | "I can also turn this into a one-page swimlane diagram or a decision table" | C | — | Noise — meta-comment from the source author, not a design claim | |
| D1 | — | D | — | Overview.md § Purpose: no content in this source addressing what the *assistant* is, who its primary user is, or the key outcome it must deliver. This source describes ServiceNow only. | UNCOVERED — no source provides an explicit assistant purpose or primary user statement |
| D2 | — | D | — | Overview.md § Key Constraints: no organisational, regulatory, or access constraints mentioned | partially covered by 007#1 (single Confluence space); organisational/regulatory constraints remain uncovered |
| D3 | — | D | — | Spec.md § Non-Functional Requirements: no latency, availability, auditability, or security claims | partially covered by 008#7, 010#2, 010#4, 010#15, 010#19 (NFR candidates but not formalised) |
| D4 | — | D | — | Spec.md § Out of Scope: no explicit exclusions stated | partially covered by 002#20, 002#26, 002#38, 004#2, 004#4, 006#26, 010#32 (implicit boundaries scattered) |

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
