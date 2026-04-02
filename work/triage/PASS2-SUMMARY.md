# Pass 2 Summary — Cross-Input Screening

Date: 03.04.2026
Files reviewed: 11 (001–011)
Status: AWAITING REVIEW

> **AI-generated summary.** All suggestions are recommendations; all decisions
> remain with the human reviewer.

---

## 1. Converged Items (High Confidence — 3+ Independent Sources)

These items have strong cross-source agreement and are unlikely to require
contested resolution. Recommended for fast confirmation.

### OC-001 — Stable Initiative Identity (INI-NNNN)

- **Members:** 002#2, 002#31, 008#19, 008#34, 009#22, 010#12
- **Highest weight:** formal-design (002, 008, 009)
- **Suggested canonical:** 002#2 — "assigns a persistent initiative identity at inception"
- **Confidence:** High. Three formal-design sources independently confirm tool-assigned INI-NNNN as the primary cross-system identifier.

### OC-002 — Confluence as Canonical Source of Truth

- **Members:** 002#6, 002#32, 004#32, 004#33, 004#36, 006#1, 006#48
- **Highest weight:** formal-design (002)
- **Suggested canonical:** 002#6 — "Confluence anchor page is the persistent root of the initiative"
- **Confidence:** High. Formal-design source plus two independent brainstorm sources converge.

### OC-003 — Jira Project Isolation (Labels + Custom Fields + Back-References)

- **Members:** 002#11, 008#20, 009#23, 009#27, 009#28
- **Highest weight:** formal-design (008, 009)
- **Suggested canonical:** 009#23 — label `ini-managed` as safety belt; 009#22 — `customfield_10422` as INI ID field
- **Confidence:** High. Two formal-design sources document proven three-layer isolation strategy.

### OC-004 — Design-Time (Jira+Confluence) vs Run-Time (ServiceNow) Split

- **Members:** 004#1, 004#4, 006#27, 006#31, 006#35, 006#46
- **Highest weight:** brainstorm (004, 006)
- **Suggested canonical:** 006#46 — "You're separating design-time system (Jira + Confluence) from run-time system (ServiceNow)"
- **Confidence:** High. Consistent framing across multiple brainstorm sources; no contradicting formal-design source.

### OC-005 — No Direct Jira ↔ ServiceNow Integration

- **Members:** 002#27, 004#26, 006#34, 009#31
- **Highest weight:** formal-design (002, 009)
- **Suggested canonical:** 002#27 — "No direct integration. The tool index holds the mapping."
- **Confidence:** High. Formal-design plus brainstorm sources; reinforced by hard constraint (no SNOW API access).

### OC-007 — Three Operational Work Modes

- **Members:** 003#3, 004#3, 005#1, 006#2
- **Highest weight:** brainstorm (all four)
- **Suggested canonical:** 006#2 — "running a change system across three axes: Software delivery, Process improvement, Architecture evolution"
- **Confidence:** High. Four independent brainstorm sources agree.

### OC-008 — Initiative → Epic → Work Items Hierarchy

- **Members:** 005#5, 005#6, 005#7, 008#32, 009#22
- **Highest weight:** formal-design (008)
- **Suggested canonical:** 008#32 — "Initiative→Epic, Phase→Story, Staging item→Sub-task"
- **Confidence:** High. Note: 008#34 states "One Epic per INI" which may conflict with 005's multi-Epic model — see XC-003 below.

### OC-009 — Bidirectional Cross-System Linking (Jira ↔ Confluence)

- **Members:** 003#17, 003#18, 004#9, 004#14, 005#34, 005#35, 006#9, 006#25, 006#41
- **Highest weight:** brainstorm (consistent across 003, 004, 005, 006)
- **Suggested canonical:** 005#34 — "Initiative must link to: one Confluence hub page, at least one Epic"
- **Confidence:** High. Pervasive agreement; largest cluster.

### OC-010 — Template-Driven Page Structure

- **Members:** 002#16, 003#14, 005#40, 006#24, 007#7
- **Highest weight:** formal-design (002)
- **Suggested canonical:** 005#40 — "Standard page tree per initiative (12-page structure)"
- **Confidence:** High. Formal-design + four brainstorm sources.

