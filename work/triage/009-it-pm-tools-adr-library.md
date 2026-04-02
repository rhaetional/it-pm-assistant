# Triage — 009-it-pm-tools-adr-library

Source: `work/inputs/009-it-pm-tools-adr-library.zip` (extracted: 001-repo-layout.md, 002-branching-convention.md, 003-jira-project-and-isolation.md, 004-servicenow-ingest.md)
Source type: formal-design
Applicable scaffolds: `tpl-doc-architecture.md`, `tpl-doc-spec.md`, `tpl-doc-system-datamodel.md`
Pass 1 completed: 02.04.2026
Pass 2 completed: 03.04.2026
Status: PASS 2 COMPLETE

---

## Source: 001-repo-layout.md

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 1 | "Multiple independent scripts sharing the same Confluence API credentials and transport code had no shared home, causing auth logic to be duplicated" | A | [CONSTRAINT] | System constraint: shared auth/transport must have a single home. Directly relevant to our redesign's lib/backend boundary. | overlap: 011#12 — highest weight: formal-design (009); shared auth/transport centralisation pattern |
| 2 | "Python packaging was not a goal — scripts are run directly from the venv" | A | [CONSTRAINT] | Process/operational constraint on deployment model. Source: explicit design decision in old system. | |
| 3 | "`lib/confluence.py` — single source of truth for auth, HTTP transport, and the three core API operations" | A | [MECHANISM] | Pattern: centralised API client per external system. Directly applicable to our Confluence / Jira / ServiceNow integration layer design. | overlap: 002#33, 011#12 — highest weight: formal-design (002, 009); centralised API client pattern |
| 4 | "`tools/<tool-name>/` — one directory per script" | C | | Repo layout detail for old scripting system; not directly mappable to our redesign architecture. Low relevance. | |
| 5 | "`templates/` — config masks and page-type templates used by tools but belonging to the domain, not to any single tool" | A | [MECHANISM] | Template/domain artefacts separated from tool logic. Analogous to our scaffold/tpl separation. | overlap: 002#34 — highest weight: formal-design (002, 009); template/domain separation |
| 6 | "`seed/` — reference material and vendor proposals; not executed" | C | | Internal repo convention of old system; no direct home in our doc map. | |
| 7 | "`src/` layout with proper installable package was considered and rejected: `pip install -e .` conflicts with Homebrew-managed Python" | A | [REJECTED] | macOS Homebrew conflict as packaging constraint. Relevant if our redesign backend is Python. low — environment specifics may differ. | |
| 8 | "`sys.path.insert` approach is explicit, reproducible, and requires zero build tooling" | A | [DECISION] | Rationale for simple import strategy. Relevant context for our backend implementation choices. | |
| 9 | "`.gitignore` previously excluded `lib/` as a packaging artefact — this was corrected" | C | | Operational/housekeeping detail; not mappable to any doc section. | |
| 10 | **D — Gap** | D | | `tpl-doc-architecture.md` §Guiding Principles: no principle analogous to "prefer shared lib over per-tool duplication" stated explicitly. Absent from this source. | partially covered by 010#6, 010#9, 010#14, 011#6, 011#13 — implicit principles scattered |

---

## Source: 002-branching-convention.md

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 11 | "With multiple small, independent changes landing in quick succession it was unclear which commits belonged to which decision" | C | | Git workflow problem of old project; no home in our doc map. Not a system requirement. | |
| 12 | "A dedicated `CLAUDE.md` was added at the repo root to surface behavioral conventions to every Claude session automatically" | A | [MECHANISM] | Validates our CLAUDE.md-as-entry-point pattern. Confirms it works in practice. | overlap: 002#10, 008#6 — highest weight: formal-design (002, 009); CLAUDE.md-as-entry-point pattern |
| 13 | "`CLAUDE.md` — behavioral instructions… Updated whenever the *way we work* changes" / "`REPO_INDEX.md` — factual inventory… Updated whenever the *contents of the repo* change" | A | [DECISION] | Separation of behavioral instructions from factual inventory. Directly mirrors our `framework/CLAUDE.md` vs `work/todo.md` distinction. | overlap: 002#10, 008#6 — highest weight: formal-design (002, 009); behavioral vs factual file separation |
| 14 | "Branch name = ADR path creates a direct navigable link in both directions" | C | | Git traceability convention; no home in our architecture or spec docs. | |
| 15 | "Per-scope sequence numbers mean branch numbers always match ADR numbers within a tool — no global renumbering" | C | | Scoped numbering is a workflow detail; not applicable to our system design. | |
| 16 | "The pattern emerged during the initial build-out (six branches) and proved immediately useful: given a failing page, the branch name pointed directly to the relevant ADR without any searching" | B | [DECISION] | Evidence that ADR-per-decision discipline pays off operationally. Supports our `decisions/NNN-*.md` practice. Relevant to both Architecture and Spec (process constraint on documentation discipline). | overlap: 008#5, 003#28 — highest weight: formal-design (008, 009); ADR discipline confirmed by evidence |
| 17 | "More than one person works on the repo simultaneously — evaluate a PR review step and branch protection" | A | [OPEN] | Unresolved scaling question in old system. In our context: signals that multi-contributor workflow is a known future risk. | |
| 18 | **D — Gap** | D | | `tpl-doc-spec.md` §Constraints: no constraint on assistant/agent operation in multi-session or multi-user context present in this source. | UNCOVERED — no source defines multi-session/multi-user constraints |

