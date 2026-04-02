# Triage — 010-MCP-Agent-Design-Idea

Source: `work/inputs/010-MCP-Agent-Design-Idea.md`
Source type: brainstorm
Applicable scaffolds: `tpl-doc-spec.md`, `tpl-doc-architecture.md`, `tpl-doc-system-api.md`
Pass 1 completed: 03.04.2026
Status: AWAITING REVIEW

---

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | §1 — "All agent-facing operations … should be abstracted through a single MCP server" | A | `[DECISION]` | Maps to Architecture.md (Component Overview / Guiding Principles). Explicit design choice. | |
| 2 | §1 — "Auth, error handling, logging, and retry logic live in one place" | A | `[REQUIREMENT]` | NFR candidate for Spec.md; also constrains MCP component design in Architecture.md. | |
| 3 | §1 — "Tools compose naturally into chains (retrieve → act → write back)" | A | `[MECHANISM]` | Architecture.md Data Flow. Describes intended usage pattern, not a hard requirement. | |
| 4 | §1 — "Adding a new tool doesn't require changes to the agent config or prompt" | A | `[REQUIREMENT]` | NFR / extensibility requirement. Maps to Spec.md NFR table. | |
| 5 | §1 — "Only wrap operations the agent should be able to invoke autonomously. Bulk imports, admin ops, and anything irreversible without human confirmation should stay outside the MCP surface or require explicit confirmation semantics." | A | `[CONSTRAINT]` | System/process constraint on MCP surface scope. Maps to Spec.md Constraints (CON-xxx) and Architecture.md component boundary. | |
| 6 | §2 — "primary token saving … is the architecture it encourages: narrow, purposeful tools that return only signal" | A | `[MECHANISM]` | Architecture.md Guiding Principles. Design rationale, not a testable requirement on its own. | |
| 7 | §2 — "Prefer `list_initiatives_missing_jira_link()` over returning all initiative records and letting the agent filter" | A | `[REQUIREMENT]` | Maps to Spec.md Operations (tool design principle) and API.md conventions. Specific enough to be testable. | |
| 8 | §2 — "Return structured JSON, not prose blobs" | A | `[REQUIREMENT]` | Maps to API.md Conventions. Testable interface contract. | |
| 9 | §2 — "The SQLite cache layer is the right place for gap detection logic, not the agent's reasoning loop" | A | `[DECISION]` | Architecture.md component responsibility allocation. Significant structural choice — ADR candidate. | |
| 10 | §2 — "If the agent would need to read a document to answer a question, the question belongs in a tool." | A | `[MECHANISM]` | Architecture.md Guiding Principles. Design heuristic / principle. | |
| 11 | §3 — "MCP tools … can encode governance procedures — fixed sequences the agent executes when it recognises a triggering condition" | A | `[REQUIREMENT]` | Spec.md Operations domain (procedural tools). Distinct capability class from data-retrieval tools. | |
| 12 | §3 — `create_feature_branch(initiative_id, description)` — consistent naming, linked to initiative | A | `[MECHANISM]` | API.md Endpoints. Specific tool signature. Illustrative example but implies a concrete API contract. | |
| 13 | §3 — `scaffold_adr(initiative_id, branch, title)` — stub created in correct location with correct frontmatter, registered in DB as Draft | A | `[MECHANISM]` | API.md Endpoints. Specific tool signature + side-effects (DB write). | |
| 14 | §3 — "The agent recognises *when* to invoke the procedure; the tool executes *how*" | A | `[DECISION]` | Architecture.md Guiding Principles. Defines agent/tool responsibility boundary. ADR candidate. | |
| 15 | §3 — "Rules are version-controlled and applied consistently" | A | `[REQUIREMENT]` | NFR candidate (consistency, auditability). Maps to Spec.md NFRs. | |
| 16 | §3 — "Each tool encodes one procedure. Do not build policy engines into tools." | A | `[CONSTRAINT]` | Process/design constraint on tool scope. Maps to Architecture.md component boundaries. | |
| 17 | §4 — "fill-out instructions should be part of the tool's return value — not embedded in the system prompt" | A | `[DECISION]` | Architecture.md / API.md. Significant design choice; ADR candidate. | |
| 18 | §4 — "Instructions travel with the artefact reference; they cannot be decoupled or forgotten" | A | `[MECHANISM]` | Rationale for #17. Architecture.md Guiding Principles. | |
| 19 | §4 — "Updating guidance requires changing the tool only — no prompt maintenance" | A | `[REQUIREMENT]` | NFR (maintainability). Maps to Spec.md NFRs. | |
| 20 | §4 — "any scaffolding tool should return `{ file, instructions }` as a minimum" | A | `[REQUIREMENT]` | API.md Conventions. Standard return contract for all scaffolding tools. Testable. | |
| 21 | §4 — example `scaffold_adr` return: `{ file, adr_number, instructions }` | A | `[MECHANISM]` | API.md Endpoints. Concrete response schema example. | |
| 22 | §4 — "Instructions can be enriched with initiative-specific context pulled from SQLite at scaffold time" | A | `[REQUIREMENT]` | Spec.md Operations / API.md. Enrichment at scaffold time implies SQLite read in tool execution path. | |
| 23 | §5 — "MCP's `tools/list` provides dynamic discovery at session start" | A | `[MECHANISM]` | Architecture.md Integration Points / API.md. Describes MCP protocol behaviour. | |
| 24 | §5 — "agent prompting often names tools explicitly … because an LLM reasons better knowing what's available upfront" | A | `[MECHANISM]` | Architecture.md Guiding Principles. Practical constraint on system prompt design. | |
| 25 | §5 — "Don't design the system prompt around discovery. Use `tools/list` for its operational benefit … but document the intended tool set explicitly in `CLAUDE.md` or equivalent." | A | `[DECISION]` | Architecture.md / Spec.md. Governs agent configuration approach. | |
| 26 | S1 — "All agent-callable operations exposed through a single MCP server" | B | `[REQUIREMENT]` | Overlaps with #1 (§1). Summary table restates the same point — both rows retained as the table entry is more concise. Maps to Spec.md and Architecture.md. | |
| 27 | S2 — "Tool interfaces designed for retrieval precision — narrow inputs, structured returns" | B | `[REQUIREMENT]` | Overlaps with #7 and #8. Summary restatement. Maps to Spec.md Operations and API.md Conventions. | |
| 28 | S3 — "Gap detection logic implemented in SQLite layer, surfaced via dedicated query tools" | A | `[REQUIREMENT]` | Overlaps with #9. Adds "dedicated query tools" nuance — slightly more specific than §2 text. Maps to Spec.md Operations and Architecture.md. | |
| 29 | S4 — "Procedural tools (branch creation, ADR scaffolding) included in MCP surface" | B | `[REQUIREMENT]` | Overlaps with #11–#13. Summary restatement. Maps to Spec.md Operations and API.md. | |
| 30 | S5 — "Scaffolding tools return `{ file, instructions }` as a standard contract" | A | `[REQUIREMENT]` | Overlaps with #20. Canonical formulation is here (S5) and §4. Maps to API.md Conventions. | |
| 31 | S6 — "Instructions enriched with initiative-specific SQLite context at scaffold time" | A | `[REQUIREMENT]` | Overlaps with #22. Maps to API.md / Spec.md Operations. | |
| 32 | S7 — "GitHub write ops (commit, push) excluded from agent autonomy; procedural scaffolding permitted" | A | `[CONSTRAINT]` | Refines #5. Explicit autonomy boundary for GitHub operations. Maps to Spec.md Constraints and Architecture.md component boundary. Critical constraint — no rationale given beyond the general irreversibility principle. | |
| 33 | S8 — "Tool set documented explicitly in governance file; dynamic discovery used operationally only" | A | `[DECISION]` | Overlaps with #25. Canonical formulation. Maps to Architecture.md. | |
| 34 | D — Spec.md §Domains: no domain decomposition present in this source | D | | No home for governance / agent domains defined. Source provides operations but no explicit domain grouping. | |
| 35 | D — Spec.md §Constraints: no constraint IDs, categories, or sourcing | D | | Constraints stated in prose without CON-xxx IDs or category (system/process/regulatory). | |
| 36 | D — Spec.md §Non-Functional Requirements: no explicit NFR statements | D | | NFR candidates inferable (#2, #4, #15, #19) but none stated as testable NFRs with IDs. | |
| 37 | D — Spec.md §Out of Scope: no explicit out-of-scope declarations | D | | Partial coverage: S7 excludes GitHub write ops; §1 excludes bulk imports and admin ops. No structured out-of-scope section. | |
| 38 | D — Architecture.md §Constraint Traceability: no CON-xxx references exist yet | D | | Upstream gap — no Spec.md yet. Not actionable until Spec is drafted. | |
| 39 | D — Architecture.md §NFR Traceability: no NFR-xxx references exist yet | D | | Same upstream gap as #38. | |
| 40 | D — API.md §Authentication & Authorisation: no auth model described for MCP server | D | | Source is silent on how the MCP server authenticates callers or credentials external systems (Jira, SNOW, GitHub). Genuine gap. | |
| 41 | D — API.md §Error Format: no error envelope defined | D | | §1 mentions error handling lives in the MCP layer but no error response structure is defined. | |