### OC-011 — ServiceNow Read-Only / Manual Ingest (No API)

- **Members:** 004#26, 008#13, 009#31, 009#32, 009#33
- **Highest weight:** formal-design (008, 009)
- **Suggested canonical:** 009#31 — "No API access is available … any integration must work without it"
- **Confidence:** High. Hard operational constraint confirmed by formal testing.

### OC-013 — Domain-Based Spaces Over Initiative-Based

- **Members:** 003#12, 005#38, 005#39, 006#29
- **Highest weight:** brainstorm (003, 005, 006)
- **Suggested canonical:** 003#12 — "Avoid initiative-based spaces … Use domain-based spaces that outlive projects"
- **Confidence:** High. Three independent brainstorm sources.

### OC-015 — Cross-System Definition of Done

- **Members:** 003#19, 003#21, 003#22, 005#57, 006#37, 006#45
- **Highest weight:** brainstorm (003, 005, 006)
- **Suggested canonical:** 005#57 — "Done: implementation complete, documentation updated, decisions finalised, operational impact captured"
- **Confidence:** High.

### OC-016 — ADR as Mandatory Architecture Decision Artefact

- **Members:** 003#8, 005#14, 005#48, 006#10
- **Highest weight:** brainstorm (005, 006)
- **Suggested canonical:** 005#48 — full ADR template sections
- **Confidence:** High.

### OC-017 — Initiative Lifecycle States

- **Members:** 005#20, 008#25, 008#26, 008#27
- **Highest weight:** formal-design (008)
- **Suggested canonical:** 008#25 — "Five statuses: Draft, Scoping, Active, Blocked, Done" with full gate criteria (008#26)
- **Confidence:** High. Note: 005#20 proposes a different state set (Proposed, Qualified, Approved, In Progress, At Risk, Done, Stopped) — see XC-004 below.

### OC-019 — MCP Server as Unified Agent Interface

- **Members:** 002#3, 002#10, 010#1, 010#26
- **Highest weight:** formal-design (002)
- **Suggested canonical:** 010#1 — "All agent-facing operations should be abstracted through a single MCP server"
- **Confidence:** High.

---

## 2. Overlap Clusters (Require Review — 2 Sources or Ambiguous)

### OC-006 — SQLite as Ephemeral Cache

- **Members:** 002#7, 002#32, 010#9
- **Highest weight:** formal-design (002)
- **Note:** 002#7 and #32 are same source / different sections — collapse to one inventory item. 010#9 assigns gap detection logic to SQLite layer.
- **Action:** Confirm SQLite owns both cache and gap detection. Single inventory item.

### OC-012 — Confluence Page Properties Field Schema

- **Members:** 002#17, 003#15, 005#22
- **Highest weight:** formal-design (002)
- **Note:** Field lists vary across sources. 002 lists ini-id/status/domain/title/jira-epic/snow-project-id/last-sync; 003 lists Status/Owner/Domain/Last reviewed/Next review/JIRA Epic; 005 specifies 11 mandatory Initiative fields.
- **Action:** Consolidate field sets. Decide canonical schema for inventory.

### OC-014 — Separate Jira Boards by Work Mode

- **Members:** 003#10, 005#58, 005#59, 005#60, 006#27
- **Highest weight:** brainstorm
- **Action:** Confirm board structure (Delivery / Architecture+Improvement / Portfolio).

### OC-018 — Stale Context as System Risk

- **Members:** 008#7, 010#2
- **Highest weight:** formal-design (008)
- **Note:** 008 states "Stale bootstrap information is worse than none." Strong principle — should be formalised as an architectural guiding principle.
- **Action:** Formalise as guiding principle in Architecture.md.

### OC-020 — Scaffolding Tools Return `{ file, instructions }`

- **Members:** 010#20, 010#21, 010#30
- **Highest weight:** brainstorm (010)
- **Note:** Single source. Strong pattern but unconfirmed by other sources.
- **Action:** Confirm as API convention.

### OC-021 — Thin HTTP Client Wrapper (No Third-Party Atlassian Libraries)