---

## Source: 003-jira-project-and-isolation.md

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 19 | "Shared project: other team members' issues live in the same project. The API must not modify or inadvertently read issues it did not create." | A | [CONSTRAINT] | System constraint: Jira write isolation in a shared project. Critical safety requirement directly applicable to our redesign. Source: confirmed operational constraint. | converged: 008#20, 008#21, 002#11 — highest weight: formal-design (002, 008, 009); Jira write isolation in shared project |
| 20 | "Team-managed: custom fields can be added. Owner has admin rights." | A | [CONSTRAINT] | System constraint: IT-Architecture project is team-managed; extensibility via custom fields is available. Source: confirmed project configuration. | converged: 002#11, 008#20 — highest weight: formal-design (002, 008, 009); team-managed project extensibility |
| 21 | "`publish-initiative` is the only tool writing to Jira. All other tools are read-only at most." | A | [CONSTRAINT] | Process constraint: write-path isolation to a single tool/operation. Strong safety pattern directly applicable to our redesign's Jira domain. | overlap: 008#21 — highest weight: formal-design (008, 009); write-path isolation to single tool |
| 22 | "Custom field `Initiative ID` (type: text, e.g. `INI-001`). Add this field to the IT-Architecture project before the first API run." | A | [MECHANISM] | INI ID custom field as the primary cross-system identifier. Directly relevant to our stable-identity design. Field ID confirmed: `customfield_10422`. | converged: 002#2, 002#31, 008#19, 008#34 — highest weight: formal-design (002, 008, 009); INI ID custom field as cross-system identifier |
| 23 | "Label `ini-managed`. Applied at creation. Serves as a safety belt: any JQL query or update operation from this tooling always includes `labels = \"ini-managed\"` in its filter." | A | [MECHANISM] | Label-as-safety-belt pattern. Prevents accidental reads/writes to unmanaged issues. Directly adoptable for our redesign. | converged: 008#20 — highest weight: formal-design (008, 009); label-as-safety-belt pattern |
| 24 | "Back-reference in the INI file. Created issue keys are written back to the `Jira Epics` field in the relevant `INI-xxx.md`. The API uses these stored keys for direct access — it never searches for 'our' issues speculatively; it only touches keys it already knows about." | A | [MECHANISM] | Back-reference / no-speculative-search pattern. Highly relevant to our backend's cross-system mapping design. Avoids costly search on every operation. | overlap: 008#19 — highest weight: formal-design (008, 009); back-reference / no-speculative-search pattern |
| 25 | "`update_issue` (if added later) verifies the `ini-managed` label is present on the target issue before proceeding; raises `PermissionError` if not." | A | [MECHANISM] | Guard-check on write path: verify ownership label before mutation. Directly applicable to our Jira integration layer. | |
| 26 | "No bulk-update or bulk-delete functions. Destructive operations are issue-key-explicit only." | A | [CONSTRAINT] | Process/safety constraint: no bulk destructive operations. Should be a hard rule in our redesign's API layer. | overlap: 008#21 — highest weight: formal-design (008, 009); no bulk destructive operations |
| 27 | "Confirmed key: `ITARCH`" / `JIRA_PROJECT_KEY`, `JIRA_INITIATIVE_FIELD_ID=customfield_10422` | B | [CONSTRAINT] | Concrete Jira configuration: project key and custom field ID. Relevant to both Architecture (integration point) and Data Model (field mapping). Confirmed operational values. | overlap: 008#20, 008#39 — highest weight: formal-design (008, 009); project key and custom field ID confirmed |
| 28 | "JQL pattern for 'all our Epics': `project = <key> AND labels = \"ini-managed\" AND issuetype = Epic`" | A | [MECHANISM] | Canonical JQL query pattern for initiative-scoped Epics. Useful reference for our query design. | |
| 29 | **D — Gap** | D | | `tpl-doc-architecture.md` §Integration Points: no auth mechanism for Jira API is specified (only that credentials come from `.env`). Token type, rotation, and scoping are absent. | UNCOVERED — PAT vs OAuth2 decision open (011#8 raises but does not resolve) |
| 30 | **D — Gap** | D | | `tpl-doc-spec.md` §Non-Functional Requirements: no NFR for Jira write-safety / isolation auditing present in this source. | partially covered by 009#19-26 — isolation mechanisms described but not formalised as NFR |

---

## Source: 004-servicenow-ingest.md

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|
| 31 | "No API access is available (neither test nor production instance), so any integration must work without it." | A | [CONSTRAINT] | System constraint: ServiceNow integration is API-less; must rely on manual export. Critical boundary condition for our redesign. Source: confirmed operational constraint. | converged: 002#27, 004#26, 008#13 — highest weight: formal-design (002, 008, 009); no ServiceNow API |
| 32 | "A ServiceNow saved report exists that lists the user's projects/initiatives. It can be exported from the UI on demand." | A | [MECHANISM] | Manual export as the ServiceNow read mechanism. Validates our ingest-from-file approach. | overlap: 002#8 — highest weight: formal-design (002, 009); manual export as read mechanism |
| 33 | "JSON table export (`pm_project` → right-click → *Export* → *JSON*) contains the full record: all reference sys_ids, all narrative fields, and all metadata." | A | [MECHANISM] | JSON export is the canonical input format — preserves sys_ids and full narrative fields. CSV is lossy. Direct input specification for our ServiceNow ingest design. | overlap: 002#8 — highest weight: formal-design (002, 009); JSON export as canonical format |
| 34 | "CSV export… provides only a narrow, user-configured view with display-name column headers — it omits most fields." | A | [CONSTRAINT] | CSV is unsuitable for ingest: lossy, column-header dependent. Rejected format. Source: confirmed by testing. | overlap: 002#42 — highest weight: formal-design (002, 009); CSV is lossy/unsuitable |
| 35 | "Output: Excel file (`.xlsx`). Rationale: easy to inspect and share without tooling; row count (< 100 initiatives) makes a database unnecessary." | B | [DECISION] | Scale assumption: < 100 initiatives means file-based output is sufficient, no DB needed. Relevant to both Architecture (persistence mechanism) and Data Model (storage choice). | |
| 36 | "Default output path: `outputs/servicenow-snapshot-<YYYY-MM-DD>.xlsx`" | A | [MECHANISM] | Dated snapshot naming convention. Useful for our data model's versioning/snapshot design. | |
| 37 | "Temporary by design: this tool exists because no API access is available. Once a ServiceNow API connection is established, the read direction should be replaced with a direct API call and this tool retired." | A | [DECISION] | Explicit temporariness of manual ingest. Our redesign should carry this forward as an open/deferred item: ServiceNow API is a future migration target. | overlap: 008#14 — highest weight: formal-design (008, 009); manual ingest explicitly temporary |
| 38 | "`tools/servicenow-stub/` — Deprioritized but not removed. Planned mechanism for rendering a ServiceNow field block from an INI file when a new record must be created manually." | A | [OPEN] | Write direction for ServiceNow (manual stub render) is deferred. Our redesign inherits this gap. | overlap: 008#43 — highest weight: formal-design (008, 009); ServiceNow write direction deferred |
| 39 | "No credentials required for ingest — input is a local file. `SERVICENOW_BASE_URL` is read from `.env` only to construct direct record URLs from `sys_id`." | A | [CONSTRAINT] | System constraint: ServiceNow ingest is credential-free; only base URL needed for link construction. | |
| 40 | "Output files must be excluded from version control" | A | [CONSTRAINT] | Process constraint: snapshot outputs are not versioned artefacts. | |
| 41 | "When API access becomes available, this tool should be retired in favour of a direct pull." | A | [OPEN] | Future migration trigger: ServiceNow API access. Should appear in our Architecture open questions. | |
| 42 | **D — Gap** | D | | `tpl-doc-spec.md` §Operations: no operation defined for the write direction (ServiceNow record creation / stub render). Deferred in source but gap exists in our spec. | UNCOVERED — ServiceNow write direction explicitly deferred |
| 43 | **D — Gap** | D | | `tpl-doc-architecture.md` §Integration Points: no description of ServiceNow sys_id structure or how URLs are constructed from it. | UNCOVERED — no source specifies sys_id structure or URL construction rules |
