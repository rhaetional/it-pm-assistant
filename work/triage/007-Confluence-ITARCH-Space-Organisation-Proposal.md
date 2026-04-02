# Triage — 007-Confluence-ITARCH-Space-Organisation-Proposal

Source: `work/inputs/007-Confluence-ITARCH-Space-Organisation-Proposal.md`
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-overview.md`
Pass 1 completed: 02.04.2026
Status: AWAITING REVIEW

---

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | "We have one space for use right now — `IT Architecture`" | A | [CONSTRAINT] | Single Confluence space; organisational constraint, not a design choice. Source: stated as current state. Maps to Spec.md CON-NNN. | |
| 2 | "Architecture or Project work represent top-level pages whose documents are 'indexed' with page properties" | A | [MECHANISM] | Page-properties indexing is the current discovery/navigation mechanism. Relevant to Spec.md operations (context retrieval). | |
| 3 | **Variant 1** EA hierarchy: Principles & Standards / ADR Index / Domain Architecture (Application, Data, Integration, Infrastructure) / Current State / Target State / Transition Roadmap | B | [MECHANISM] | Proposed structural option for EA content. Relevant to Spec.md (domain model) and Overview.md (scope). Not chosen — presented as alternative. | |
| 4 | **Variant 2** EA hierarchy: Integration Architecture / Data & Analytics / Security Architecture / Platform & Infrastructure / Decisions (cross-cutting ADR index) | B | [MECHANISM] | Second structural option. Same target docs as #3. Neither variant is marked as selected — this is an open decision. | |
| 5 | Variants 1 and 2 are both presented without a stated selection | E | [OPEN] | Contradiction by omission: two mutually exclusive structures, no resolution stated. Conflicts with #3 and #4. | |
| 6 | "Process & Improvement (PROC)" section with sub-pages: Process Inventory / Process Maps (by domain) / Improvement Register | C | [MECHANISM] | No clear home in current document map. The assistant system has no explicit Process Improvement domain. Flag for scope discussion — may be out-of-scope or may need a domain added to Spec.md. | |
| 7 | "Project Working Spaces (per initiative)" with sub-pages: Brief & Scope / Design Documents / Decision Log / Meeting Notes / Post-Implementation Review | A | [MECHANISM] | Per-initiative Confluence structure directly maps to the assistant's initiative lifecycle. Relevant to Spec.md (operations: create initiative workspace, maintain artefacts). | |
| 8 | "Design Documents ← feeds SNOW design doc review gate" | A | [CONSTRAINT] | Integration constraint: Confluence Design Documents section is a dependency for ServiceNow design-doc review gate. Maps to Spec.md CON-NNN; cross-system dependency. | |
| 9 | "Post-Implementation Review ← populated after SNOW post-impl review" | A | [CONSTRAINT] | Integration constraint: Confluence PIR page is populated as an output of the ServiceNow post-implementation review step. Maps to Spec.md CON-NNN. | |
| 10 | No naming convention for project working spaces is stated | D | — | tpl-doc-spec.md requires constraints to be sourced and specific. Naming/identity scheme for per-initiative Confluence spaces is absent. Required for Spec.md CON section and for the assistant's page-creation operations. | |
| 11 | No lifecycle rules for Confluence pages are stated (archival, deletion, status transitions) | D | — | tpl-doc-spec.md requires operation constraints. Page lifecycle is absent from this source. Needed for Spec.md operations scoping and NFR. | |
| 12 | No access control / permissions model is stated for the space or sub-sections | D | — | tpl-doc-spec.md CON section requires sourced constraints. Permissions model is entirely absent. May be an organisational constraint. | |
| 13 | No statement on whether the EA section (Variant 1 or 2) is in scope for the assistant to read from, write to, or only reference | D | — | tpl-doc-overview.md Scope section requires explicit in/out-of-scope boundaries. The assistant's read/write access to EA sub-pages is unaddressed. | |
| 14 | "Process & Improvement (PROC)" section has a `(?)` marker in the heading | C | [OPEN] | The `(?)` suggests the author is uncertain whether this section belongs. This is an explicit open question embedded in the source. No home in current doc map unless a Process domain is added. | |