- **Members:** 011#6, 011#12, 011#13
- **Highest weight:** brainstorm (011)
- **Note:** Single source with explicit rationale. 009#3 documents existing centralised client pattern.
- **Action:** Confirm library rejection; formalise as ADR.

---

## 3. Cross-File Contradictions

### XC-001 — RLSE → CHG Cardinality (1:1 vs 1..n)

- **Side A:** 001#6 — "RLSE links to one or more CHG records" (1..n structural capability)
- **Side B:** 001#26 — "typically 1:1 per release" (~1:1 design intent)
- **Severity:** Medium. Within-file (001) — already flagged as E1.
- **Recommendation:** Clarify whether 1:1 is a design constraint or 1..n is the structural reality. Affects Data Model cardinality definition.

### XC-002 — Jira Issue Types: Stories/Tasks In or Out?

- **Side A:** 006#5 — includes Story/Task in Jira issue types
- **Side B:** 006#30 — "No Stories. No Tasks. Those belong in ServiceNow."
- **Severity:** High, but explicitly resolved within source. #30 supersedes #5.
- **Recommendation:** Treat 006#30 as authoritative. Align 005#8 (which lists Story/Task) with the revised position. Confirm: are Stories/Tasks fully eliminated from Jira or retained for specific work modes?

### XC-003 — Epic-per-Initiative Cardinality (One vs Many)

- **Side A:** 008#34 — "One Epic per INI. Phase grouping is handled by Stories."
- **Side B:** 005#5 — "Four-level hierarchy: Initiative / Epic / Delivery work items / Sub-task" (implies multiple Epics per Initiative)
- **Severity:** High. Different sources, different models.
- **Recommendation:** This affects the entire Jira hierarchy model. 008 is formal-design with confirmed implementation; 005 is brainstorm. Suggest 008 as canonical unless the multi-Epic model is explicitly preferred.

### XC-004 — Initiative Lifecycle State Names

- **Side A:** 008#25 — "Draft, Scoping, Active, Blocked, Done" (5 states, gate-locked)
- **Side B:** 005#20 — "Proposed, Qualified, Approved, In Progress, At Risk, Done, Stopped" (7 states)
- **Severity:** Medium. Different granularity. 008 is formal-design with gate criteria; 005 is brainstorm.
- **Recommendation:** Reconcile. 008 has full transition gate logic — likely canonical. 005's extra states (Proposed, At Risk, Stopped) may map to 008's states or represent additional governance needs.

### XC-005 — EA Section Structure (Variant 1 vs Variant 2)

- **Side A:** 007#3 — Variant 1 (Principles & Standards / ADR Index / Domain Architecture / Current State / Target State / Transition Roadmap)
- **Side B:** 007#4 — Variant 2 (Integration Architecture / Data & Analytics / Security / Platform / Decisions)
- **Severity:** Medium. Within-file (007); explicitly unresolved. Also noted in 002#46.
- **Recommendation:** This is an organisational decision, not a system design decision. Per 002#46, it does not affect tool design. Resolve for Confluence IA but do not block assistant development.

### XC-006 — PROC Section In Scope?

- **Side A:** 004#16, 004#17 — PROC project and workflow designed in detail
- **Side B:** 007#14 — PROC marked with `(?)`, uncertain inclusion
- **Severity:** Low. Organisational scope question.
- **Recommendation:** Decide whether process improvement work is in the assistant's scope. If yes, 004's design applies. If no, mark as future scope.

---

## 4. Uncovered Gaps (Genuine Gaps — No Source Addresses)

These require new input or decisions before drafting can proceed.

### Critical (Block Spec.md or Architecture.md Drafting)

