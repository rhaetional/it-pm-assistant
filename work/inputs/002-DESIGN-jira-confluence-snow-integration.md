## Problem Statement

A senior IT architect needs to track initiatives from initial idea through to delivered SNOW project, with structured linkage across Confluence (documentation), Jira (delivery tracking), and ServiceNow (ITIL/project governance). No single system covers the full lifecycle, cross-system traceability is currently manual, and there is no authoritative source of truth for which Confluence documentation, Jira epic, and SNOW project belong to the same initiative. The tool solves this by assigning a persistent initiative identity at inception, owning the cross-system mapping, and providing both human (CLI) and AI (MCP) interfaces for querying and maintaining that mapping.

---

## Design Concept

The solution is a thin integration layer that treats Confluence, Jira, and ServiceNow as distributed storage rather than replicating their data into a proprietary store. An initiative begins as an idea captured on a Confluence page; the tool assigns a stable identifier (INI-NNNN) at that point and records it in the page's Page Properties macro. The Confluence anchor page is the persistent root of the initiative — it exists from inception through closure and is never replaced.

As the initiative matures, a Jira epic is created (manually or by the tool) and a ServiceNow project is raised. The tool owns the mapping between all three identifiers and writes them back into the Confluence Page Properties macro, which becomes the human-readable and machine-readable source of truth. A local SQLite index is a materialised cache of what is in Confluence, rebuilt by crawling the space and reading Page Properties values. It is ephemeral: losing it does not lose data.

ServiceNow data enters the tool via periodic batch export (JSON reports filtered by scope). Jira data is read and written via REST API. Confluence is both read and written via REST API. The tool exposes its core functions as CLI commands and as an MCP server, allowing Claude to act as a project management assistant over the same underlying operations.

---

## Information Architecture

**Space**: IT Architecture (single space, admin rights, clean slate).

**Top-level sections** (children of space root):

```
Project Working Spaces
  ├── [Index page]         — Page Properties Report: status=Active AND snow-project-id set
  ├── Active               — initiatives with SNOW project, in execution
  ├── Pipeline             — ideas and approved initiatives not yet in SNOW
  ├── Completed
  └── Cancelled

Enterprise Architecture (EA)
  ├── [Variant TBD — see Open Questions]
  └── ...

Process & Improvement (PROC)   — provisional, not finalised
  └── ...
```

**Initiative anchor page** lives in exactly one status folder at any time. It carries the Page Properties macro and is the canonical record for the initiative. Its child pages are created by the tool at scaffold time from a configurable template.

**Child page structure** (titles configurable via external template file, not hardcoded):

```
[Initiative Name]         ← anchor: INI ID + Page Properties macro
  ├── Brief & Scope
  ├── Design Documents    ← feeds SNOW design doc review gate
  ├── Decision Log
  ├── Meeting Notes
  └── Post-Implementation Review   ← populated after SNOW post-impl review
```

**Page Properties fields** on anchor page:

| Field | Stage populated | Authority |
|---|---|---|
| `ini-id` | Inception | Tool |
| `status` | Inception | Tool / human |
| `domain` | Inception | Human |
| `title` | Inception | Human |
| `jira-epic` | On epic creation | Tool |
| `snow-project-id` | On SNOW project creation | Tool |
| `last-sync` | Each sync | Tool |

**Status → folder mapping**:

| Status | Folder | SNOW project expected |
|---|---|---|
| Draft | Pipeline | No |
| Approved | Pipeline | No |
| Active | Active | Yes |
| Completed | Completed | Yes |
| Cancelled | Cancelled | Either |

**Domain vocabulary**: must match EA domain taxonomy (Application, Data, Integration, Infrastructure, Security, and others TBD). Defined as controlled vocabulary in scaffold template config.

**Architecture documents** that graduate from an initiative are moved to the EA section manually and exit the tool's concern. The reference from the initiative (if captured) lives in the initiative's Decision Log or Page Properties — not managed by the tool.

---

## Integration Points

### Confluence ↔ Tool (primary read/write)

- **Trigger**: scaffold command (create); sync command (update); housekeep command (move).
- **Data written**: anchor page + child skeleton on scaffold; Page Properties macro values (`jira-epic`, `snow-project-id`, `status`, `last-sync`) on sync; page parent (folder) on housekeep.
- **Data read**: Page Properties values from all anchor pages to rebuild SQLite index; page body sections (by heading) to answer PM queries.
- **Authority**: tool owns `ini-id`, `last-sync`, `jira-epic`, `snow-project-id`. Human owns `status`, `domain`, `title`, prose sections (Brief & Scope, Design Documents, Decision Log, Meeting Notes, Post-Implementation Review). Tool never overwrites prose sections.
- **Format**: Confluence Storage XML for read/write; Page Properties macro for structured fields.

### Confluence ↔ Jira

- **Trigger**: manual scaffold (epic creation) or tool sync (epic status read-back).
- **Data written to Confluence**: `jira-epic` key written to Page Properties on scaffold or first link.
- **Data read from Jira**: epic summary, status, optionally linked issues — stored in SQLite index, not written back to Confluence prose.
- **Authority**: Jira owns all delivery tracking data. Confluence holds only the Jira key as a cross-reference.

### Confluence ↔ ServiceNow

