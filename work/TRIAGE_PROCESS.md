# Input Triage Process

Pre-processing phase. Run before any production loop phase begins. Produces a
stable, cross-checked inventory that all subsequent document phases draw from.

## Flow

```
work/inputs/NNN-*.md (all files)
    → Pass 1 → work/triage/NNN-*.md     (per-file classification table)
    → Pass 2 → work/triage/NNN-*.md     (cross-input annotations added in place; human review checkpoint)
    → Pass 3 → work/inventory/NNN-*.md  (confirmed items, tagged; feeds STRATEGY.md Step 2)
```

Pass 1 runs once per input file, independently. Pass 2 requires all Pass 1
tables to exist before it begins — do not start Pass 2 until every input file
has a triage table.

---

## Pass 1 — Per-File Classification

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

### Header

Every triage file must open with this header, immediately followed by `---`:

```
# Triage — {NNN-filename-stem}

Source: `work/inputs/{NNN-filename}.md`
Applicable scaffolds: `tpl-doc-foo.md`, `tpl-doc-bar.md`
Pass 1 completed: DD.MM.YYYY
Status: AWAITING REVIEW
```

- **Title** — use the full input filename stem (e.g. `001-Inferred-ServiceNow-Structure`).
- **Source** — exact relative path to the input file; preserves provenance for Pass 2.
- **Applicable scaffolds** — one or more `tpl-*.md` names from `framework/scaffold/`; determines which gap rows are relevant.
- **Pass 1 completed** — date in DD.MM.YYYY format; add a `Pass 2 completed:` line in place when Pass 2 runs.
- **Status** — `AWAITING REVIEW` until the human review checkpoint clears; then `REVIEWED` or `PASS 2 COMPLETE`.

### Output

Write `work/triage/NNN-*.md` (NNN mirrors the input file number).

Table format:

| # | Source (section / quote fragment) | Classification | Candidate tag | Notes | Cross-input notes |
|---|-----------------------------------|----------------|---------------|-------|-------------------|

Leave **Cross-input notes** blank — populated by Pass 2.

**Candidate tag** is a forward hint for Pass 3. Use the Step 2 vocabulary from
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
- Cross-file contradictions are out of scope here — handled in Pass 2.
- Do not resolve anything. Classify and flag only.

---

## Pass 2 — Cross-Input Screening

Prerequisite: all Pass 1 triage tables exist. Read all `work/triage/NNN-*.md`
files together. Do not write to any `doc/*` or `work/inventory/` file.

Annotate the **Cross-input notes** column in the existing triage tables. Three
checks, in order:

**Overlap** — items across files that describe the same concept or requirement.
Annotate each with `overlap: NNN#M` referencing every counterpart. Do not merge
or resolve; flag only. The human reviewer decides which wording is canonical.

**Cross-file contradiction** — items across files that conflict. Annotate each
with `X-conflicts: NNN#M`. Both rows get the annotation, cross-referenced.
Same discipline as within-file E rows: flag, do not resolve.

**Gap coverage** — for each D row, check whether another input addresses that
scaffold section. If covered, annotate the D row: `covered by NNN#M`. A covered
D row is informational; an uncovered D row is a genuine gap requiring resolution
before drafting.

Human reviews all triage tables (Pass 1 classifications + Pass 2 annotations)
and confirms which items proceed to Pass 3.

---

## Pass 3 — Inventory Extraction

Source: confirmed A and B items from `work/triage/NNN-*.md` (post-review)
Output: `work/inventory/NNN-*.md`

Apply the standard Step 2 tags from `framework/STRATEGY.md`. This file then feeds
directly into the production loop — no further pre-processing required.
