# Triage — 005-Brainstorming-CG-Thinking

Source: `work/inputs/005-Brainstorming-CG-Thinking.md`
Applicable scaffolds: `tpl-doc-overview.md`, `tpl-doc-spec.md`, `tpl-doc-architecture.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

## Classification Table

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | Intro — "single operating model with two artefact classes: Jira = accountable work and portfolio flow / Confluence = durable knowledge, decisions, standards, and architecture state" | A | [DECISION] | Core structural decision for the operating model; maps to Architecture.md Guiding Principles and Overview.md Scope | |
| 2 | §1.1 — "Do not create one Jira project per initiative. Use Jira projects by durable domain or portfolio boundary" | A | [DECISION] | Explicit architectural choice with stated rationale; ADR candidate | |
| 3 | §1.1 — Example project keys: EA, ERP, INT, OPS, PLT | A | [MECHANISM] | Illustrative; not prescriptive. Maps to Spec domain model | |
| 4 | §1.1 — "projects should reflect long-lived ownership and permissions, not temporary efforts" | A | [CONSTRAINT] | Organisational constraint — source: process/governance | |
| 5 | §1.2 — Four-level hierarchy: Initiative / Epic / Delivery work items / Sub-task | A | [REQUIREMENT] | Core structural requirement; maps to Spec operations | |
| 6 | §1.2 Level 1 — Initiative: "cross-team or multi-quarter outcome" | A | [REQUIREMENT] | Definition of the Initiative level; feeds Spec.md | |
| 7 | §1.2 Level 2 — Epic: "coherent work package within an initiative" | A | [REQUIREMENT] | Definition of the Epic level | |
| 8 | §1.2 Level 3 — Issue types: Story, Task, Bug, Assessment, Decision, Improvement, Risk, Dependency, Documentation | A | [REQUIREMENT] | Required issue type vocabulary; maps to Spec operations domain | |
| 9 | §1.2 Level 4 — Sub-task: "Use sparingly. Only when one accountable item needs a few execution steps … same owner context … do not want separate prioritisation" | A | [CONSTRAINT] | Usage constraint on sub-tasks; process constraint | |
| 10 | §1.2 — "Do not use subtasks to simulate process phases" | A | [CONSTRAINT] | Anti-pattern stated as constraint | |
| 11 | §1.3 Initiative criteria — "spans multiple epics or teams … business or architectural outcome … roadmap visibility … steering/sponsorship" | A | [REQUIREMENT] | Qualification rules for Initiative creation; maps to Spec operations | |
| 12 | §1.3 Epic criteria — "coherent slice … groups 5–30 work items … produces a visible output" | A | [REQUIREMENT] | Qualification rules for Epic creation | |
| 13 | §1.3 Assessment — output "should be a Confluence artefact, not just a closed ticket" | B | [REQUIREMENT] | Spans Spec (operation requirement) and Architecture (Confluence integration point) | |
| 14 | §1.3 Decision — "options and trade-offs exist … downstream work depends on the result … output should be an ADR or equivalent decision record in Confluence" | B | [REQUIREMENT] | Spans Spec + Architecture; ADR output is a cross-system integration requirement | |
| 15 | §1.3 Improvement — use for "process improvement, governance improvement, control implementation, standardisation, documentation uplift" | A | [REQUIREMENT] | Use-case definition for Improvement issue type | |
| 16 | §1.3 Documentation — "documentation is itself the work product and needs explicit ownership" | A | [REQUIREMENT] | Requirement for explicit Documentation issue type | |
| 17 | §2.1 — Default workflow states: Backlog, Ready, In Progress, In Review, Blocked, Done, Cancelled | A | [REQUIREMENT] | Standard workflow for most work items; maps to Spec operations | |
| 18 | §2.1 — "Do not create statuses like: waiting for business, waiting for architect, ready for testing…" | A | [CONSTRAINT] | Workflow constraint; prefer fields/links over status proliferation | |
| 19 | §2.1 — Alternatives to extra statuses: assignee/reviewer, linked dependency, labels/custom fields, checklist in DoD | A | [MECHANISM] | Implementation guidance for workflow discipline | |
| 20 | §2.2 — Initiative/Epic workflow: Proposed, Qualified, Approved, In Progress, At Risk, Done, Stopped | A | [REQUIREMENT] | Governance-oriented workflow distinct from delivery workflow | |
| 21 | §2.2 — "Do not use workflow status as portfolio ranking. Use prioritisation fields instead." | A | [CONSTRAINT] | Design constraint on workflow vs. fields separation | |
| 22 | §3.1 — Mandatory fields for Initiative: Outcome statement, Business owner, Technical owner, Architect owner, Target review date, Priority, Domain/capability, Change class, Affected systems, Success metric, Confluence hub link | A | [REQUIREMENT] | Field schema for Initiative; maps to Spec operations | |
| 23 | §3.2 — Mandatory fields for Epic: Parent initiative, Epic objective, Owner, Affected process, Affected applications, Deliverable type, Confluence page link, Target milestone | A | [REQUIREMENT] | Field schema for Epic | |
| 24 | §3.2 — Deliverable type values: Analysis, Decision, Design, Build, Rollout, Documentation, Governance | A | [REQUIREMENT] | Controlled vocabulary; maps to Spec domain model | |
| 25 | §3.3 — Mandatory fields for work items: Work type, Owner, Priority, Due/review date, Affected system, Affected process, Documentation link, Definition of done, Change class | A | [REQUIREMENT] | Field schema for Level 3 work items | |
| 26 | §3.4 — Change class values: Process, Application, Integration, Data, Infrastructure, Documentation, Standard, Governance, Control | A | [REQUIREMENT] | Controlled vocabulary for Change class field | |
| 27 | §3.4 — Domain/capability examples: Order to Cash, Procure to Pay, Inventory, Pricing, Trading, Logistics, Finance, Identity and Access, Data Management, Integration Platform | A | [MECHANISM] | Example vocabulary; confirms domain model is business-capability-oriented | |
| 28 | §3.4 — Architecture layer vocabulary: Business, Process, Application, Data, Integration, Technology | A | [REQUIREMENT] | Standard field vocabulary; aligns with EA layer model | |
| 29 | §3.4 — Decision impact values: Local, Cross-team, Cross-domain, Enterprise-wide | A | [REQUIREMENT] | Controlled vocabulary for scoping decisions | |
| 30 | §3.4 — Risk level values: Low, Medium, High, Critical | A | [REQUIREMENT] | Controlled vocabulary for risk | |
| 31 | §3.4 — Evidence required values: ADR, Diagram, Process map, Test proof, Runbook update, Standard update, Training material | A | [REQUIREMENT] | Controlled vocabulary for closure evidence | |
| 32 | §4.1 — Required link types: blocks/is blocked by, relates to, implements, is decision input for, follows from, duplicates | A | [REQUIREMENT] | Jira link type schema; maps to Spec operations and Architecture integration points | |
| 33 | §4.1 — Optional custom link labels: documents/is documented by, governed by, supersedes, derives from | A | [MECHANISM] | Extended link vocabulary; lower priority | |
| 34 | §4.2 — Initiative must link to: one Confluence hub page, at least one Epic | A | [REQUIREMENT] | Traceability constraint; cross-system linking rule | |
| 35 | §4.2 — Epic must link to: parent Initiative, one Confluence page, related ADR pages | A | [REQUIREMENT] | Traceability constraint | |
| 36 | §4.2 — Decision item must link to: ADR page, Epic or Initiative, affected implementation items | A | [REQUIREMENT] | Traceability constraint | |
| 37 | §4.2 — Documentation item must link to: Confluence page created or updated | A | [REQUIREMENT] | Traceability constraint | |
| 38 | §5 — "Use spaces by durable ownership area, not by project" | A | [DECISION] | Mirrors §1.1 Jira project strategy; consistent cross-system principle | |
| 39 | §5 — Example spaces: Enterprise Architecture, ERP, Integrations, IT Operations/Processes, Data/Reporting | A | [MECHANISM] | Illustrative examples; not prescriptive | |
| 40 | §5.1 — Standard page tree per initiative (12-page structure: Overview through Retrospective) | A | [REQUIREMENT] | Confluence IA requirement; maps to Spec operations | |
| 41 | §5.2 — Architecture knowledge tree: Principles, Standards, Reference Architectures, System Landscapes, Integration Catalogue, Data Ownership, ADRs, Reviews | A | [REQUIREMENT] | Durable knowledge architecture; maps to Architecture.md integration points | |
| 42 | §5.2 — "This should outlive any single initiative" | A | [CONSTRAINT] | Longevity constraint on architecture knowledge space; process constraint | |
| 43 | §5.3 — Process knowledge tree: Process Catalogue, Current/Target-State, Roles, Controls, SOPs | A | [REQUIREMENT] | Process knowledge IA; maps to Spec operations | |
| 44 | §6.1 — Initiative hub template sections: Summary, Scope, Why this exists, Deliverables, Linked content, Status narrative | A | [REQUIREMENT] | Content schema for Initiative hub page | |
| 45 | §6.2 — Current-state assessment template sections (14 sections including findings, recommendations, open questions) | A | [REQUIREMENT] | Content schema for current-state page | |
| 46 | §6.2 — "This page must let a new architect or PM understand the actual present system without oral transmission" | A | [CONSTRAINT] | Quality standard / NFR for Confluence content; process constraint | |
| 47 | §6.3 — Target-state design template sections (13 sections including transition considerations, related ADRs) | A | [REQUIREMENT] | Content schema for target-state page | |
| 48 | §6.4 — ADR template sections: Title, Status, Date, Owner, Context, Decision, Options, Trade-offs, Consequences, Implementation implications, Exceptions, Linked Jira items, Related standards | A | [REQUIREMENT] | ADR content schema | |
| 49 | §6.4 — "If the decision changes behaviour across more than one team or system, record it" | A | [CONSTRAINT] | ADR trigger rule; process constraint | |
| 50 | §6.5 — Standard/reference architecture template (11 sections including Mandatory rules, Exceptions process, Review cadence) | A | [REQUIREMENT] | Content schema for standards pages | |
| 51 | §6.6 — Process design template sections (12 sections) | A | [REQUIREMENT] | Content schema for process design pages | |
| 52 | §6.7 — Architecture review template sections (9 sections) | A | [REQUIREMENT] | Content schema for architecture review pages | |
| 53 | §7.1 — "No initiative moves from Proposed to Qualified unless the Confluence hub exists" | B | [CONSTRAINT] | Cross-system gate rule; spans Spec (operation) and Architecture (Jira→Confluence integration); process constraint | |
| 54 | §7.2 — "Do not close an Assessment ticket unless its Confluence output exists and is linked" | B | [CONSTRAINT] | Cross-system gate rule; same as #53 pattern | |
| 55 | §7.3 — "Do not start delivery items whose behaviour depends on a decision that has not been recorded" | B | [CONSTRAINT] | Cross-system sequencing constraint | |
| 56 | §7.4 — "Documentation updates are not implicit. Create explicit items for them." | A | [REQUIREMENT] | Explicit documentation work item requirement | |
| 57 | §7.5 — Done definition: "implementation complete, documentation updated, decisions finalised, operational impact captured" | B | [REQUIREMENT] | Cross-system definition of done; spans Spec + Architecture | |
| 58 | §8.1 — Delivery board: Stories, Tasks, Bugs, Documentation, Improvements in active epics; columns Backlog→Done | A | [REQUIREMENT] | Board/view requirement for delivery work | |
| 59 | §8.2 — Architecture/improvement board: Assessments, Decisions, Improvements, Risks, Dependencies, Documentation | A | [REQUIREMENT] | Separate board requirement for non-delivery work | |
| 60 | §8.3 — Initiative roadmap/plans view: Initiatives, Epics, dates, dependencies, status, owner | A | [REQUIREMENT] | Portfolio view requirement | |
| 61 | §9 — Definition of done per issue type (Assessment, Decision, Improvement, Documentation, Epic) | B | [REQUIREMENT] | DoD schema; spans Spec (operations) and Architecture (cross-system closure rules) | |
| 62 | §10.1 — Qualify gate: problem statement, owner, scope, hub page, expected outcome | B | [REQUIREMENT] | Governance gate; cross-system (Jira status + Confluence existence) | |
| 63 | §10.2 — Start gate: current-state documented, target-state documented enough, decisions identified, dependencies visible, standards impact known | B | [REQUIREMENT] | Governance gate; cross-system | |
| 64 | §10.3 — Close gate: architecture/process docs updated, ADRs finalised, operating docs updated, evidence captured, residual risks assigned | B | [REQUIREMENT] | Governance gate; cross-system | |
| 65 | §11 — End-to-end example: "Standardise outbound interface error handling" with full Epics, work items, Confluence pages | C | [MECHANISM] | Illustrative example only; not a requirement. No target doc in document map for worked examples | |
| 66 | §12 — Jira naming convention: Initiative = `<Outcome verb> <object> <scope>`, Epic = `<Initiative> - <work package>`, Decision = `Decision - <subject>`, Documentation = `Document - <artefact>` | A | [REQUIREMENT] | Naming convention; maps to Spec operations | |
| 67 | §12 — Confluence prefix conventions: INIT-, ADR-, STD-, PROC-, ARCH-, REV- | A | [REQUIREMENT] | Naming convention for Confluence pages | |
| 68 | §13 — Anti-patterns list (8 items): e.g. "create Jira tickets as substitute meeting minutes", "bury requirements in comments", "close delivery without documentation updates" | A | [CONSTRAINT] | Anti-patterns are implicit constraints; sourced as process decisions | |
| 69 | §14 — Minimal implementation package (issue types, workflows, fields, Confluence templates) | A | [MECHANISM] | Rollout scope hint; maps to Spec priority framing (Must-have) | |
| 70 | §15 — Rollout sequence: Phase 1 (types/fields/templates/naming), Phase 2 (DoD/cadence/dashboards), Phase 3 (standards/ADR/review/reporting) | C | [MECHANISM] | Rollout sequencing; no home in current document map (not Roadmap.md — that doc doesn't exist yet and derives from locked Spec+Architecture) | low confidence on C; could inform Roadmap.md eventually |
| 71 | §16 — Final recommendation: "Initiative and Epic in Jira define what must be achieved / Assessment and Decision items define what must be understood and decided / Confluence pages hold the actual understanding / Documentation work is explicit / Closure requires evidence" | A | [DECISION] | Synthesises the operating model as a set of principles; maps to Architecture.md Guiding Principles | |
| D1 | Gap — Overview.md: Primary User | D | | No source fragment. The input contains no explicit statement of who the primary user of the *assistant* is (role, context, goal). Required by tpl-doc-overview.md. | |
| D2 | Gap — Overview.md: Key Outcome (measurable/falsifiable) | D | | Input describes the operating model design but does not state a testable outcome for the assistant system itself. Required by tpl-doc-overview.md. | |
| D3 | Gap — Spec.md: Non-Functional Requirements | D | | No latency, availability, auditability, or recoverability statements for the assistant. Required by tpl-doc-spec.md NFR section. | |
| D4 | Gap — Spec.md: Out of Scope | D | | Input does not explicitly bound what the operating model (or assistant) will not do. Required by both Overview and Spec scaffolds. | |
| D5 | Gap — Architecture.md: Guiding Principles | D | | §16 provides operating model principles but no architectural trade-off principles for the assistant system itself (e.g. "prefer X over Y because Z"). Required by tpl-doc-architecture.md. | |
| D6 | Gap — Architecture.md: Integration Points (protocol/auth detail) | D | | §4–7 establish what must link to what but do not specify integration protocols, auth mechanisms, or API contracts between Jira, Confluence, and the assistant backend. Required by Architecture.md Integration Points table. | |
| D7 | Gap — Architecture.md: Component model | D | | No decomposition of the assistant system into named components with responsibilities. Required by tpl-doc-architecture.md Components section. | |
| D8 | Gap — Spec.md: Constraint sourcing | D | | Several constraints in the input are stated without attribution to a system, process, or decision (e.g. §2.1 workflow restrictions, §4 linking rules). Required by Spec scaffold: every constraint must be sourced. | |
