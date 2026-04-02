# Triage — 003-Brainstorming-CLD-Extended

Source: `work/inputs/003-Brainstorming-CLD-Extended.md`
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

---

## Classification Table

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | Core tension — "JIRA is optimised for delivery-oriented, decomposable work … EA and process improvement work is often exploratory … Forcing it into the same workflow creates friction" | A | `[CONSTRAINT]` | Process constraint: the system must accommodate non-sprint work modes without forcing artificial decomposition. Feeds Spec > Constraints. | |
| 2 | Core tension — "The fix isn't a different tool — it's intentional issue type design and a clear JIRA↔Confluence contract" | A | `[DECISION]` | Explicit choice: stay on Jira/Confluence, solve via configuration not tooling change. ADR candidate. | |
| 3 | Work type taxonomy — three modes: Software delivery / Architecture documentation / Process improvement, each with distinct cadence, primary output, PM challenge | B | `[REQUIREMENT]` | Multi-home: feeds Spec > Domains (domain decomposition) and Spec > Operations (operation differentiation per mode). Also informs Architecture > Components. | |
| 4 | JIRA design — "Don't flatten everything into Story/Task. Define: Initiative … Epic … Architecture Task … Story/Task/Bug … Process Improvement Item" | A | `[MECHANISM]` | Issue type hierarchy design. Feeds Spec > Operations (initiative management domain). | |
| 5 | JIRA design — "Rationale: mixing EA tasks with dev stories in the same backlog obscures both. Separate issue types allow separate workflows and different Definition of Done" | A | `[DECISION]` | Rationale for #4. ADR candidate (choosing separate issue types over labels/components). | |
| 6 | Workflow states for EA/process work — `Backlog → In Analysis → Draft → In Review → Accepted → Published → Superseded` | A | `[MECHANISM]` | Custom workflow for architecture tasks. Feeds Architecture > Components (Jira integration). | |
| 7 | Workflow states — `"Published" = Confluence page is live and linked` | A | `[CONSTRAINT]` | DoD constraint: publication requires Confluence link. Process constraint, not just a mechanism. | |
| 8 | Workflow states — `"Superseded" = an ADR has been replaced … Tracking supersession in JIRA avoids the Confluence graveyard problem` | A | `[REQUIREMENT]` | Supersession tracking as an explicit system requirement. Feeds Spec > Operations. | |
| 9 | JIRA design — "Map JIRA Components to your capability/domain model (Integration, Data, Security, Platform, etc.) rather than teams" | A | `[DECISION]` | Domain-over-team component mapping. ADR candidate. | |
| 10 | JIRA design — "Kanban for EA and process work (continuous flow, no artificial sprint pressure) … Scrum for delivery teams" | A | `[DECISION]` | Board type decision by work mode. Informs Spec > Constraints. | |
| 11 | JIRA design — "Keep them in separate projects or at least separate boards" | A | `[CONSTRAINT]` | Separation constraint between EA work and delivery work. Process constraint. | |
| 12 | Confluence structure — "Avoid initiative-based spaces … Use domain-based spaces that outlive projects" | A | `[DECISION]` | Durability-over-initiative space design. ADR candidate. | |
| 13 | Confluence structure — space hierarchy: EA root with Integration / Data / Security / Platform / Decisions sub-spaces; separate Projects space for time-bounded work | A | `[MECHANISM]` | Proposed Confluence IA. Feeds Architecture > Components (Confluence structure). | |
| 14 | Confluence — Templates: ADR, Capability Assessment, Design Doc, Process Description, Meeting Notes — each with defined key sections and Jira link requirement | B | `[REQUIREMENT]` | Multi-home: Spec > Operations (template enforcement operation) and Architecture > Integration Points (Confluence↔Jira link). | |
| 15 | Confluence — Page Properties macro schema: Status / Owner / Domain / Last reviewed / Next review / JIRA Epic | A | `[MECHANISM]` | Metadata schema for architecture pages. Feeds Architecture > Data Flow (review cycle trigger). | |
| 16 | Confluence — "Page Properties Report macro on index pages … queryable dashboard of architecture coverage … you can see at a glance what's stale" | A | `[REQUIREMENT]` | Coverage visibility requirement. Feeds Spec > Operations (staleness detection). | |
| 17 | JIRA↔Confluence contract — "Every JIRA Epic must link to a Confluence page" | A | `[REQUIREMENT]` | Bidirectional link discipline, direction 1. Core operational requirement. | |
| 18 | JIRA↔Confluence contract — "Every Confluence architecture page must embed a JIRA filter showing open work in that domain" | A | `[REQUIREMENT]` | Bidirectional link discipline, direction 2. | |
| 19 | JIRA↔Confluence contract — "Definition of Done for EA/process work must include documentation: ADR written … Confluence page updated … JIRA closed with link" | A | `[CONSTRAINT]` | DoD constraint. Process constraint; also a system enforcement requirement. | |
| 20 | JIRA↔Confluence contract — "Without this in the DoD, the doc update never happens" | A | `[CONSTRAINT]` | Rationale for #19 — enforcement is required, not optional. Confidence: stated explicitly. | |
| 21 | Typical workflow: Architecture Documentation Initiative — 7-step flow from input → JIRA Epic → Architecture Tasks → Confluence drafts → review cycle → publish → scheduled review | A | `[MECHANISM]` | End-to-end workflow for architecture doc initiatives. Feeds Spec > Operations (Architecture Documentation domain). | |
| 22 | Architecture workflow — "Scheduled review cycle: Confluence Page Properties review date triggers new JIRA task" | A | `[REQUIREMENT]` | Automated review trigger requirement. Feeds Spec > Operations (review scheduling). Relates to #15 and #16. | |
| 23 | Typical workflow: Process Improvement — JIRA Epic with four child Epics: Analyse / Design / Implement / Measure | A | `[MECHANISM]` | Process improvement workflow structure. Feeds Spec > Operations (Process Improvement domain). | |
| 24 | Process Improvement workflow — "Runbook / SOP updated in Confluence before Epic closes" | A | `[CONSTRAINT]` | DoD constraint for process improvement epics. Process constraint. | |
| 25 | Process Improvement workflow — "Measure Epic: JIRA tasks for metric collection, retrospective page in Confluence" | A | `[REQUIREMENT]` | Measurement/retrospective requirement for process improvement. Feeds Spec > Operations. | |
| 26 | Pitfalls — "JIRA as a graveyard — epics opened, never closed, no Confluence link. Fix: weekly triage ritual, mandatory Confluence link on Epic creation" | A | `[MECHANISM]` | Operational ritual + system enforcement for Jira hygiene. | |
| 27 | Pitfalls — "Confluence as a graveyard — pages created, never updated. Fix: Page Properties with review dates, automated Confluence space audits (you can script this via REST API)" | B | `[MECHANISM]` | Multi-home: Spec > Operations (audit operation) and Architecture > Integration Points (REST API). | |
| 28 | Pitfalls — "ADRs not written — decisions made in meetings, never recorded. Fix: meeting notes template forces a 'Decisions' section; each decision item spawns a JIRA task to write the ADR" | A | `[MECHANISM]` | ADR capture mechanism via meeting notes template + automatic task creation. Feeds Architecture > Data Flow. | |
| 29 | Pitfalls — "EA work mixed into dev backlogs — invisible to architects, noisy for developers. Fix: separate JIRA project or at minimum a dedicated component + board filter" | A | `[REQUIREMENT]` | Separation of EA visibility as explicit requirement. Reinforces #11. | |
| 30 | — | D | — | **Gap — Spec > NFRs**: No NFR statements in source (availability, auditability, latency, recoverability, security posture). Source addresses workflows and tooling design but not non-functional qualities of the system itself. | |
| 31 | — | D | — | **Gap — Spec > Out of Scope**: Source does not explicitly bound what the assistant will NOT do (e.g. replacing Jira/Confluence, managing permissions, full ServiceNow workflow, dev backlog management). | |
| 32 | — | D | — | **Gap — Spec > Open Questions**: No unresolved questions surfaced. Source is prescriptive throughout — does not flag decisions pending resolution. | |
| 33 | — | D | — | **Gap — Architecture > Guiding Principles**: Source contains implicit principles (domain over team, durability over initiative, enforcement over trust) but does not state them as trade-off principles. | |
| 34 | — | D | — | **Gap — Architecture > Component Responsibilities**: Source describes tools (Jira, Confluence) and workflows but does not define the assistant system's own component boundaries (e.g. which component owns the Jira↔Confluence link enforcement, which owns the review scheduler). | |
| 35 | — | D | — | **Gap — Architecture > Constraint Traceability**: No constraint IDs assigned; no traceability table possible from this source alone. | |