- **Trigger**: periodic batch sync from SNOW JSON export.
- **Data written to Confluence**: `snow-project-id` written to Page Properties once linked; ITIL Linkage section tables updated on sync (projects only in initial scope; RLSE and CHG deferred).
- **Authority**: SNOW owns all ITIL/project governance data. Confluence holds SNOW IDs as cross-references and human-readable tables derived from exports.

### Jira ↔ ServiceNow

- **No direct integration**. The tool index holds the mapping; neither system references the other directly.

### ServiceNow → Tool (ingest)

- **Trigger**: manual batch sync, initiated by operator placing export file(s) in expected location and running sync command.
- **Format**: JSON export from SNOW reports, filtered to desired scope. Schema mapping is configurable (YAML) per export type to accommodate instance-specific field names.
- **Scope**: projects only in initial implementation. `raw` JSON row preserved in index for future use.

---

## Key Design Decisions

- **Confluence page as initiative anchor**: The initiative container page (not Brief & Scope or any other child) is the canonical root. It exists from idea through closure and is never replaced. Rationale: single stable document whose identity can carry the INI ID and cross-system references throughout the full lifecycle.

- **Tool-assigned INI ID as primary key**: Format `INI-NNNN`, sequential, stored in Confluence Page Properties. Rationale: SNOW, Jira, and Confluence IDs come into existence at different lifecycle stages; only a tool-assigned ID can be present from inception. Decouples the index from any single system's lifecycle.

- **SQLite index as ephemeral cache**: Source of truth is Confluence Page Properties. Index is rebuilt by crawling the space. Rationale: survivability — losing the index loses no data; also simplifies the operational footprint.

- **Tool owns cross-system mapping**: The mapping between INI ID, SNOW project ID, Jira epic key, and Confluence page ID is the tool's responsibility. No system references another directly. Rationale: avoids coupling system configurations; mapping logic and validation is centralised.

- **Batch sync from SNOW exports**: No direct SNOW API integration in initial scope. Rationale: existing working JSON import from SNOW reports; avoids SNOW API authentication complexity (OAuth2/MFA constraints noted from prior work).

- **Existing API tooling as adapters**: Working Jira/Confluence API tooling from the previous tool is reused as-is. The design defines input/output contracts; adapter internals are not redesigned.

- **Storage XML for Confluence writes**: Tool uses Confluence Storage Format (XML) for programmatic page creation and targeted section updates, not ADF. Rationale: easier to manipulate with standard XML tooling; v1 API sufficient for the write patterns required.

- **Scaffold templates externalised**: Child page structure and stub content defined in a configuration file (YAML or Markdown), not hardcoded. Rationale: sections are not yet final; template changes must not require code changes.

- **Tool housekeep command for folder moves**: Status changes do not automatically move pages. A `housekeep` command compares PP status to current parent folder and moves mismatches. Rationale: more observable and auditable than Confluence automation; no dependency on Confluence automation licence tier.

- **Prose sections are human-owned**: Tool never overwrites Brief & Scope, Design Documents, Decision Log, Meeting Notes, Post-Implementation Review content. Only Page Properties macro values and structured tables (ITIL Linkage) are updated programmatically.

- **MCP transport via stdio**: Initial MCP server implementation uses stdio transport. Rationale: no network port or MCP-side auth layer required; compatible with Claude Desktop/Code.

- **RLSE and CHG deferred**: Index schema and Confluence template include placeholders for Release and Change linkage but nothing is built against them in initial scope.

---

## Constraints & Assumptions

- Confluence template API (`templateId` on content creation) supports body application but not variable substitution at API time. Template variable substitution is a UI-time feature only. **Assumed**: tool-owned scaffold templates in Storage XML are used instead; no dependency on Confluence-managed templates.
- Page Properties Report macro on the index page filters on `status=Active` and presence of `snow-project-id`. **Unverified**: whether PP Report supports a "field is non-empty" filter condition in this Confluence instance.
- Confluence automation (trigger on PP field change → move page) may not be available depending on instance plan/licence tier. Tool housekeep command is the primary mechanism; automation is a future convenience layer.
- SNOW JSON export field names vary by instance. Schema mapping must be configurable. **Assumed**: the existing working JSON import can be adapted or referenced as the schema mapping reference.
- The EA space structure (Variant 1 vs Variant 2) is not finalised. The tool operates only on Project Working Spaces; EA structure does not affect tool design.
- Domain vocabulary is not yet defined. A controlled list must be established before scaffold templates are finalised.
- INI ID sequence counter: simplest implementation is `MAX(id) + 1` from the index or a dedicated counter row. **Assumed**: no concurrent scaffold operations requiring atomic counter reservation.
- Jira/Confluence authentication via Personal Access Token stored in environment/config. No OAuth2 flow in scope.

---

## Open Questions

- What is the final child page structure for initiative working spaces? (Noted as not final.)
- EA space structure: Variant 1 (hierarchical by domain) or Variant 2 (flat by concern)? Not resolved.
- Does Process & Improvement (PROC) form part of the space? Marked provisional.
- Does the SNOW JSON export include a direct relationship between projects and problem records, or does a separate problems export filtered by parent project ID need to be defined?
- When an architecture document graduates from an initiative to the EA library, is the cross-reference (initiative → EA page) captured anywhere, and if so, where?
- Should the `housekeep` command be run manually only, or is scheduled/automated execution (e.g. as a cron job or post-sync step) required?
- Is Confluence automation available and licenced on the target instance? (Relevant if automation-triggered page moves are desired later.)
- Final controlled vocabulary for the `domain` field.