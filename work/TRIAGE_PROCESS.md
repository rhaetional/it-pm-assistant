# Input Triage Process

Pre-processing phase. Run once per input file, before any production loop phase
begins. Produces a stable inventory that all subsequent document phases draw from.

## Flow

```
work/inputs/NNN-*.md
    → Pass 1 → work/triage/NNN-*.md     (classification table; human review checkpoint)
    → Pass 2 → work/inventory/NNN-*.md  (confirmed items, tagged; feeds STRATEGY.md Step 2)
```

---

## Pass 1 — Input Triage

You are reading a single raw input file. Your job is to classify every distinct
claim, requirement, decision, constraint, or proposal it contains — before any
inventory tagging occurs. Do not write to any `doc/*` or `work/inventory/` file.

### Reference
- Document map: `framework/CLAUDE.md` (File Map section)
- Gap reference: the scaffold template for the target document (`framework/scaffold/tpl-*.md`)
  — not the file list. Identify which template applies before scanning for gaps.

### Classification

For each item, assign one classification:

| Code | Meaning |
|------|---------|
| A | **Clear home** — maps to exactly one target doc |
| B | **Multi-home** — belongs in more than one doc |
| C | **No home** — no clear target in the document map |
| D | **Gap** — required by the scaffold template but absent from this source |
| E | **Contradiction** — conflicts with another claim within this file |

### Output

Write `work/triage/NNN-*.md` (NNN mirrors the input file number).

Table format:

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes |
|---|-----------------------------------|----------------|---------------|-------|

**Candidate tag** is a forward hint for Pass 2. Use the Step 2 vocabulary from
`framework/STRATEGY.md`: `[REQUIREMENT]` `[CONSTRAINT]` `[DECISION]` `[MECHANISM]`
`[OPEN]` `[REJECTED]`. Leave blank for D rows or if genuinely unclear.

**Notes** — use for:
- Confidence: `low` (inferred, not explicit)
- Within-file contradiction partner: `conflicts with #N`
- Scope ambiguity or noise explanation

### Rules
- One row per discrete item. Split compound claims.
- D (gap) rows have no source fragment — state which scaffold section is unaddressed.
- E (contradiction) rows appear twice: once for each conflicting item, cross-referenced.
- Cross-file contradictions are out of scope here — flagged in STRATEGY.md Step 3.
- Do not resolve anything. Classify and flag only.

Human reviews `work/triage/NNN-*.md` and confirms which items proceed to Pass 2.

---

## Pass 2 — Inventory Extraction

Source: confirmed A and B items from `work/triage/NNN-*.md`
Output: `work/inventory/NNN-*.md`

Apply the standard Step 2 tags from `framework/STRATEGY.md`. This file then feeds
directly into the production loop — no further pre-processing required.