| Gap | Scaffold Section | Sources Noting Gap | Impact |
|-----|------------------|--------------------|--------|
| Overview.md § Purpose | Primary user, key outcome | 001#D1, 005#D1, 006#D49 | Cannot scope the system without defining who it serves and what success looks like |
| Overview.md § Key Outcome | Measurable/falsifiable outcome | 005#D2, 006#D50 | No acceptance criteria for the system |
| Spec.md § NFRs | Latency, availability, auditability, recoverability, security | 001#D3, 003#D30, 004#D39, 005#D3, 006#D51 | Candidates exist (008#7, 010#2-4-15-19) but none formalised with IDs |
| Spec.md § Constraint IDs | CON-xxx identifiers | 002#G3, 005#D8, 010#D35 | Blocks Architecture.md constraint traceability table |
| Architecture.md § Constraint Traceability | CON-xxx → component mapping | 002#G6, 003#D35, 010#D38, 011#D21 | Upstream blocker: requires CON-xxx assignment |
| Architecture.md § NFR Traceability | NFR-xxx → mechanism mapping | 002#G7, 004#D44, 010#D39, 011#D21 | Upstream blocker: requires NFR formalisation |
| API.md § Authentication | MCP server auth model | 006#D52, 010#D40 | 002#44 specifies PAT; 011#8 raises PAT vs OAuth2 — decision needed |
| API.md § Error Format | Standard error envelope | 010#D41, 011#D17 | No source defines error response structure |
| Backend Identity Service | API surface, mapping store | 008#D41, 008#D42 | Largest structural gap: no ADR addresses centralised identity service |

### Significant (Block Specific Sections)

| Gap | Scaffold Section | Sources Noting Gap | Impact |
|-----|------------------|--------------------|--------|
| Confluence page lifecycle | Archival, deletion, status transitions | 007#D11 | Needed for Spec operations scoping |
| Confluence permissions | Access control / permissions model | 007#D12 | Organisational constraint; requires input |
| ServiceNow write direction | Record creation / stub render | 009#D42 | Explicitly deferred; decide in/out of scope |
| ServiceNow sys_id structure | URL construction from sys_id | 009#D43 | Instance-specific; requires documentation |
| Confluence promotion lifecycle | Trigger, criteria, agent role | 008#D44 | Described but not specified |
| ADR scaffold § Decider field | Required ADR fields | 008#D46 | 005#48 provides template but lacks Decider |

### Partially Covered (Scattered — Need Consolidation)

| Gap | Scaffold Section | Partial Coverage | Action |
|-----|------------------|-----------------|--------|
| Spec.md § Domains | Domain decomposition | 003#3, 005#27, 006#29 | Consolidate three-axis model + domain vocabulary |
| Spec.md § Out of Scope | Explicit exclusions | 002#20, 002#26, 004#2, 006#26, 010#32 | Gather implicit boundaries into one list |
| Architecture.md § Guiding Principles | Trade-off statements | 010#6, 010#9, 010#14, 011#6, 011#13 | Formalise as "prefer X over Y because Z" |
| Architecture.md § Components | Named component list | 008#12, 009#3, 010#9, 011#12 | Enumerate: CLI, MCP server, sync engine, SQLite cache, Jira/Confluence/SNOW adapters, backend service |
| Architecture.md § Data Flow | End-to-end data movement | 004#3, 006#33, 008#12, 009#32-36, 010#3 | Synthesise into formal data flow diagram |
| Data Model § Entity Schema | Cross-system entities | 002#17, 008#19, 009#22 | Consolidate field sets |

---

## 5. Reviewer Actions Required

### Confirm (Fast — Converged Items)

- [ ] OC-001 through OC-019: Confirm converged items proceed to Pass 3 with suggested canonical formulations

### Decide (Contradictions)

- [ ] XC-001: RLSE→CHG cardinality — 1:1 design or 1..n structural?
- [ ] XC-002: Confirm 006#30 (no Stories/Tasks in Jira) is authoritative
- [ ] XC-003: Epic-per-Initiative — one (008) or many (005)?
- [ ] XC-004: Initiative lifecycle states — reconcile 008's 5-state vs 005's 7-state model
- [ ] XC-005: EA section Variant 1 or 2 (or defer as non-blocking)?
- [ ] XC-006: PROC in scope for the assistant?

### Provide Input (Uncovered Gaps)

- [ ] Overview.md: Who is the primary user? What is the measurable outcome?
- [ ] Spec.md: Formalise NFR statements (availability, auditability, latency, recoverability)
- [ ] API.md: Auth model (PAT-only or PAT+OAuth2?) and error envelope design
- [ ] Architecture.md: Backend identity service — scope, API surface, storage mechanism
- [ ] Confluence: Page lifecycle rules and permissions model
- [ ] ServiceNow: Write direction — in scope for v1 or deferred?
