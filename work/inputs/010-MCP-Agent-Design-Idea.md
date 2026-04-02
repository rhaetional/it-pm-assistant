# MCP Agent Design Ideas — Initiative Management Tool
<!-- Source: design conversation, 03.04.2026 -->

## Purpose

This document captures design insights from an exploratory conversation on
MCP architecture as input to the specification of the AI-assisted initiative
management tool.

---

## 1. MCP as the Unified Tool Surface

**Insight:** All agent-facing operations — database queries, Jira API calls,
SNOW reads, file operations — should be abstracted through a single MCP
server. The agent has one coherent interface regardless of what sits behind
each tool.

**Benefits:**
- Auth, error handling, logging, and retry logic live in one place
- Tools compose naturally into chains (retrieve → act → write back)
- Adding a new tool doesn't require changes to the agent config or prompt

**Constraint:** Only wrap operations the agent should be able to invoke
autonomously. Bulk imports, admin ops, and anything irreversible without
human confirmation should stay outside the MCP surface or require explicit
confirmation semantics.

---

## 2. Token Efficiency Through Retrieval Precision

**Insight:** The primary token saving from MCP is not the protocol itself but
the architecture it encourages: narrow, purposeful tools that return only
signal.

**Implication for tool design:**
- Prefer `list_initiatives_missing_jira_link()` over returning all initiative
  records and letting the agent filter
- Return structured JSON, not prose blobs — the agent doesn't need to parse
  markdown to extract a status field
- The SQLite cache layer is the right place for gap detection logic, not the
  agent's reasoning loop

**Rule of thumb:** If the agent would need to read a document to answer a
question, the question belongs in a tool.

---

## 3. Procedural Enforcement as Tools

**Insight:** MCP tools are not limited to data access. They can encode
governance procedures — fixed sequences the agent executes when it recognises
a triggering condition.

**Example:** When a change warrants a decision record:
1. `create_feature_branch(initiative_id, description)` — consistent naming,
   linked to initiative
2. `scaffold_adr(initiative_id, branch, title)` — stub created in correct
   location with correct frontmatter, registered in DB as Draft
3. Agent returns fill-out instructions to the user

**Properties:**
- The agent recognises *when* to invoke the procedure; the tool executes *how*
- Rules are version-controlled and applied consistently — not held in anyone's
  head
- Same pattern applies to other fixed procedures (e.g. BI Publisher branch
  convention)

**Scope constraint:** Each tool encodes one procedure. Do not build policy
engines into tools.

---

## 4. Instructions as Return Values

**Insight:** When a tool creates an artefact the agent or user must complete,
fill-out instructions should be part of the tool's return value — not
embedded in the system prompt.

**Rationale:**
- Instructions travel with the artefact reference; they cannot be
  decoupled or forgotten
- Updating guidance requires changing the tool only — no prompt
  maintenance
- The pattern generalises: any scaffolding tool should return
  `{ file, instructions }` as a minimum

**Example return structure for `scaffold_adr`:**
```json
{
  "file": "docs/decisions/003-event-bus-selection.md",
  "adr_number": 3,
  "instructions": "Fill out Context (situation forcing the decision), Decision (one clear statement), Consequences (concrete), Alternatives (non-obvious only). Status stays Draft until approved."
}
```

**Refinement:** Instructions can be enriched with initiative-specific context
pulled from SQLite at scaffold time — current status, open dependencies,
linked SNOW/Jira refs — so the agent can draft a meaningful Context section
without a subsequent lookup.

---

## 5. Dynamic Discovery vs. Effective Use

**Insight:** MCP's `tools/list` provides dynamic discovery at session start.
In practice, agent prompting often names tools explicitly anyway — because an
LLM reasons better knowing what's available upfront.

**Practical implication:** Don't design the system prompt around discovery.
Use `tools/list` for its operational benefit (new tools appear automatically
without client config changes) but document the intended tool set explicitly
in `CLAUDE.md` or equivalent.

---

## Derived Specification Inputs

| # | Input |
|---|-------|
| S1 | All agent-callable operations exposed through a single MCP server |
| S2 | Tool interfaces designed for retrieval precision — narrow inputs, structured returns |
| S3 | Gap detection logic implemented in SQLite layer, surfaced via dedicated query tools |
| S4 | Procedural tools (branch creation, ADR scaffolding) included in MCP surface |
| S5 | Scaffolding tools return `{ file, instructions }` as a standard contract |
| S6 | Instructions enriched with initiative-specific SQLite context at scaffold time |
| S7 | GitHub write ops (commit, push) excluded from agent autonomy; procedural scaffolding permitted |
| S8 | Tool set documented explicitly in governance file; dynamic discovery used operationally only |