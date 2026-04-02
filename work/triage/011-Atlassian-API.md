# Triage — 011-Atlassian-API

Source: `work/inputs/011-Atlassian-API.md`
Applicable scaffolds: `tpl-doc-architecture.md`, `tpl-doc-system-api.md`
Pass 1 completed: 03.04.2026
Status: AWAITING REVIEW

---

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | "`atlassian-python-api` — Community-maintained, not officially supported by Atlassian" | A | `[CONSTRAINT]` | Maps to Architecture.md Integration Points (dependency risk). Confidence: explicit. | |
| 2 | "Coverage is inconsistent — some endpoints are wrapped, others aren't, and the wrappers often lag behind API changes" | A | `[CONSTRAINT]` | Reliability constraint on `atlassian-python-api`; substantiates rejection rationale. | |
| 3 | "Abstracts away things you'll want control over (pagination strategy, error handling, retry logic)" | A | `[REJECTED]` | Part of rejection rationale for `atlassian-python-api`; pairs with #7. | |
| 4 | "Confluence v2 API and Jira's newer endpoints are poorly covered" | A | `[CONSTRAINT]` | Coverage gap in `atlassian-python-api`; relevant to API.md Conventions (versioning). | |
| 5 | "`jira` (PyPI) — Official-ish but similarly thin and patchy. Mainly covers Jira; no Confluence" | A | `[REJECTED]` | Explicit rejection of `jira` library; no Confluence coverage disqualifies it for this system. | |
| 6 | "My recommendation: raw `httpx` (or `requests`) with a thin wrapper you own" | A | `[DECISION]` | Significant architectural choice — warrants ADR. Confidence: explicit recommendation, not yet formally decided. | |
| 7 | "The libraries buy you very little and cost you: debugging through an abstraction layer … waiting for library updates … loss of fine-grained control" | A | `[REJECTED]` | Consolidated rationale for rejecting both libraries; supports #6. | |
| 8 | "Auth (PAT or OAuth2, injected once)" | B | `[REQUIREMENT]` | Multi-home: Architecture.md Integration Points (auth column) + API.md Authentication & Authorisation. Auth mechanism not yet decided between PAT and OAuth2 — latent `[OPEN]`. | |
| 9 | "Pagination handling (Confluence uses `start`/`limit`; Jira uses `startAt`/`maxResults` — both need cursor management)" | B | `[MECHANISM]` | Multi-home: Architecture.md Components (HTTP client) + API.md Conventions. Confluence and Jira pagination models documented explicitly. | |
| 10 | "Rate limit handling (429 with `Retry-After`)" | B | `[REQUIREMENT]` | Multi-home: Architecture.md Integration Points (constraints column) + API.md Conventions (rate limits). | |
| 11 | "A typed response model layer (Pydantic works well here)" | A | `[MECHANISM]` | Maps to Architecture.md Components (data model / HTTP client). Library choice (Pydantic) is implementation detail — belongs in system/*, not Architecture.md per scaffold rule. | |
| 12 | "A thin client class per product (~100–150 lines each)" | A | `[MECHANISM]` | Component structure decision: one client per Atlassian product. Influences Architecture.md Component Overview. | |
| 13 | "No dependency drift risk" | A | `[CONSTRAINT]` | Dependency stability as a constraint; supports rejection of third-party libraries (#6, #7). | |
| 14 | "Given your SQLite-cache + MCP architecture, you'll also want to keep the HTTP layer clean so you can mock it easily in tests" | A | `[CONSTRAINT]` | Testability constraint on HTTP layer design; references existing architectural context (SQLite cache, MCP). Confidence: low — assumes prior decisions not yet confirmed in doc/. | |
| 15 | "If you only need a handful of simple read operations and time-to-working-code matters more than robustness, `atlassian-python-api` gets you there faster" | A | `[REJECTED]` | Conditional exception acknowledged but explicitly rejected for this system's scope ("initiative management tool"). | |
| 16 | D — API.md: Overview (what the API surface exposes, to whom, in what style) | D | | Scaffold section unaddressed by this input. | |
| 17 | D — API.md: Error Format (standard error response structure) | D | | Scaffold section unaddressed; #10 covers 429 only, not the general error envelope. | |
| 18 | D — API.md: Endpoints / Operations (request/response schemas per endpoint) | D | | Scaffold section unaddressed; this input describes the client strategy, not the endpoint contracts. | |
| 19 | D — Architecture.md: Guiding Principles (trade-off statements) | D | | Not present in this input; #6/#13 imply principles (control over convenience, stability over speed) but they are not stated as explicit principles. | |
| 20 | D — Architecture.md: Data Flow (how data moves through components) | D | | Not addressed. | |
| 21 | D — Architecture.md: Constraint / NFR Traceability tables | D | | No Spec.md CON-xxx or NFR-xxx IDs to trace against — Spec not yet locked. Informational gap at this stage. | |
