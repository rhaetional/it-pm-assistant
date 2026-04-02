# Triage — 002-DESIGN-jira-confluence-snow-integration

Source: `work/inputs/002-DESIGN-jira-confluence-snow-integration.md`
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

---

## Classification Table

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | Problem Statement — "no authoritative source of truth for which Confluence documentation, Jira epic, and SNOW project belong to the same initiative" | A | `[REQUIREMENT]` | Feeds Spec > Operations (cross-system identity resolution) | |
| 2 | Problem Statement — "assigns a persistent initiative identity at inception" | A | `[REQUIREMENT]` | Core requirement; also feeds Architecture component definition | |
| 3 | Problem Statement — "providing both human (CLI) and AI (MCP) interfaces" | A | `[REQUIREMENT]` | Two distinct interface channels; Spec > Operations | |
| 4 | Design Concept — "thin integration layer that treats Confluence, Jira, and ServiceNow as distributed storage rather than replicating their data" | A | `[DECISION]` | Architectural principle; strong ADR candidate | |
| 5 | Design Concept — "initiative begins as an idea captured on a Confluence page; tool assigns stable identifier (INI-NNNN)" | A | `[MECHANISM]` | Inception flow; Architecture > Data Flow | |
| 6 | Design Concept — "Confluence anchor page is the persistent root of the initiative — it exists from inception through closure and is never replaced" | A | `[DECISION]` | Key structural decision; ADR candidate | |
| 7 | Design Concept — "local SQLite index is a materialised cache of what is in Confluence, rebuilt by crawling the space … It is ephemeral: losing it does not lose data" | A | `[DECISION]` | Survivability / data-authority decision; ADR candidate | |
| 8 | Design Concept — "ServiceNow data enters the tool via periodic batch export (JSON reports)" | A | `[DECISION]` | Integration method choice; ADR candidate | |
| 9 | Design Concept — "Jira data is read and written via REST API. Confluence is both read and written via REST API." | A | `[MECHANISM]` | Integration protocols; Architecture > Integration Points | |
| 10 | Design Concept — "exposes its core functions as CLI commands and as an MCP server" | A | `[REQUIREMENT]` | Interface requirement; Spec > Operations | |
| 11 | Information Architecture — single space "IT Architecture", admin rights, clean slate | A | `[CONSTRAINT]` | System constraint (Confluence deployment scope); attributed to environment | |
| 12 | Information Architecture — top-level sections: Project Working Spaces (Active, Pipeline, Completed, Cancelled) | A | `[MECHANISM]` | Confluence IA; Architecture > Components | |
| 13 | Information Architecture — "Enterprise Architecture (EA) — Variant TBD — see Open Questions" | A | `[OPEN]` | Unresolved structure; does not affect tool design per §Constraints | |
| 14 | Information Architecture — "Process & Improvement (PROC) — provisional, not finalised" | A | `[OPEN]` | Provisional section; low impact on tool design | |
| 15 | Information Architecture — "Initiative anchor page lives in exactly one status folder at any time … canonical record for the initiative" | A | `[REQUIREMENT]` | Structural invariant; must be enforced by tool | |
| 16 | Information Architecture — "Child page structure … titles configurable via external template file, not hardcoded" | A | `[REQUIREMENT]` | Configuration requirement; Spec > Operations (scaffold) | |
| 17 | Information Architecture — Page Properties fields table (ini-id, status, domain, title, jira-epic, snow-project-id, last-sync) | B | `[MECHANISM]` | Data model detail (also feeds `tpl-doc-system-datamodel.md`); primary home Architecture/Spec | |
| 18 | Information Architecture — Status → folder mapping table | A | `[MECHANISM]` | Business rule; Architecture > Data Flow or Spec > Operations | |
| 19 | Information Architecture — "Domain vocabulary must match EA domain taxonomy … defined as controlled vocabulary in scaffold template config" | A | `[CONSTRAINT]` | Domain list not yet defined; partially open; `[OPEN]` also warranted | |
| 20 | Information Architecture — "Architecture documents that graduate … moved to EA section manually and exit the tool's concern" | A | `[DECISION]` | Explicit out-of-scope boundary; Spec > Out of Scope | |
| 21 | Integration Points > Confluence — "scaffold command (create); sync command (update); housekeep command (move)" | A | `[REQUIREMENT]` | Three named operations; Spec > Operations | |
| 22 | Integration Points > Confluence — "Tool never overwrites prose sections" | A | `[CONSTRAINT]` | Data-authority constraint; process constraint | |
| 23 | Integration Points > Confluence — "Confluence Storage XML for read/write; Page Properties macro for structured fields" | A | `[DECISION]` | Format choice; ADR candidate (noted explicitly in Key Design Decisions) | |
| 24 | Integration Points > Jira — "epic summary, status, optionally linked issues — stored in SQLite index, not written back to Confluence prose" | A | `[DECISION]` | Data routing decision; Architecture > Data Flow | |
| 25 | Integration Points > Jira — "Jira owns all delivery tracking data. Confluence holds only the Jira key as a cross-reference." | A | `[CONSTRAINT]` | Data-authority boundary; process/system constraint | |
| 26 | Integration Points > SNOW → Confluence — "ITIL Linkage section tables updated on sync (projects only in initial scope; RLSE and CHG deferred)" | A | `[DECISION]` | Explicit deferral; Spec > Out of Scope | |
| 27 | Integration Points > Jira ↔ SNOW — "No direct integration. The tool index holds the mapping; neither system references the other directly." | A | `[DECISION]` | Coupling decision; ADR candidate | |
| 28 | Integration Points > SNOW ingest — "manual batch sync, initiated by operator placing export file(s) in expected location" | A | `[REQUIREMENT]` | Operator-triggered ingest operation; Spec > Operations | |
| 29 | Integration Points > SNOW ingest — "Schema mapping is configurable (YAML) per export type" | A | `[REQUIREMENT]` | Configuration requirement; Spec > Operations | |
| 30 | Integration Points > SNOW ingest — "`raw` JSON row preserved in index for future use" | A | `[DECISION]` | Forward-compatibility decision | |
| 31 | Key Design Decisions — "tool-assigned INI ID as primary key … only a tool-assigned ID can be present from inception" | A | `[DECISION]` | Primary key design; ADR candidate (rationale explicit) | |
| 32 | Key Design Decisions — "SQLite index as ephemeral cache: Source of truth is Confluence Page Properties" | A | `[DECISION]` | Duplicates #7 more precisely; combine in inventory | |
| 33 | Key Design Decisions — "Existing API tooling as adapters … not redesigned" | A | `[CONSTRAINT]` | System constraint (prior tooling reuse); reduces design scope | |
| 34 | Key Design Decisions — "Scaffold templates externalised … configuration file (YAML or Markdown), not hardcoded" | A | `[DECISION]` | Externalisation decision; rationale explicit | |
| 35 | Key Design Decisions — "housekeep command … compares PP status to current parent folder and moves mismatches" | A | `[MECHANISM]` | Folder-move mechanism; Architecture > Data Flow | |
| 36 | Key Design Decisions — "Tool housekeep command … more observable and auditable than Confluence automation" | A | `[DECISION]` | Explicit preference over Confluence automation | |
| 37 | Key Design Decisions — "MCP transport via stdio … no network port or MCP-side auth layer required" | A | `[DECISION]` | Transport decision; ADR candidate | |
| 38 | Key Design Decisions — "RLSE and CHG deferred … schema and template include placeholders" | A | `[DECISION]` | Explicit deferral; Spec > Out of Scope | |
| 39 | Constraints — "Confluence template API (`templateId`) supports body application but not variable substitution at API time … tool-owned scaffold templates in Storage XML used instead" | A | `[CONSTRAINT]` | System constraint; marked **Assumed** in source — verify | |
| 40 | Constraints — "Page Properties Report macro … filters on `status=Active` and presence of `snow-project-id`. **Unverified**: whether PP Report supports 'field is non-empty' filter condition" | A | `[OPEN]` | Verification gap; could affect index page design | |
| 41 | Constraints — "Confluence automation … may not be available depending on instance plan/licence tier" | A | `[CONSTRAINT]` | System constraint; `[OPEN]` also warranted (unverified) | |
| 42 | Constraints — "SNOW JSON export field names vary by instance. Schema mapping must be configurable." | A | `[CONSTRAINT]` | System constraint; duplicates #29 from requirements angle | |
| 43 | Constraints — "INI ID sequence counter: simplest implementation is `MAX(id) + 1` … **Assumed**: no concurrent scaffold operations" | A | `[CONSTRAINT]` | Concurrency assumption; low-confidence; label as assumption | |
| 44 | Constraints — "Jira/Confluence authentication via Personal Access Token … No OAuth2 flow in scope" | A | `[CONSTRAINT]` | Auth constraint; system + explicit out-of-scope boundary | |
| 45 | Open Questions — "What is the final child page structure for initiative working spaces?" | A | `[OPEN]` | Blocks scaffold template finalisation | |
| 46 | Open Questions — "EA space structure: Variant 1 vs Variant 2?" | A | `[OPEN]` | Noted as not affecting tool design (per §Constraints) | |
| 47 | Open Questions — "Does PROC form part of the space?" | A | `[OPEN]` | Provisional; low tool impact | |
| 48 | Open Questions — "Does the SNOW JSON export include a direct relationship between projects and problem records?" | A | `[OPEN]` | Could affect SNOW ingest schema; medium impact | |
| 49 | Open Questions — "When an architecture document graduates … is the cross-reference captured anywhere?" | A | `[OPEN]` | Boundary/scope question; relates to #20 | |
| 50 | Open Questions — "`housekeep` command: manual only, or scheduled/automated execution?" | A | `[OPEN]` | Triggers NFR consideration (automation); Spec > Operations | |
| 51 | Open Questions — "Is Confluence automation available and licenced on the target instance?" | A | `[OPEN]` | Duplicates #41; resolve together | |
| 52 | Open Questions — "Final controlled vocabulary for the `domain` field" | A | `[OPEN]` | Duplicates #19; blocks template finalisation | |

