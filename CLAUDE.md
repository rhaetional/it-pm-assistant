# CLAUDE.md
<!-- Agent instructions. Read before any action. Production process: framework/STRATEGY.md. -->
<!-- Path note: doc/, decisions/, work/, manual/ are instance-root paths — they live outside
     framework/ in the consumer repo. scaffold/ is at framework/scaffold/. -->

## Purpose
<!-- TODO: one sentence — mirrors Guiding Star in framework/STRATEGY.md -->

## File Map
```
framework/
  CLAUDE.md          # this file — agent operating instructions
  STRATEGY.md        # production process
  scaffold/          # schema layer — read before drafting
    tpl-doc-overview.md
    tpl-doc-spec.md
    tpl-doc-architecture.md
    tpl-doc-system-api.md
    tpl-doc-system-datamodel.md
    tpl-decisions.md            # ADR template
    tpl-doc-test.md             # deferred
    tpl-manual.md               # deferred
doc/               # instance: product docs, dependency-ordered
  Overview.md      # guiding star
  Spec.md
  Architecture.md
  system/API.md
  system/Data Model.md
  test/            # deferred
  Roadmap.md
decisions/         # instance: ADRs
  NNN-*.md
work/              # instance: working files
  todo.md          # open points + change records
  inputs/NNN-*.md  # raw source material
  inventory/NNN-*.md # tagged extraction (mirrors input NNN)
manual/            # instance: user docs [deferred]
```

## Conventions
**Naming:** `NNN-*.md` — three-digit zero-padded. Inventory NNN mirrors input NNN.
**Dates:** DD.MM.YYYY
**Status header** (every `doc/*` file):
```
<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->
```
LOCKED → no edits. Changes → change record in `work/todo.md` only.

## Rules
Read only the files your task requires — do not load files speculatively.
Map structure first (directory listing, file sizes, line counts, first/last lines) — then target reads to the specific files and ranges the task requires.

1. Read scaffold template before drafting. Template = schema = definition of done.
2. Never edit a LOCKED document. Append change record to `work/todo.md`; await instruction.
3. Unresolvable conflict or gap → `<!-- OPEN: description -->`. Never fill with a guess.
4. One document at a time. Predecessor must be LOCKED before derivative begins.
5. ADRs trigger on decisions, not phases. Create immediately when a significant choice is made.
6. Every constraint must be attributed (system / process / decision). Unattributed → label as assumption.

## Skill Routing
| Task | Skill |
|---|---|
| Draft/update `doc/*` | `/documentation` |
| `doc/Spec.md` (scope/domain analysis, steps 1–5) | `/system-design` + `/documentation` |
| `doc/Architecture.md` or `doc/system/*` | `/system-design` |
| Create/review `decisions/NNN-*.md` | `/architecture` |
| Adversarial critique (production loop step 6) | `/tech-debt` |
| `doc/test/*` | `/testing-strategy` |

## Session Start
- Always: check `work/todo.md` for open items; confirm target document status.
- Structural, cross-file, or process work: read `framework/STRATEGY.md`.
- Scaffold edits: read the relevant `scaffold/tpl-*.md`.
- Single-file targeted edits: no additional reads required.
