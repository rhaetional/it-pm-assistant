# Triage — 006-Brainstorming-CG-Normal

Source: `work/inputs/006-Brainstorming-CG-Normal.md`
Source type: brainstorm
Applicable scaffolds: `tpl-doc-overview.md`, `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

---

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | Conclusion (opening): "Use Jira to model *flow and accountability* … Use Confluence to model *knowledge and intent*" | A | [DECISION] | Maps to Overview § Purpose / Key Constraints and Architecture § Guiding Principles | |
| 2 | §1 Operating Model: "You're running a **change system** across three axes: Software delivery, Process improvement, Architecture evolution" | A | [REQUIREMENT] | Maps to Overview § Scope (In Scope); defines the three operational axes the system must support | |
| 3 | §1: "These have different lifecycles but must converge." | A | [CONSTRAINT] | Process constraint — cross-axis convergence is required; source: operating model design. Maps to Spec § Constraints | |
| 4 | §1: "Do not force everything into a single Jira project type or workflow. Model them explicitly." | A | [DECISION] | Maps to Architecture § Guiding Principles; motivates the separation into ARCH / Improvement / etc. | |
| 5 | §2 Jira issue types: Initiative, Epic, Story/Task, Enabler, Decision, Improvement | B | [MECHANISM] | Multi-home: Spec § Operations (domain: Jira execution layer) + Architecture § Components. Note: Stories/Tasks later retracted — see #26 | |
| 6 | §2: "Avoid generic 'task dumping'. Each type must have semantics." | A | [CONSTRAINT] | Process constraint. Maps to Spec § Constraints | |
| 7 | §2 Confluence artefact types: Architecture Overview, ADR, Process Definitions/SOPs, Capability Maps/Domain Models, Integration Contracts, Runbooks/Operational Docs | B | [MECHANISM] | Multi-home: Spec § Operations (domain: Confluence knowledge layer) + Architecture § Components | |
| 8 | §2: "Each page type should follow a **template with fixed sections**." | A | [CONSTRAINT] | Process constraint on Confluence. Maps to Spec § Constraints | |
| 9 | §3 Invariant 1: "Every Epic maps to a Confluence page (or page tree)" | A | [REQUIREMENT] | Maps to Spec § Operations (linking domain). Foundational cross-system requirement | |
| 10 | §3 Invariant 2: "Every architectural decision exists as an ADR page … Linked to: Jira Decision issue (optional but useful) + Affected Epics" | A | [REQUIREMENT] | Maps to Spec § Operations (ADR lifecycle domain) | |
| 11 | §3 Invariant 3: "Every Story references architecture context — Not duplicated—linked" | A | [REQUIREMENT] | Later retracted (#26 removes Stories from Jira). Contradicts revised model — see #26 | |
| 12 | §3 Invariant 4: "No architecture knowledge lives only in Jira tickets" | A | [CONSTRAINT] | Strong architectural constraint. Maps to Architecture § Guiding Principles | |
| 13 | §4 Phase 1 (Problem Framing): Confluence Problem Statement page (Context, Constraints, Success criteria) + Jira Initiative + link | A | [MECHANISM] | Maps to Spec § Operations (initiative lifecycle domain) | |
| 14 | §4 Phase 2 (Architecture & Solution Design): C4 diagrams + ADRs + Trade-off analysis in Confluence; Epics in Jira linked to Confluence | A | [MECHANISM] | Maps to Spec § Operations (architecture design domain) | |
| 15 | §4 Phase 3 (Decomposition & Planning): Break Epics into Stories, Enablers, Improvements in Jira; each Story must answer capability/system/constraint | A | [MECHANISM] | Partially retracted — Stories removed in revised model (#26). Flag for reconciliation | |
| 16 | §4 Phase 4 (Execution): Standard Jira flow; Confluence updated "only when knowledge changes, not per task" | A | [CONSTRAINT] | Process constraint. Maps to Spec § Constraints. Anti-pattern: documenting implementation steps in Confluence | |
| 17 | §4 Phase 5 (Validation & Institutionalisation): Close Epics only when docs reflect reality + operational ownership clear | A | [REQUIREMENT] | Maps to Spec § Operations (closure domain). Definition-of-Done constraint | |
| 18 | §5 Project structure Option A — Single Project (simpler governance) | C | [MECHANISM] | No direct home: this is Jira configuration detail, not system design for the assistant. Informational context | |
| 19 | §5 Project structure Option B — Split by concern: ARCH, DEV, OPS | C | [MECHANISM] | Same as #18; subsequently superseded by §1 of revised model (DEV/OPS → ServiceNow). Low signal post-revision | |
| 20 | §5 Custom fields: System/Domain, Change Type, Architecture Impact, ADR link | A | [MECHANISM] | Maps to Spec § Operations (Jira data model). Informs Data Model doc eventually | |
| 21 | §5 Boards: Delivery, Architecture, Improvement — separated by flow type not org chart | A | [MECHANISM] | Maps to Spec § Operations. Informational/configuration detail; low confidence for assistant scope | |
| 22 | §6 Confluence space design: Architecture Space, Process/Operating Model Space | A | [MECHANISM] | Maps to Architecture § Components (Confluence component) | |
| 23 | §6 Page hierarchy example (Domains → Systems → Decisions → Standards) | A | [MECHANISM] | Maps to Architecture § Components. `low` — illustrative, not normative | |
| 24 | §6 Templates non-negotiable: ADR (Context/Decision/Alternatives/Consequences/Status), Architecture Page (Purpose/Context/Key components/Interfaces/Constraints), Process Page (Scope/Actors/Flow/Exceptions/Metrics) | A | [REQUIREMENT] | Maps to Spec § Operations (Confluence knowledge layer). Fixed-section templates are a hard constraint | |
| 25 | §7 Integration patterns: Jira Epic → Confluence Architecture Page; Jira Decision → ADR; Confluence → embedded Jira issue list. "Navigation must work both ways." | A | [REQUIREMENT] | Maps to Architecture § Integration Points | |
| 26 | User input: "DEV is covered by releases in ServiceNow, and Ops use ServiceNow incidents. These day-to-day operations need not be covered by JIRA." | A | [CONSTRAINT] | System constraint — ServiceNow is the execution layer; Jira scope is restricted. Maps to Overview § Out of Scope + Spec § Constraints | |
| 27 | Revised conclusion: "Restrict Jira to change design, coordination, and architectural governance … Jira becomes a **control plane for change**, not an execution tracker." | A | [DECISION] | Maps to Overview § Purpose + Architecture § Guiding Principles. Supersedes earlier Jira-as-delivery-tracker framing | |
| 28 | Revised §1 System Boundaries: ServiceNow owns release execution, incidents/problems/changes, operational SLAs | A | [CONSTRAINT] | System constraint. Maps to Overview § Out of Scope + Spec § Constraints | |
| 29 | Revised §1: "Jira owns: why and what changes, cross-system coordination, architectural intent and constraints, non-operational improvements" | A | [REQUIREMENT] | Maps to Overview § Scope (In Scope) + Spec § Domains | |
| 30 | Revised §2 Issue types (final): Initiative, Epic, Enabler, Improvement, Decision (optional). "No Stories. No Tasks. Those belong in ServiceNow or team-local tooling." | A | [DECISION] | Maps to Architecture § Components (Jira component). Supersedes #5 / #11 / #15 | |
| 31 | Revised §3 Integration model: "Jira defines intent and scope. ServiceNow executes implementation and release." | A | [DECISION] | Maps to Architecture § Guiding Principles + Integration Points | |
| 32 | Revised §3 Minimal linking model: Epic references ServiceNow Change Request(s) + Release ID(s) + Confluence Architecture page(s) + ADR(s) | A | [REQUIREMENT] | Maps to Architecture § Integration Points + Spec § Operations | |
| 33 | Revised §3 Data flow: Initiative → Epic → ServiceNow Change/Release → Feedback → Epic. "Do not attempt field-level synchronisation unless you have a strong governance model." | A | [CONSTRAINT] | Maps to Architecture § Data Flow. Constraint on integration depth | |
| 34 | Revised §3: "Do not attempt field-level synchronisation" | A | [CONSTRAINT] | Integration constraint — loose coupling only. Maps to Architecture § Integration Points + Spec § Constraints | |
| 35 | Revised §4 Phase 3 (Handover): Epic reaches "Ready for Implementation"; ServiceNow creates Change Requests + Releases. "Jira does not track task-level execution." | A | [DECISION] | Maps to Spec § Operations (handover domain). Formalises the Jira/ServiceNow boundary | |
| 36 | Revised §4 Phase 4 (Execution Feedback Loop): ServiceNow status updates → Jira Epic (manual or lightweight integration); risks/blockers surfaced at Epic level | A | [REQUIREMENT] | Maps to Spec § Operations (feedback loop domain) + Architecture § Data Flow | |
| 37 | Revised §4 Phase 5 (Closure): Epic closed only when ServiceNow changes completed + architecture docs updated + ADRs finalised + operational ownership clarified | A | [REQUIREMENT] | Maps to Spec § Operations (closure domain). Strengthens #17 | |
| 38 | Revised §5 Governance table: Architecture intent → Confluence/Architecture; Change definition → Jira/Architecture+PM; Execution → ServiceNow/Delivery+Ops; Operational truth → ServiceNow/Ops | A | [REQUIREMENT] | Maps to Overview § Key Constraints + Spec § Constraints. RACI-level responsibility model | |
| 39 | Revised §6 Critical design choice 1: "Do not recreate Epics ↔ Stories ↔ Tasks in Jira if ServiceNow already models execution" | A | [DECISION] | Reinforces #30. Maps to Architecture § Guiding Principles | |
| 40 | Revised §6 Critical design choice 2: Epic workflow: Draft → In Analysis → Approved → Ready for Implementation → In Implementation → Done. "Avoid granular states you cannot reliably sync." | A | [MECHANISM] | Maps to Spec § Operations (Epic lifecycle). `low` confidence that exact states are normative vs illustrative | |
| 41 | Revised §6 Critical design choice 3: "Every Epic must link to at least one Confluence architecture page, reference impacted systems, state architectural impact explicitly. Otherwise Jira degrades into a request tracker." | A | [REQUIREMENT] | Maps to Spec § Operations (Epic mandatory fields) + Architecture § Components | |
| 42 | Revised §7 Failure mode 1: "Jira becomes irrelevant — all real work in ServiceNow. Fix: enforce that no change starts without a Jira Epic" | A | [CONSTRAINT] | Process constraint / governance rule. Maps to Spec § Constraints | |
| 43 | Revised §7 Failure mode 2: "ServiceNow bypasses architecture. Fix: any cross-system or structural change requires a Jira Epic + ADR" | A | [CONSTRAINT] | Process constraint. Maps to Spec § Constraints | |
| 44 | Revised §7 Failure mode 3: Duplicate status tracking — Jira tracks phase, ServiceNow tracks execution | A | [DECISION] | Reinforces #33 / #35. Maps to Architecture § Guiding Principles | |
| 45 | Revised §7 Failure mode 4: Confluence drift — Epic cannot close without documentation update | A | [CONSTRAINT] | Process constraint reinforcing DoD. Maps to Spec § Constraints | |
| 46 | Revised §8: "You're separating design-time system (Jira + Confluence) from run-time system (ServiceNow). Only works if handover boundary is explicit and feedback loop is enforced." | A | [DECISION] | Maps to Architecture § Guiding Principles. High-signal framing for the system | |
| 47 | Revised §9 "Change contract" at Epic level: Scope, Systems impacted, Data model impact, Integration impact, Operational impact | A | [MECHANISM] | Maps to Spec § Operations (Epic structure). `low` — framed as optional optimisation, but aligns with #41 | |
| 48 | §10: "Treat architecture as a product, not documentation. Treat Jira as a constraint system, not a backlog. Treat Confluence as a source of truth, not a note-taking tool." | A | [DECISION] | Maps to Overview § Purpose / Architecture § Guiding Principles. Strong framing principles | |
| 49 | D — No explicit statement of the primary user role (IT architect / EM) or their context | D | | Gap: Overview § Primary User — not addressed in this source | |
| 50 | D — No measurable or falsifiable Key Outcome statement | D | | Gap: Overview § Key Outcome — success criteria absent; Problem Statement page mentioned but not defined here | |
| 51 | D — No NFR statements (availability, latency, auditability, recoverability, security) | D | | Gap: Spec § Non-Functional Requirements — entirely absent from this source | |
| 52 | D — No API / interface contract between the assistant and the three systems (Jira, Confluence, ServiceNow) | D | | Gap: tpl-doc-system-api.md — no machine-readable integration contracts defined | |
| 53 | D — No data model for the cross-system entities (Initiative, Epic, ADR, Change Request linking) | D | | Gap: tpl-doc-system-datamodel.md — entity schema absent | |