---

## Gap Rows (D — required by scaffold but absent from this source)

| # | Scaffold section missing | Template | Notes |
|---|--------------------------|----------|-------|
| G1 | **Domains** — no explicit domain decomposition; operations are grouped by integration target (Confluence, Jira, SNOW), not by system responsibility domain | `tpl-doc-spec.md` | Source uses integration-point framing; domain model must be derived in Spec step | |
| G2 | **Non-Functional Requirements** — no explicit NFRs stated (availability, latency, auditability, recoverability) | `tpl-doc-spec.md` | Some implicit NFRs inferable (auditability from housekeep rationale; survivability from SQLite ephemeral decision); none formalised | |
| G3 | **Constraint IDs** — constraints are stated in prose but not assigned CON-xxx identifiers | `tpl-doc-spec.md` | Prevents cross-referencing in Architecture.md; must be assigned at Spec step | |
| G4 | **Guiding Principles** — no explicit architectural trade-off statements ("we prefer X over Y because Z") | `tpl-doc-architecture.md` | Implicit principles present (distributed storage > replication; ephemeral index > persistent store); need formalising | |
| G5 | **Component Overview / Components section** — no named component list or component responsibility statements | `tpl-doc-architecture.md` | Components implied (CLI, MCP server, sync engine, index, adapters) but not enumerated or bounded | |
| G6 | **Constraint Traceability table** — no mapping of constraints to satisfying components | `tpl-doc-architecture.md` | Cannot be completed until Spec constraints are assigned CON-xxx IDs (see G3) | |
| G7 | **NFR Traceability table** — absent; depends on G2 being resolved first | `tpl-doc-architecture.md` | Blocked by G2 | |

---

## Notes for Human Review

- **#7 / #32**: Two rows covering the same SQLite ephemeral cache decision from slightly different angles. Recommend collapsing to one inventory item.
- **#19 / #52**: Domain vocabulary gap appears in both the body and Open Questions. Single item in inventory.
- **#40 / #41 / #51**: Three constraint/open rows relate to Confluence licence and PP Report capability. Treat as one cluster in inventory.
- **#26 / #38**: Both record RLSE and CHG deferral from different sections. Collapse in inventory.
- **E rows**: No within-file contradictions identified. All constraints and decisions are internally consistent.
- **B row (#17)**: Page Properties field table has a natural home in Architecture/Spec but will also need representation in `doc/system/Data Model.md` when that document is drafted. Flag for Step 3 cross-file mapping.
- **Highest-priority gaps**: G1 (domain model) and G2 (NFRs) are the most significant absences — both are required before Spec.md can be drafted.
